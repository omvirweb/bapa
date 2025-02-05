<?php


class SyncController extends CI_Controller
{
    public function index()
    {
        $this->load->view('sync_view');  // Load the sync view
    }

    public function sync_data()
    {
        try {
            $remote_db = $this->load->database('remote', TRUE);
            $local_db = $this->load->database('default', TRUE);

            if (!$remote_db->initialize() || !$local_db->initialize()) {
                throw new Exception("Database connection failed");
            }

            $local_db->trans_start();
            $sell_id_mapping = [];

            // Get max sell_no from local database
            $maxSellNo = $local_db->select_max('sell_no')->get('sell')->row()->sell_no;
            $nextSellNo = $maxSellNo ? $maxSellNo + 1 : 1;

            // Get max sell_item_no from local database
            $maxSellItemNo = $local_db->select_max('sell_item_no')->get('sell_items')->row()->sell_item_no;
            $nextSellItemNo = $maxSellItemNo ? $maxSellItemNo + 1 : 1;

            // Sync sell table
            $sellQuery = $remote_db->get('sell');
            if ($sellQuery === FALSE) {
                throw new Exception("Failed to fetch sell data: " . $remote_db->error()['message']);
            }
            $sellData = $sellQuery->result_array();

            if (!empty($sellData)) {
                foreach ($sellData as $sell) {
                    // Update account
                    $accountQuery = $local_db->where('account_id', $sell['account_id'])->get('account');
                    if ($accountQuery === FALSE) {
                        throw new Exception("Failed to fetch account data");
                    }
                    $accountData = $accountQuery->row_array();

                    $updates = [
                        'gold_fine' => number_format((float) $accountData['gold_fine'] + (float) $sell['total_gold_fine'], 3, '.', ''),
                        'silver_fine' => number_format((float) $accountData['silver_fine'] + (float) $sell['total_silver_fine'], 3, '.', ''),
                        'amount' => number_format((float) $accountData['amount'] + (float) $sell['total_amount'], 2, '.', ''),
                        'c_amount' => number_format((float) $accountData['c_amount'] + (float) $sell['total_c_amount'], 2, '.', ''),
                        'r_amount' => number_format((float) $accountData['r_amount'] + (float) $sell['total_r_amount'], 2, '.', '')
                    ];

                    if (!$local_db->where('account_id', $sell['account_id'])->update('account', $updates)) {
                        throw new Exception("Failed to update account");
                    }

                    $old_sell_id = $sell['sell_id'];
                    unset($sell['sell_id']);
                    $sell['sell_no'] = $nextSellNo++;

                    if (!$local_db->insert('sell', $sell)) {
                        throw new Exception("Failed to insert sell record");
                    }
                    $sell_id_mapping[$old_sell_id] = $local_db->insert_id();
                }
            }

            // Sync sell_items table
            $itemsQuery = $remote_db->get('sell_items');
            if ($itemsQuery === FALSE) {
                throw new Exception("Failed to fetch sell_items data");
            }
            $itemsData = $itemsQuery->result_array();

            if (!empty($itemsData)) {
                foreach ($itemsData as $item) {
                    unset($item['sell_item_id']);
                    $item['sell_item_no'] = $nextSellItemNo++;

                    if (isset($sell_id_mapping[$item['sell_id']])) {
                        $item['sell_id'] = $sell_id_mapping[$item['sell_id']];
                    }

                    if (!$local_db->insert('sell_items', $item)) {
                        throw new Exception("Failed to insert sell_items record");
                    }
                }
            }

            if ($local_db->trans_status() !== FALSE) {
                $remote_db->truncate('sell_items');
                $remote_db->truncate('sell');
            }

            $local_db->trans_complete();

            if ($local_db->trans_status() === FALSE) {
                throw new Exception("Transaction failed");
            }

            $response = [
                'status' => 'success',
                'message' => "Successfully synced " . count($sellData) . " sells and " . count($itemsData) . " items",
                'count' => count($sellData) + count($itemsData)
            ];
        } catch (Exception $e) {
            log_message('error', 'Sync Error: ' . $e->getMessage());

            $response = [
                'status' => 'error',
                'message' => 'Sync failed: ' . $e->getMessage(),
                'count' => 0
            ];
            if (isset($local_db) && $local_db->trans_status() !== NULL) {
                $local_db->trans_rollback();
            }
        }

        // Return JSON response
        header('Content-Type: application/json');
        echo json_encode($response);
    }

    // Helper function to check database connection
    private function verify_db_config($db)
    {
        $config = [
            'hostname' => $db->hostname,
            'username' => $db->username,
            'database' => $db->database
        ];
        return $config;
    }
}
?>
<?php

defined('BASEPATH') or exit('No direct script access allowed');

//loading datatable library
if (!function_exists('load_datatables_library')) {
    function load_datatables_library($config = []) {
        $CI =& get_instance(); // Get the CI instance

        // Load the Datatables library
        $CI->load->library('datatables', $config, 'datatable');

        return $CI->datatable; // Return the initialized Datatables instance
    }
}

//load AppLib library
if (!function_exists('get_applib_instance')) {
    function get_applib_instance() {
        $CI =& get_instance(); // Get CI instance

        // Load the Applib library (if not already loaded)
        $CI->load->library('applib');

        return $CI->applib; // Return the instance of Applib
    }
}

//call reports controller get opening balance function
if (!function_exists('call_reports_controller_opening_balance_function')) {
    function call_reports_controller_opening_balance_function() {
        $CI =& get_instance(); // Get the CI instance
        
        // Load required libraries (especially session)
        $CI->load->library('session');  

        // Load the Reports controller
        $CI->load->library('../controllers/Reports'); 

        // Call the function from Reports controller
        return $CI->reports->get_opening_stock_ledger();
    }
}

//get stock status datatable
if (!function_exists('get_stock_status_datatable')) {
    function get_stock_status_datatable() {  
        $post_data = $_POST;  
        $className = null;
        $totalRecodsCountForDatatable = null;
        $CI =& get_instance(); // Get the CI instance
        $crud_model = $CI->load->model('Crud');    
        $crud_model = $CI->load->model('AppModel');    
        $gold_rate = $CI->Crud->get_column_value_by_id('settings', 'settings_value', array('settings_key' => 'gold_rate'));
        $silver_rate = $CI->Crud->get_column_value_by_id('settings', 'settings_value', array('settings_key' => 'silver_rate'));

        $use_rfid = $CI->Crud->get_column_value_by_id('settings', 'settings_value', array('settings_key' => 'use_rfid'));
        $use_barcode = $CI->Crud->get_column_value_by_id('settings', 'settings_value', array('settings_key' => 'use_barcode'));
        $config['table'] = 'item_stock s';
        if (isset($post_data['include_wstg']) && $post_data['include_wstg'] == 'true') {
            $config['select'] = '`s`.`department_id`, `s`.`category_id`, `s`.`item_id`, `s`.`item_stock_id`, `s`.`tunch`, `s`.`rfid_created_grwt`,`cat`.`category_name`, `im`.`item_name`, `im`.`stock_method`, `cat`.`category_group_id`,SUM(s.grwt) AS grwt,SUM(s.ntwt) AS ntwt,sum(s.less) AS less, SUM((s.ntwt * (s.tunch + im.default_wastage))/100) AS fine';
        } else {
            $config['select'] = '`s`.`department_id`, `s`.`category_id`, `s`.`item_id`, `s`.`item_stock_id`, `s`.`tunch`, `s`.`rfid_created_grwt`,`cat`.`category_name`, `im`.`item_name`, `im`.`stock_method`, `cat`.`category_group_id`,SUM(s.grwt) AS grwt,SUM(s.ntwt) AS ntwt,sum(s.less) AS less, SUM((s.ntwt * s.tunch)/100) AS fine';
        }

        $config['joins'][] = array('join_table' => 'item_master im', 'join_by' => 'im.item_id = s.item_id', 'join_type' => 'left');
        $config['joins'][] = array('join_table' => 'account pm', 'join_by' => 'pm.account_id = s.department_id', 'join_type' => 'left');
        $config['joins'][] = array('join_table' => 'category cat', 'join_by' => 'cat.category_id = s.category_id', 'join_type' => 'left');
        $config['column_search'] = array('cat.category_name', 'im.item_name', 's.grwt', 's.less', 's.ntwt', 's.tunch', 's.fine');
        $config['column_order'] = array('cat.category_name', 'im.item_name', 'grwt', null, 's.less', 's.ntwt', 's.tunch', 's.fine', 's.fine');
        // $config['custom_where'] = ' (im.stock_method = 1 AND (s.grwt = 0 OR s.grwt != 0) OR (im.stock_method = 2 AND s.grwt != 0) OR (im.stock_method = 3 AND s.grwt != 0))';
        $config['custom_where'] = ' ((im.stock_method = 1) OR (im.stock_method = 2) OR (im.stock_method = 3))';
        //        $config['custom_where'] = ' 1 ';
        $department_ids = $CI->applib->current_user_department_ids();
        if (!empty($department_ids)) {
            $department_ids = implode(',', $department_ids);
            $config['custom_where'] .= 'AND s.department_id IN(' . $department_ids . ')';
        }
        if (isset($post_data['category_id']) && !empty($post_data['category_id']) && $post_data['category_id']!==0) {
            $config['wheres'][] = array('column_name' => 's.category_id', 'column_value' => $post_data['category_id']);
        }
        if (isset($post_data['item_id']) && !empty($post_data['item_id']) && $post_data['item_id']!==0) {
            $config['wheres'][] = array('column_name' => 's.item_id', 'column_value' => $post_data['item_id']);
        }
        if (isset($post_data['tunch']) && !empty($post_data['tunch']) && $post_data['tunch']!==0) {
            $config['wheres'][] = array('column_name' => 's.tunch', 'column_value' => $post_data['tunch']);
        }
        if (isset($post_data['department_id']) && !empty($post_data['department_id'])) {
            $config['wheres'][] = array('column_name' => 's.department_id', 'column_value' => $post_data['department_id']);
        }
        if (isset($post_data['in_stock']) && $post_data['in_stock'] == 'true') {
            $config['custom_where'] .= ' AND s.grwt != 0';
        } 

        if (isset($post_data['department_id']) && !empty($post_data['department_id'])) {
            if (isset($post_data['item_wise']) && $post_data['item_wise'] == 'true') {
                $config['group_by'] = 's.category_id,s.item_id, if(`im`.`stock_method` = 1, `s`.`tunch`, ""), if(`im`.`stock_method` = 2, `s`.`item_stock_id`, "")';
            } else {
                $config['group_by'] = 's.category_id,s.item_id, if(`im`.`stock_method` = 1, `s`.`tunch`, "")';
            }
        } else {
            if (isset($post_data['item_wise']) && $post_data['item_wise'] == 'true') {
                $config['group_by'] = 'if(`im`.`stock_method` = 2, s.department_id, ""), s.category_id, s.item_id, if(`im`.`stock_method` = 1, `s`.`tunch`, ""), if(`im`.`stock_method` = 2, `s`.`item_stock_id`, "")';
            } else {
                $config['group_by'] = 's.category_id, s.item_id, if(`im`.`stock_method` = 1, `s`.`tunch`, "")';
            }
        }
        if (isset($post_data['rfid_filter']) && $post_data['rfid_filter'] == '1' && $post_data['rfid_filter']!==0) {
            $config['custom_where'] .= ' AND s.item_stock_id IN ( SELECT `item_stock_id` FROM `item_stock_rfid` WHERE `rfid_used` = 0)';
        } else if (isset($post_data['rfid_filter']) && $post_data['rfid_filter'] == '2' && $post_data['rfid_filter']!==0) {
            $config['custom_where'] .= ' AND s.item_stock_id NOT IN ( SELECT `item_stock_id` FROM `item_stock_rfid` WHERE `rfid_used` = 0)';
        }
        $config['order'] = array('s.item_stock_id' => 'desc');
        //$this->load->library('datatables', $config, 'datatable');
        $datatable = load_datatables_library($config);
        $list = $datatable->get_datatables();
        $data = array();
        $gold_grwt = 0;
        $gold_rfid_created_grwt = 0;
        $gold_rfid_not_created_grwt = 0;
        $gold_ntwt = 0;
        $gold_tunch = 0;
        $gold_fine = 0;
        $silver_grwt = 0;
        $silver_rfid_created_grwt = 0;
        $silver_rfid_not_created_grwt = 0;
        $silver_ntwt = 0;
        $silver_tunch = 0;
        $silver_fine = 0;
        $gold_amount = 0;
        $silver_amount = 0;
        $from_date = '';
        $to_date = '';
        $display_opening = 1;
        $final_profit_loss_amount = 0;
        $item_counter = 0;
        foreach ($list as $stock) {
            $gold = 0;
            $silver = 0;
            $less = 0;
            $ntwt = 0;
            $tunch = 0;
            $less = 0;
            $date_wise_stock = '';
            $stock_adjust_btn = '';
            $less_allow = 0;
            $wstg = '0';
            $grwt = number_format((float) $stock->grwt, 3, '.', '');
            $less = number_format((float) $stock->less, 3, '.', '');
            $ntwt = number_format((float) $stock->ntwt, 3, '.', '');
            if ($stock->category_group_id == 1) {
                $gold = number_format((float) $stock->fine, 3, '.', '');
            } else if ($stock->category_group_id == 2) {
                $silver = number_format((float) $stock->fine, 3, '.', '');
            }
            $tunch = number_format((float) $stock->tunch, 2, '.', '');

            if ($stock->stock_method == '3' || $stock->stock_method == 3) {
                if ($grwt != '0.000') {
                    if ($CI->AppModel->have_access_role(STOCK_ADJUST_ID, "view")) {
                        if ($ntwt != '0.000') {
                            $tunch = number_format(((float) $stock->fine / (float) $ntwt) * 100, 2, '.', '');
                            $tunch = ($tunch > 100) ? number_format((float) 100, 2, '.', '') : $tunch;
                        }
                        $less_allow = $CI->Crud->get_column_value_by_id('item_master', 'less', array('item_id' => $stock->item_id));
                        $stock_adjust_btn = '<a href="javascript:void(0);" class="btn btn-primary btn-xs item_stock_row pull-left" data-department_id="' . $stock->department_id . '" data-category_id="' . $stock->category_id . '" data-item_id="' . $stock->item_id . '" data-category_group_id="' . $stock->category_group_id . '" data-grwt="' . $grwt . '" data-less_allow="' . $less_allow . '" data-less="' . $less . '" data-ntwt="' . $ntwt . '" data-tunch="' . $stock->tunch . '" data-wstg="' . $wstg . '" data-fine="' . number_format($stock->fine, 3, '.', '') . '" data-item_stock_id="' . $stock->item_stock_id . '" > Adjust </a>';
                    }
                }
            } else if ($stock->stock_method == '2' || $stock->stock_method == 2) {
                if (isset($post_data['item_wise']) && $post_data['item_wise'] != 'true') {
                    if ($ntwt != '0.000') {
                        $tunch = number_format(((float) $stock->fine / (float) $ntwt) * 100, 2, '.', '');
                        $tunch = ($tunch > 100) ? number_format((float) 100, 2, '.', '') : $tunch;
                    }
                }
            } else {
                $tunch = number_format((float) $stock->tunch, 2, '.', '');
                if (!empty($grwt) && $grwt != '0.000') {
                    if ($CI->AppModel->have_access_role(STOCK_ADJUST_ID, "view")) {
                        $less_allow = $CI->Crud->get_column_value_by_id('item_master', 'less', array('item_id' => $stock->item_id));
                        $stock_adjust_btn = '<a href="javascript:void(0);" class="btn btn-primary btn-xs item_stock_row pull-left" data-department_id="' . $stock->department_id . '" data-category_id="' . $stock->category_id . '" data-item_id="' . $stock->item_id . '" data-category_group_id="' . $stock->category_group_id . '" data-grwt="' . $grwt . '" data-less_allow="' . $less_allow . '" data-less="' . $less . '" data-ntwt="' . $ntwt . '" data-tunch="' . $stock->tunch . '" data-wstg="' . $wstg . '" data-fine="' . number_format($stock->fine, 3, '.', '') . '" data-item_stock_id="' . $stock->item_stock_id . '" > Adjust </a>';
                    }
                }
            }
            if ($use_rfid == 1 || $use_barcode == 1) {
                if ($CI->applib->have_access_role(STOCK_STATUS_MODULE_ID, "rfid_view")) {
                    if ($stock->stock_method != STOCK_METHOD_ITEM_WISE) {
                        $stock_adjust_btn .= ' &nbsp; <a href="javascript:void(0);" class="btn btn-primary btn-xs item_rfid_detail pull-left" data-category_name="' . $stock->category_name . '" data-item_name="' . $stock->item_name . '" data-department_id="' . $stock->department_id . '" data-category_id="' . $stock->category_id . '" data-item_id="' . $stock->item_id . '" data-category_group_id="' . $stock->category_group_id . '" data-grwt="' . $grwt . '" data-less_allow="' . $less_allow . '" data-less="' . $less . '" data-ntwt="' . $ntwt . '" data-tunch="' . (($tunch > 100) ? number_format((float) 100, 2, '.', '') : $tunch) . '" data-wstg="' . $wstg . '" data-fine="' . number_format($stock->fine, 3, '.', '') . '" data-item_stock_id="' . $stock->item_stock_id . '" style="margin: 0px 3px;" > RFID </a>';
                    } else if ($stock->stock_method == STOCK_METHOD_ITEM_WISE && $post_data['item_wise'] == 'true') {
                        $stock_adjust_btn .= ' &nbsp; <a href="javascript:void(0);" class="btn btn-primary btn-xs item_rfid_detail pull-left" data-category_name="' . $stock->category_name . '" data-item_name="' . $stock->item_name . '" data-department_id="' . $stock->department_id . '" data-category_id="' . $stock->category_id . '" data-item_id="' . $stock->item_id . '" data-category_group_id="' . $stock->category_group_id . '" data-grwt="' . $grwt . '" data-less_allow="' . $less_allow . '" data-less="' . $less . '" data-ntwt="' . $ntwt . '" data-tunch="' . (($tunch > 100) ? number_format((float) 100, 2, '.', '') : $tunch) . '" data-wstg="' . $wstg . '" data-fine="' . number_format($stock->fine, 3, '.', '') . '" data-item_stock_id="' . $stock->item_stock_id . '" style="margin: 0px 3px;" > RFID </a>';
                    }
                    $item_stock_rfid_data = $CI->Crud->getFromSQL('SELECT COUNT(`item_stock_rfid_id`) as rfid_count FROM `item_stock_rfid` WHERE `item_stock_id`="' . $stock->item_stock_id . '" AND `rfid_used` = 0 ');
                    $rfid_count = (isset($item_stock_rfid_data[0]->rfid_count) && !empty($item_stock_rfid_data[0]->rfid_count)) ? $item_stock_rfid_data[0]->rfid_count : "0";
                    $stock_adjust_btn .= '<span class="pull-right">&nbsp;' . $rfid_count . '&nbsp;</span>';
                }
            }
			
          if($stock->stock_method==2)
		  {
            $stock_adjust_btn .= ' &nbsp; <a href="javascript:void(0);" data-stock-method="'.$stock->stock_method.'" id="'.$stock->item_stock_id.'" data-item_name="' . $stock->item_name . '" data-tunch="' . (($tunch > 100) ? number_format((float) 100, 2, '.', '') : $tunch) . '" class="btn btn-primary btn-xs item_stock_details pull-left" data-category_name="Stock" data-item_name="Stock" style="margin: 0px 3px;" > Stock </a>';
          }
            if (isset($post_data['include_wstg']) && $post_data['include_wstg'] == 'true') {

                $opening_wstg = $CI->Crud->get_row_by_where("opening_stock",array('item_id'=>$stock->item_id));
                
                if(!empty($stock->default_wastage)){
                    if($stock->default_wastage==0){
                        @$tunch = $tunch + $opening_wstg->wstg;
                        $tunch = number_format($tunch,2);
                    }                
                }
                
            }

            $row = array();
            $rowContent = '<input type="checkbox" class="stock-checkbox" value="'.$stock->item_stock_id.'" style="margin-right:5px;">';
            $rowContent .= '<a href="#" class="edit_rfid" data-item_stock_id="'.$stock->item_stock_id.'" style="margin-right:5px;"><i class="glyphicon glyphicon-edit"></i></a>';
            $rowContent .= '<a href="'.base_url('reports/stock_status/').$stock->item_stock_id.'" class="btn btn-primary btn-xs" target="_blank" style="margin-right:5px;"><i class="fa fa-print"></i></a>';
            $rowContent .= '<a href="'.base_url('reports/stock_status/').$stock->item_stock_id.'" title="Print RFID tag" class="btn btn-primary btn-xs" target="_blank" style="margin-right:5px;"><i class="fa fa-print"></i></a>';
            $rowContent .= '<a href="javascript:void(0);" class="delete_rfid" data-href="'.base_url('reports/delete_rfid/').$stock->item_stock_id.'"><span class="glyphicon glyphicon-trash" style="color : red">&nbsp;</span></a>';
            $row[] = $rowContent;
            $row[] = $stock->category_name;
            $filtered_data = array_filter([
                'from_date' => $post_data['from_date'] ?? '',
                'to_date' => $post_data['to_date'] ?? '',
                'department_id' => $post_data['department_id'] ?? '',
                'category_id' => $post_data['category_id'] ?? '',
                'item_id' => $post_data['item_id'] ?? '',
                'tunch' => $tunch ?? '',
                'include_wstg' => isset($post_data['include_wstg']) && $post_data['include_wstg'] === 'true' ? 1 : 0,
                'rfid_filter' => $post_data['rfid_filter'] ?? '',
            ]);

            // Remove any empty values from the array
            $filtered_data = array_filter($filtered_data, function ($value) {
                return !empty($value);
            });


            $query_string = http_build_query($filtered_data);

            if ($stock->stock_method == '3') {
                $row[] = '<a href="' . base_url('reports/stock_ledger/' . $stock->item_stock_id . '/0/' . $post_data['department_id']) . '?' . $query_string . '">' . $stock->item_name . '</a>';
            } else if ($stock->stock_method == '2' && isset($post_data['item_wise']) && $post_data['item_wise'] != 'true') {
                $row[] = '<a href="' . base_url('reports/stock_ledger/' . $stock->item_stock_id . '/0/' . $post_data['department_id']) . '?' . $query_string . '">' . $stock->item_name . '</a>';
            } else {
                $row[] = '<a href="' . base_url('reports/stock_ledger/' . $stock->item_stock_id . '/1/' . $post_data['department_id']) . '?' . $query_string . '">' . $stock->item_name . '</a>';
            }
            if ($grwt < 0) {
                $className = 'text-danger';
            } else {
                $className = 'text-primary';
            }
            $row[] = '<b class="' . $className . '">' . $grwt . '</b>';

            // Format rfid_created_grwt and add it with appropriate Bootstrap class
            $stock->rfid_created_grwt = number_format((float) $stock->rfid_created_grwt, 3, '.', '');
            $row[] = '<b class="' . $className . '">' . $stock->rfid_created_grwt . '</b>';

            // Calculate and format rfid_not_created_grwt with Bootstrap classes
            $rfid_not_created_grwt = (float) $grwt - (float) $stock->rfid_created_grwt;
            $rfid_not_created_grwt = number_format((float) $rfid_not_created_grwt, 3, '.', '');
            $row[] = '<b class="' . $className . '">' . $rfid_not_created_grwt . '</b>';

            // Conditionally add stock adjust button or leave empty
            if (isset($post_data['department_id']) && !empty($post_data['department_id'])) {
                $row[] = $stock_adjust_btn;
            } else {
                $row[] = '';
            }

            $row[] = '<b class="' . $className . '">' . $less . '</b>';
            $row[] = '<b class="' . $className . '">' . $ntwt . '</b>';
            $row[] = '<b class="' . $className . '">' . $tunch . '</b>';
            $row[] = '<b class="' . $className . '">' . $gold . '</b>';
            $row[] = '<b class="' . $className . '">' . $silver . '</b>';


            if ($stock->category_group_id == 1) {
                // Update gold variables and calculate amount
                $gold_grwt = (float) $gold_grwt + (float) $grwt;
                $gold_rfid_created_grwt = (float) $gold_rfid_created_grwt + (float) $stock->rfid_created_grwt;
                $gold_rfid_not_created_grwt = (float) $gold_rfid_not_created_grwt + (float) $rfid_not_created_grwt;
                $gold_ntwt = (float) $gold_ntwt + (float) $ntwt;
                $gold_fine = (float) $gold_fine + (float) $gold;

                if ($gold_ntwt != 0 || $gold_ntwt != '') {
                    $gold_tunch = ((float) $gold_fine) / (float) $gold_ntwt * 100;
                }

                $amount = (float) $gold * (float) $gold_rate / 10;
                // $row[] = '<b class="' . ((float) $amount < 0 ? 'text-danger' : 'text-primary') . '">' . number_format((float) $amount, 2, '.', '') . '</b>';
                $gold_amount = (float) $gold_amount + $amount;
            } else if ($stock->category_group_id == 2) {
                // Update silver variables and calculate amount
                $silver_grwt = (float) $silver_grwt + (float) $grwt;
                $silver_rfid_created_grwt = (float) $silver_rfid_created_grwt + (float) $stock->rfid_created_grwt;
                $silver_rfid_not_created_grwt = (float) $silver_rfid_not_created_grwt + (float) $rfid_not_created_grwt;
                $silver_ntwt = (float) $silver_ntwt + (float) $ntwt;
                $silver_fine = (float) $silver_fine + (float) $silver;

                if ($silver_ntwt != 0 || $silver_ntwt != '') {
                    $silver_tunch = ((float) $silver_fine) / (float) $silver_ntwt * 100;
                }

                $amount = (float) $silver * (float) $silver_rate / 10;
                // $row[] = '<b class="' . ((float) $amount < 0 ? 'text-danger' : 'text-primary') . '">' . number_format((float) $amount, 2, '.', '') . '</b>';
                $silver_amount = (float) $silver_amount + $amount;
            } else {
                // $row[] = '<b>0</b>';
            }

            $data[] = $row;
            $item_counter++;
        }
        $totalRecodsCountForDatatable = count($data);
        
        $row = array();
        $row[] = '<b>Gold Total</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_grwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_rfid_created_grwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_rfid_not_created_grwt, 3, '.', '') . '</b>';
        $row[] = '';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_ntwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_tunch, 2, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $gold_fine, 3, '.', '') . '</b>';
        $row[] = '';
        // $row[] = '<b class="' . $className . '">' . number_format((float) $gold_amount, 2, '.', '') . '</b>';
        $row[] = '<span class="' . $className . '">' . number_format((float) $final_profit_loss_amount, 2, '.', '') . '</span>';
        // $row[] = '';
        $data[] = $row;

        $row = array();
        $row[] = '<b>Silver Total</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_grwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_rfid_created_grwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_rfid_not_created_grwt, 3, '.', '') . '</b>';
        $row[] = '';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_ntwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_tunch, 2, '.', '') . '</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $silver_fine, 3, '.', '') . '</b>';
        // $row[] = '<b class="' . $className . '">' . number_format((float) $silver_amount, 2, '.', '') . '</b>';
        $row[] = '';
        $data[] = $row;


        // Get Worker Gold and Silver from manufacture data.
        $worker_stock_data = get_worker_stock_status_from_manufacture_data();
        $worker_gold_grwt = $worker_stock_data['worker_gold_grwt'];
        $worker_gold_ntwt = $worker_stock_data['worker_gold_ntwt'];
        $worker_gold_fine = $worker_stock_data['worker_gold_fine'];
        $worker_gold_tunch = 0;
        if (!empty($worker_gold_fine) && !empty($worker_gold_ntwt)) {
            $worker_gold_tunch = $worker_gold_fine * 100 / $worker_gold_ntwt;
        }
        $worker_gold_amount = (float) $worker_gold_fine * (float) $gold_rate / 10;

        $worker_silver_grwt = $worker_stock_data['worker_silver_grwt'];
        $worker_silver_ntwt = $worker_stock_data['worker_silver_ntwt'];
        $worker_silver_fine = $worker_stock_data['worker_silver_fine'];
        $worker_silver_tunch = 0;
        if (!empty($worker_silver_fine) && !empty($worker_silver_ntwt)) {
            $worker_silver_tunch = $worker_silver_fine * 100 / $worker_silver_ntwt;
        }
        $worker_silver_amount = (float) $worker_silver_fine * (float) $silver_rate / 10;
        $row = array();
        $row[] = 'Worker Gold';
        $row[] = '';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_gold_grwt, 3, '.', '') . '</span>';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_gold_ntwt, 3, '.', '') . '</span>';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_gold_tunch, 2, '.', '') . '</span>';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_gold_fine, 3, '.', '') . '</span>';
        $row[] = '';
        // $row[] = '<span class="' . $className . '">' . number_format((float) $worker_gold_amount, 2, '.', '') . '</span>';
        $row[] = '';
        $data[] = $row;

        $row = array();
        $row[] = 'Worker Silver';
        $row[] = '';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_silver_grwt, 3, '.', '') . '</span>';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_silver_ntwt, 3, '.', '') . '</span>';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_silver_tunch, 2, '.', '') . '</span>';
        $row[] = '';
        $row[] = '<span class="' . $className . '">' . number_format((float) $worker_silver_fine, 3, '.', '') . '</span>';
        // $row[] = '<span class="' . $className . '">' . number_format((float) $worker_silver_amount, 2, '.', '') . '</span>';
        $row[] = '';
        $data[] = $row;


        $dept_worker_gold_grwt = number_format((float) $gold_grwt, 3, '.', '') + number_format((float) $worker_gold_grwt, 3, '.', '');
        $dept_worker_gold_ntwt = number_format((float) $gold_ntwt, 3, '.', '') + number_format((float) $worker_gold_ntwt, 3, '.', '');
        $dept_worker_gold_fine = number_format((float) $gold_fine, 3, '.', '') + number_format((float) $worker_gold_fine, 3, '.', '');
        $dept_worker_gold_tunch = 0;
        if (!empty($dept_worker_gold_fine) && !empty($dept_worker_gold_ntwt)) {
            $dept_worker_gold_tunch = $dept_worker_gold_fine * 100 / $dept_worker_gold_ntwt;
        }
        $dept_worker_gold_amount = number_format((float) $gold_amount, 2, '.', '') + number_format((float) $worker_gold_amount, 2, '.', '');

        $dept_worker_silver_grwt = number_format((float) $silver_grwt, 3, '.', '') + number_format((float) $worker_silver_grwt, 3, '.', '');
        $dept_worker_silver_ntwt = number_format((float) $silver_ntwt, 3, '.', '') + number_format((float) $worker_silver_ntwt, 3, '.', '');
        $dept_worker_silver_fine = number_format((float) $silver_fine, 3, '.', '') + number_format((float) $worker_silver_fine, 3, '.', '');
        $dept_worker_silver_tunch = 0;
        if (!empty($dept_worker_silver_fine) && !empty($dept_worker_silver_ntwt)) {
            $dept_worker_silver_tunch = $dept_worker_silver_fine * 100 / $dept_worker_silver_ntwt;
        }
        $dept_worker_silver_amount = number_format((float) $silver_amount, 2, '.', '') + number_format((float) $worker_silver_amount, 2, '.', '');
        $row = array();
        $row[] = '<b>Dept. + Worker Gold</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_gold_grwt, 3, '.', '') . '</b>';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_gold_ntwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_gold_tunch, 2, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_gold_fine, 3, '.', '') . '</b>';
        $row[] = '';
        // $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_gold_amount, 2, '.', '') . '</b>';
        $row[] = '';
        $data[] = $row;

        $row = array();
        $row[] = '<b>Dept. + Worker Silver</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_silver_grwt, 3, '.', '') . '</b>';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_silver_ntwt, 3, '.', '') . '</b>';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_silver_tunch, 2, '.', '') . '</b>';
        $row[] = '';
        $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_silver_fine, 3, '.', '') . '</b>';
        // $row[] = '<b class="' . $className . '">' . number_format((float) $dept_worker_silver_amount, 2, '.', '') . '</b>';
        $row[] = '';
        $data[] = $row;

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => count($list),
            "recordsFiltered" => $datatable->count_filtered(),
            "data" => $data,
        );
        
        echo json_encode($output);
    }
}

if (!function_exists('get_created_stock_items_list')) {
    function get_created_stock_items_list() {
        $CI =& get_instance(); // Get the CI instance
        $CI->load->database();
        $post_data = $_POST;
        $item_stock_id = isset($_GET['item_stock_id']) ? $_GET['item_stock_id'] : null;
        $config['table'] = 'item_stock isr';
        $config['select'] = 'isr.*';
        // $config['column_search'] = array('isr.ntwt','isr.grwt','isr.less','isr.tunch','isr.fine','isr.stock_type');
        $config['order'] = array('isr.item_stock_id' => 'desc');
        $datatable = load_datatables_library($config);
        if (!empty($item_stock_id)) {
            $CI->db->where('isr.item_stock_id', $item_stock_id);
        }
        $created_rfid_list = $datatable->get_datatables();
        $data = array();
        $total_rfid_grwt = 0;
        $total_rfid_less = 0;
        $total_rfid_add = 0;
        $total_rfid_ntwt = 0;
        $total_rfid_fine = 0;
        $total_rfid_charges = 0;
        $rfid_pcs = 1;
        foreach ($created_rfid_list as $created_rfid) {
            $rfid_action_btn = '';
            $checkbox = '<input type="checkbox" class="stock-checkbox" value="' . $created_rfid->item_stock_id . '">';
            $rfid_action_btn .= $checkbox . ' &nbsp; ';
            if ($CI->applib->have_access_role(STOCK_STATUS_MODULE_ID, "rfid_edit")) {
                $rfid_action_btn .= '<a href="javascript:void(0);" class="edit_rfid" data-item_stock_id="' . $created_rfid->item_stock_id . '" ><i class="glyphicon glyphicon-edit"></i></a>';
            }
            $rfid_action_btn .= ' &nbsp; <a href="' . base_url('reports/print_item_rfid/' . $created_rfid->item_stock_id) . '" class="btn btn-primary btn-xs" target="_blank"><i class="fa fa-print"></i></a>';
            $rfid_action_btn .= ' &nbsp; <a href="' . base_url('reports/print_item_rfid_tag/' . $created_rfid->item_stock_id) . '" title="Print RFID tag" class="btn btn-primary btn-xs" target="_blank"><i class="fa fa-print"></i></a>';
            if ($CI->applib->have_access_role(STOCK_STATUS_MODULE_ID, "rfid_delete")) {
                $rfid_action_btn .= ' &nbsp; <a href="javascript:void(0);" class="delete_rfid" data-href="' . base_url('reports/delete_rfid/' . $created_rfid->item_stock_id) . '"><span class="glyphicon glyphicon-trash" style="color : red">&nbsp;</span></a>';
            }
            $row = array();
            $row[] = $rfid_action_btn;
            $row[] = $rfid_pcs;
            // $row[] = $created_rfid->item_stock_id;
            $row[] = $created_rfid->grwt;
            $row[] = $created_rfid->less;
            $row[] = $created_rfid->ntwt;
            $row[] = $created_rfid->fine;
            $row[] = date('d/m/Y h:i A', strtotime($created_rfid->created_at));
            $data[] = $row;
            

            $total_rfid_grwt = $total_rfid_grwt + $created_rfid->grwt;
            $total_rfid_less = $total_rfid_less + $created_rfid->less;
            $total_rfid_ntwt = $total_rfid_ntwt + $created_rfid->ntwt;
            $total_rfid_fine = $total_rfid_fine + $created_rfid->fine;
            $rfid_pcs++;
        }
        $row = array();
        $row[] = '<b>Total<b>';
        $row[] = '';
        $row[] = '';
        $row[] = '';
        $row[] = '<b>' . number_format((float) $total_rfid_grwt, 3, '.', '') . '</b>';
        $row[] = '<b>' . number_format((float) $total_rfid_less, 3, '.', '') . '</b>';
        $row[] = '<b>' . number_format((float) $total_rfid_add, 3, '.', '') . '</b>';
        $row[] = '<b>' . number_format((float) $total_rfid_ntwt, 3, '.', '') . '</b>';
        $row[] = '<b>' . number_format((float) $total_rfid_fine, 3, '.', '') . '</b>';
        $row[] = '<b>' . number_format((float) $total_rfid_charges, 2, '.', '') . '</b>';
        $row[] = '';
        $row[] = '';
        $data[] = $row;
        $output = array(
            // "draw" => 2,
            "recordsTotal" => count($created_rfid_list),
            "recordsFiltered" => $datatable->count_filtered(),
            "data" => $data,
            "rfid_stock" => number_format((float) $total_rfid_grwt, 3, '.', ''),
            "rfid_pcs" => $rfid_pcs - 1,
        );
        echo json_encode($output);
    }
}

//function for opening stock
if (!function_exists('get_opening_stock_ledger')) {
    function get_opening_stock_ledger($from_date, $department_id, $category_id, $item_id, $tunch, $account_id, $type_sort, $include_wastage)
    {
        $CI =& get_instance(); // Get the CI instance
        $to_date = '';
        $os_data = array();
        if ($type_sort == '' || $type_sort == 'Opening Stock') {
            $os_data = $CI->Crud->get_opening_stock_for_stock_ledger($department_id, $category_id, $item_id, $tunch, $account_id, 'Opening Stock');
        }
        $p_data = array();
        if ($type_sort == '' || $type_sort == 'P') {
            $p_data = $CI->Crud->get_sell_items_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'P');
        }
        $s_data = array();
        if ($type_sort == '' || $type_sort == 'S') {
            $s_data = $CI->Crud->get_sell_items_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'S');
        }
        $e_data = array();
        if ($type_sort == '' || $type_sort == 'E') {
            $e_data = $CI->Crud->get_sell_items_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'E');
        }
        $m_r_data = array();
        if ($type_sort == '' || $type_sort == 'M R') {
            $m_r_data = $CI->Crud->get_metal_payment_receipt_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'M R');
        }
        $m_p_data = array();
        if ($type_sort == '' || $type_sort == 'M P') {
            $m_p_data = $CI->Crud->get_metal_payment_receipt_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'M P');
        }
        $f_t_data = array();
        if ($type_sort == '' || $type_sort == 'F T') {
            $f_t_data = $CI->Crud->get_stock_transfer_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'F T');
        }
        $t_t_data = array();
        if ($type_sort == '' || $type_sort == 'T T') {
            $t_t_data = $CI->Crud->get_stock_transfer_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'T T');
        }
        $mfi_data = array();
        if ($type_sort == '' || $type_sort == 'MFI') {
            $mfi_data = $CI->Crud->get_manufacture_issue_receive_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MFI');
        }
        $mfr_data = array();
        if ($type_sort == '' || $type_sort == 'MFR') {
            $mfr_data = $CI->Crud->get_manufacture_issue_receive_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MFR');
        }
        $mfis_data = array();
        if ($type_sort == '' || $type_sort == 'MFIS') {
            $mfis_data = $CI->Crud->get_manufacture_issue_receive_silver_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MFIS');
        }
        $mfrs_data = array();
        if ($type_sort == '' || $type_sort == 'MFRS') {
            $mfrs_data = $CI->Crud->get_manufacture_issue_receive_silver_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MFRS');
        }
        $mhmifw_data = array();
        if ($type_sort == '' || $type_sort == 'MHMIFW') {
            $mhmifw_data = $CI->Crud->get_manufacture_manu_hand_made_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MHMIFW');
        }
        $mhmis_data = array();
        if ($type_sort == '' || $type_sort == 'MHMIS') {
            $mhmis_data = $CI->Crud->get_manufacture_manu_hand_made_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MHMIS');
        }
        $mhmrfw_data = array();
        if ($type_sort == '' || $type_sort == 'MHMRFW') {
            $mhmrfw_data = $CI->Crud->get_manufacture_manu_hand_made_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MHMRFW');
        }
        $mhmrs_data = array();
        if ($type_sort == '' || $type_sort == 'MHMRS') {
            $mhmrs_data = $CI->Crud->get_manufacture_manu_hand_made_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MHMRS');
        }
        $castingifw_data = array();
        if ($type_sort == '' || $type_sort == 'CASTINGIFW') {
            $castingifw_data = $CI->Crud->get_manufacture_casting_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'CASTINGIFW');
        }
        $castingis_data = array();
        if ($type_sort == '' || $type_sort == 'CASTINGIS') {
            $castingis_data = $CI->Crud->get_manufacture_casting_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'CASTINGIS');
        }
        $castingrfw_data = array();
        if ($type_sort == '' || $type_sort == 'CASTINGRFW') {
            $castingrfw_data = $CI->Crud->get_manufacture_casting_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'CASTINGRFW');
        }
        $castingrs_data = array();
        if ($type_sort == '' || $type_sort == 'CASTINGRS') {
            $castingrs_data = $CI->Crud->get_manufacture_casting_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'CASTINGRS');
        }
        $mchainifw_data = array();
        if ($type_sort == '' || $type_sort == 'MCHAINIFW') {
            $mchainifw_data = $CI->Crud->get_manufacture_machin_chain_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MCHAINIFW');
        }
        $mchainis_data = array();
        if ($type_sort == '' || $type_sort == 'MCHAINIS') {
            $mchainis_data = $CI->Crud->get_manufacture_machin_chain_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MCHAINIS');
        }
        $mchainrfw_data = array();
        if ($type_sort == '' || $type_sort == 'MCHAINRFW') {
            $mchainrfw_data = $CI->Crud->get_manufacture_machin_chain_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MCHAINRFW');
        }
        $mchainrs_data = array();
        if ($type_sort == '' || $type_sort == 'MCHAINRS') {
            $mchainrs_data = $CI->Crud->get_manufacture_machin_chain_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'MCHAINRS');
        }
        $o_p_data = array();
        if ($type_sort == '' || $type_sort == 'O P') {
            $o_p_data = $CI->Crud->get_other_sell_item_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'O P');
        }
        $o_s_data = array();
        if ($type_sort == '' || $type_sort == 'O S') {
            $o_s_data = $CI->Crud->get_other_sell_item_for_stock_ledger($from_date, $to_date, $department_id, $category_id, $item_id, $tunch, $account_id, 'O S');
        }
        $stock_ledger_data = array_merge($os_data, $p_data, $s_data, $e_data, $m_r_data, $m_p_data, $f_t_data, $t_t_data, $mfi_data, $mfr_data, $mfis_data, $mfrs_data, $mhmifw_data, $mhmis_data, $mhmrfw_data, $mhmrs_data, $castingifw_data, $castingis_data, $castingrfw_data, $castingrs_data, $mchainifw_data, $mchainis_data, $mchainrfw_data, $mchainrs_data, $o_p_data, $o_s_data);

        uasort($stock_ledger_data, function ($a, $b) {
            $value1 = strtotime($a->st_date);
            $value2 = strtotime($b->st_date);
            return $value1 - $value2;
        });
        $stock_ledger_data = array_values($stock_ledger_data);
        $total_plus_grwt = 0;
        $total_plus_less = 0;
        $total_plus_net_wt = 0;
        $total_plus_fine = 0;
        $total_minus_grwt = 0;
        $total_minus_less = 0;
        $total_minus_net_wt = 0;
        $total_minus_fine = 0;
        $pre_key = 0;
        $balance_grwt = 0;
        $balance_net_wt = 0;
        $balance_fine = 0;
        $zero_value = 0;
        foreach ($stock_ledger_data as $key => $stock_ledger) {

            $grwt = number_format($stock_ledger->grwt, 3, '.', '');
            $less = (is_numeric((float) $stock_ledger->less)) ? number_format((float) $stock_ledger->less, 3, '.', '') : 0;
            $net_wt = (!is_numeric((float) $stock_ledger->net_wt)) ? (float) $grwt - (float) $less : (float) $stock_ledger->net_wt;
            $touch_id = $stock_ledger->touch_id;
            $wstg = (is_numeric((float) $stock_ledger->wstg)) ? number_format((float) $stock_ledger->wstg, 3, '.', '') : '';
            $account_name = ($stock_ledger->account_name != 'account_name') ? $stock_ledger->account_name : '';
            $fine = $stock_ledger->fine;

            if ($stock_ledger->type_sort == 'S' || $stock_ledger->type_sort == 'M P' || $stock_ledger->type_sort == 'F T' || $stock_ledger->type_sort == 'MFI' || $stock_ledger->type_sort == 'MFIS' || $stock_ledger->type_sort == 'MHMIFW' || $stock_ledger->type_sort == 'MHMIS' || $stock_ledger->type_sort == 'CASTINGIFW' || $stock_ledger->type_sort == 'CASTINGIS' || $stock_ledger->type_sort == 'MCHAINIFW' || $stock_ledger->type_sort == 'MCHAINIS' || $stock_ledger->type_sort == 'O S') {
                $grwt = $zero_value - (float) $grwt;
                $grwt = number_format((float) $grwt, 3, '.', '');
                $less = (!empty($less)) ? $zero_value - $less : 0;
                $less = number_format((float) $less, 3, '.', '');
                $net_wt = $zero_value - (float) $net_wt;
                $net_wt = number_format((float) $net_wt, 3, '.', '');
                $fine = $zero_value - (float) $fine;
                $fine = number_format((float) $fine, 3, '.', '');

                $total_minus_grwt = (float) $total_minus_grwt + (float) $grwt;
                $total_minus_less = (float) $total_minus_less + (float) $less;
                $total_minus_net_wt = (float) $total_minus_net_wt + (float) $net_wt;
                $total_minus_fine = (float) $total_minus_fine + (float) $fine;
            } else {
                $total_plus_grwt = (float) $total_plus_grwt + (float) $grwt;
                $total_plus_less = (float) $total_plus_less + (float) $less;
                $total_plus_net_wt = (float) $total_plus_net_wt + (float) $net_wt;
                $total_plus_fine = (float) $total_plus_fine + (float) $fine;
            }

            if ($key == 0) {
                $balance_grwt = $stock_ledger_data[$key]->balance_grwt = $grwt;
                $balance_net_wt = $stock_ledger_data[$key]->balance_net_wt = $net_wt;

                if ($include_wastage == 'true') {
                    $default_wstg = $CI->Crud->get_column_value_by_id('item_master', 'default_wastage', array('item_id' => $stock_ledger->item_id));
                    $with_wastage_fine = (float) $net_wt * ((float) $touch_id + (float) $default_wstg) / 100;
                    $balance_fine = $stock_ledger_data[$key]->balance_fine = $with_wastage_fine;
                } else {
                    $without_wastage_fine = (float) $net_wt * (float) $touch_id / 100;
                    $balance_fine = $stock_ledger_data[$key]->balance_fine = $without_wastage_fine;
                }
            } else {
                $balance_grwt = $stock_ledger_data[$key]->balance_grwt = (float) $stock_ledger_data[$pre_key]->balance_grwt + (float) $grwt;
                $balance_net_wt = $stock_ledger_data[$key]->balance_net_wt = (float) $stock_ledger_data[$pre_key]->balance_net_wt + (float) $net_wt;

                if ($include_wastage == 'true') {
                    $default_wstg = $CI->Crud->get_column_value_by_id('item_master', 'default_wastage', array('item_id' => $stock_ledger->item_id));
                    $with_wastage_fine = (float) $net_wt * ((float) $touch_id + (float) $default_wstg) / 100;
                    $balance_fine = $stock_ledger_data[$key]->balance_fine = (float) $stock_ledger_data[$pre_key]->balance_fine + (float) $with_wastage_fine;
                } else {
                    $without_wastage_fine = (float) $net_wt * (float) $touch_id / 100;
                    $balance_fine = $stock_ledger_data[$key]->balance_fine = (float) $stock_ledger_data[$pre_key]->balance_fine + (float) $without_wastage_fine;
                    // $balance_fine = round($balance_fine, 2);
                }
                $pre_key = $key;
            }
        }

        $wstg = $CI->Crud->get_val_by_id('item_master', $item_id, 'item_id', 'default_wastage');
        $total_fine = $total_plus_fine + $total_minus_fine;
        $total_net_wt = $total_plus_net_wt + $total_minus_net_wt;
        $opening_data = new stdClass();
        $opening_data->st_id = '';
        $opening_data->st_date = '';
        $opening_data->account_name = 'Opening';
        $opening_data->type_sort = '';
        $opening_data->grwt = (float) $total_plus_grwt + (float) $total_minus_grwt;
        $opening_data->less = (float) $total_plus_less + (float) $total_minus_less;
        $opening_data->net_wt = $total_net_wt;
        $balance_net_wt = number_format(((float) $balance_net_wt), 3, '.', '');
        $balance_fine = number_format(((float) $balance_fine), 3, '.', '');
        if ($balance_fine != 0 && $balance_net_wt != 0) {
            $default_wstg = 0;
            if ($include_wastage == 'true') {
                $default_wstg = $CI->Crud->get_column_value_by_id('item_master', 'default_wastage', array('item_id' => $item_id));
            }
            $tunch = number_format((((float) $balance_fine * 100 / (float) $balance_net_wt) - (float) $default_wstg), 2, '.', '');
        } else {
            $tunch = 0;
        }
        $opening_data->touch_id = $tunch;
        $opening_data->wstg = $wstg;
        $opening_data->fine = number_format(((float) $total_net_wt * (float) $tunch / 100), 3, '.', '');
        $opening_data->balance_grwt = $balance_grwt;
        $opening_data->balance_net_wt = $balance_net_wt;
        $opening_data->balance_fine = $balance_fine;
        return $opening_data = array($opening_data);
    }
}

//function for get_worker_stock_status_from_manufacture_data
if (!function_exists('get_worker_stock_status_from_manufacture_data')) {
    function get_worker_stock_status_from_manufacture_data()
    {
        $CI =& get_instance(); // Get the CI instance
        $crud_model = $CI->load->model('Crud'); 
        $worker_gold_grwt = 0;
        $worker_gold_ntwt = 0;
        $worker_gold_fine = 0;
        $worker_silver_grwt = 0;
        $worker_silver_ntwt = 0;
        $worker_silver_fine = 0;
        $issue_receive = $CI->Crud->getFromSQL("SELECT SUM(`total_issue_net_wt` - `total_receive_net_wt`) as balance_net_wt, SUM(`total_issue_fine` - `total_receive_fine`) as balance_fine FROM `issue_receive` WHERE `lott_complete` = 0");
        if (!empty($issue_receive)) {
            $issue_receive_balance_net_wt = number_format((float) $issue_receive[0]->balance_net_wt, 3, '.', '');
            $issue_receive_balance_fine = number_format((float) $issue_receive[0]->balance_fine, 3, '.', '');
            $worker_gold_grwt = $worker_gold_grwt + $issue_receive_balance_net_wt;
            $worker_gold_ntwt = $worker_gold_grwt;
            $worker_gold_fine = $worker_gold_fine + $issue_receive_balance_fine;
        }
        $manu_hand_made = $CI->Crud->getFromSQL("SELECT SUM(`total_issue_net_wt` - `total_receive_net_wt`) as balance_net_wt, SUM(`total_issue_fine` - `total_receive_fine`) as balance_fine FROM `manu_hand_made` WHERE `lott_complete` = 0");
        if (!empty($manu_hand_made)) {
            $manu_hand_made_balance_net_wt = number_format((float) $manu_hand_made[0]->balance_net_wt, 3, '.', '');
            $manu_hand_made_balance_fine = number_format((float) $manu_hand_made[0]->balance_fine, 3, '.', '');
            $worker_gold_grwt = $worker_gold_grwt + $manu_hand_made_balance_net_wt;
            $worker_gold_ntwt = $worker_gold_grwt;
            $worker_gold_fine = $worker_gold_fine + $manu_hand_made_balance_fine;
        }
        $casting_entry = $CI->Crud->getFromSQL("SELECT SUM(`total_issue_net_wt` - `total_receive_net_wt`) as balance_net_wt, SUM(`total_issue_fine` - `total_receive_fine`) as balance_fine FROM `casting_entry` WHERE `lott_complete` = 0");
        if (!empty($casting_entry)) {
            $casting_entry_balance_net_wt = number_format((float) $casting_entry[0]->balance_net_wt, 3, '.', '');
            $casting_entry_balance_fine = number_format((float) $casting_entry[0]->balance_fine, 3, '.', '');
            $worker_gold_grwt = $worker_gold_grwt + $casting_entry_balance_net_wt;
            $worker_gold_ntwt = $worker_gold_grwt;
            $worker_gold_fine = $worker_gold_fine + $casting_entry_balance_fine;
        }
        $machine_chain = $CI->Crud->getFromSQL("SELECT SUM(`total_issue_net_wt` - `total_receive_net_wt`) as balance_net_wt, SUM(`total_issue_fine` - `total_receive_fine`) as balance_fine FROM `machine_chain` WHERE `lott_complete` = 0");
        if (!empty($machine_chain)) {
            $machine_chain_balance_net_wt = number_format((float) $machine_chain[0]->balance_net_wt, 3, '.', '');
            $machine_chain_balance_fine = number_format((float) $machine_chain[0]->balance_fine, 3, '.', '');
            $worker_gold_grwt = $worker_gold_grwt + $machine_chain_balance_net_wt;
            $worker_gold_ntwt = $worker_gold_grwt;
            $worker_gold_fine = $worker_gold_fine + $machine_chain_balance_fine;
        }
        $issue_receive_silver = $CI->Crud->getFromSQL("SELECT SUM(`total_issue_net_wt` - `total_receive_net_wt`) as balance_net_wt, SUM(`total_issue_fine` - `total_receive_fine`) as balance_fine FROM `issue_receive_silver` WHERE `lott_complete` = 0");
        if (!empty($issue_receive_silver)) {
            $issue_receive_balance_net_wt = number_format((float) $issue_receive_silver[0]->balance_net_wt, 3, '.', '');
            $issue_receive_balance_fine = number_format((float) $issue_receive_silver[0]->balance_fine, 3, '.', '');
            $worker_silver_grwt = $worker_silver_grwt + $issue_receive_balance_net_wt;
            $worker_silver_ntwt = $worker_silver_grwt;
            $worker_silver_fine = $worker_silver_fine + $issue_receive_balance_fine;
        }

        $worker_stock_data = array();
        $worker_stock_data['worker_gold_grwt'] = $worker_gold_grwt;
        $worker_stock_data['worker_gold_ntwt'] = $worker_gold_ntwt;
        $worker_stock_data['worker_gold_fine'] = $worker_gold_fine;
        $worker_stock_data['worker_silver_grwt'] = $worker_silver_grwt;
        $worker_stock_data['worker_silver_ntwt'] = $worker_silver_ntwt;
        $worker_stock_data['worker_silver_fine'] = $worker_silver_fine;
        return $worker_stock_data;
    }
}
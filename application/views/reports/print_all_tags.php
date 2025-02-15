<html>

<head>
    <title>RFID</title>
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            /* font-size: 10pt; */
        }

        table {
            border-spacing: 0;
            page-break-inside: avoid;
        }

        tr {
            /* padding-bottom: 5px; */
            page-break-inside: avoid;
            page-break-after: auto;
        }

        td {
            padding: 0 5px;
            page-break-inside: avoid;
        }

        .border {
            border: 1px solid grey;
            border-radius: 25px !important;
        }
    </style>
</head>

<body style="width: 265px !important; overflow:hidden;">
    <?php if (!empty($rfid_data)) { ?>
        <table style="font-size: 10px; font-family: Arial Rounded MT Bold;" class="border">
            <?php foreach ($rfid_data as $rfid) {
                // echo '<pre>';
                // print_r($rfid);
                // echo '</pre>';
                // exit;
            ?>
                <tr>
                    <td style="text-align: center; width:132px;">
                        <b>BAPA</b><br>
                        <b>ORNAMENTS</b>
                        <br>
                        <?php if (isset($rfid['item_name'])) { ?>
                            <b><?php echo $rfid['item_name']; ?></b><br>
                        <?php } ?>
                    </td>
                    <td>
                        <table style="text-align: right; width:100%">
                            <tr>
                                <td>
                                    <b>Gw: <?php echo number_format($rfid['rfid_grwt'], 3, '.', ''); ?></b><br>
                                    <b>L: <?php echo number_format($rfid['rfid_less'], 3, '.', ''); ?></b><br>
                                    <b>N: <?php echo number_format($rfid['rfid_ntwt'], 3, '.', ''); ?></b>
                                </td>
                                <?php if ($use_barcode == '1') { ?>
                                    <td>
                                        <img alt="barcode"
                                            src="<?= base_url() . '/barcode.php'; ?>?codetype=Code128&size=40&text=<?php echo $rfid['item_stock_rfid']; ?>"
                                            style="text-align:right; height: 50px; width: auto; display: inline-block; margin-top: 5px;" />
                                    </td>
                                <?php } ?>
                            </tr>
                        </table>
                    </td>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>
</body>

</html>
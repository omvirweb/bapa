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
        }

        .container {
            width: 50mm;
            float: left;
            font-size: 10px;
        }

        .rfid-item {
            border: 1px solid #ccc;
            float: left;
            width: 100%;
            margin: 0px 0px 2mm 0px;
            padding: 0;
        }

        .item-name {
            float: left;
            width: 42%;
            margin-right:1%;
            padding:2px 0 0 5px;
        }

        .details-barcode {
            float: left;
            width: 53%;
            margin-left:1%;
        }

        .details {
            float: left;
            width: 48%;
            margin-left:1%;
        }

        .barcode {
            float: left;
            width: 48%;
            margin-left:1%;
        }

        .barcode img {
            height: 50px;
            width: auto;
            display: block;
        }
    </style>
</head>

<body style="width: auto !important; overflow:hidden;">
    <?php if (!empty($rfid_data)) { ?>
        <div class="container">
            <?php foreach ($rfid_data as $rfid) { ?>
                <div class="rfid-item">
                    <!-- Left: Item Name -->
                    <div class="item-name">
                        <b>BAPA</b><br>
                        <b>ORNAMENTS</b><br>
                        <?php if (isset($rfid['item_name'])) { ?>
                            <b><?php echo $rfid['item_name']; ?></b>
                        <?php } ?>
                    </div>

                    <!-- Right: Weight Details + Barcode -->
                    <div class="details-barcode">
                        <div class="details">
                            <b>Gw: <?php echo number_format($rfid['rfid_grwt'], 3, '.', ''); ?></b><br>
                            <b>L: <?php echo number_format($rfid['rfid_less'], 3, '.', ''); ?></b><br>
                            <b>N: <?php echo number_format($rfid['rfid_ntwt'], 3, '.', ''); ?></b>
                        </div>
                        <?php if ($use_barcode == '1') { ?>
                            <div class="barcode">
                                <img alt="barcode"
                                    src="<?= base_url() . '/qrcode.php'; ?>?codetype=Code128&size=40&text=<?php echo $rfid['item_stock_rfid']; ?>" />
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
</body>

</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Sync</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }

        button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .status-message {
            margin: 20px 0;
            padding: 15px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }

        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
        .info { background-color: #cce5ff; color: #004085; }

        .status-message {
            display: none;
        }

        /* Spinner Styles */
        .spinner {
            border: 4px solid #f3f3f3; 
            border-top: 4px solid #3498db; 
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 2s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Data Sync</h1>
    
    <!-- Sync Button -->
    <button id="syncBtn">Sync Data</button>

    <!-- Status Message -->
    <div id="statusMessage" class="status-message"></div>

    <!-- Spinner -->
    <div id="loadingSpinner" class="spinner" style="display: none;"></div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#syncBtn').click(function() {
            const btn = $(this);
            const statusDiv = $('#statusMessage');
            const spinner = $('#loadingSpinner');
            
            // Disable button, show spinner and set message
            btn.prop('disabled', true);
            spinner.show();
            statusDiv.removeClass('success error info').text('Syncing... Please wait...').show();
            
            $.ajax({
                url: "<?php echo site_url('sync/sync_data'); ?>",
                type: "GET",
                dataType: 'json',
                success: function(response) {
                    statusDiv.removeClass('success error info')
                        .addClass(response.status)
                        .text(response.message);
                },
                error: function(xhr, status, error) {
                    statusDiv.removeClass('success error info')
                        .addClass('error')
                        .text('An error occurred: ' + error);
                },
                complete: function() {
                    spinner.hide();
                    btn.prop('disabled', false);
                }
            });
        });
    });
</script>

</body>
</html>

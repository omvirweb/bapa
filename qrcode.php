<?php
	include 'vendor/phpqrcode/qrlib.php'; 

	/*$text = $_GET['text']; 
	// $path = 'uploads/printed_qr_codes/'; 
	// $file = 'uploads/printed_qr_codes/'.uniqid().".png"; 
	
	$file = "uploads/printed_qr_codes/qr1.png";
	
	//other parameters
	$ecc = 'H';
	$pixel_size = $_GET['size'];
	$frame_size = $_GET['size'];
	
	// Generates QR Code and Save as PNG
	QRcode::png($item, $file, $ecc, $pixel_size, $frame_size);

	// echo 'http://20.244.92.124/bapa/'.$file;
	//print_r($_GET);

	echo "<img src='".$file."' width='50'>";*/
	$text = $_GET['text']; 
	QRcode::png($text);
?>

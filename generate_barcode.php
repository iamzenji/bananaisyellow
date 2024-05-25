<?php
// Retrieve the barcode value from the URL parameter
if (isset($_GET['barcode'])) {
    $barcode = $_GET['barcode'];

    // Include TCPDF library from local directory
    require_once('tcpdf/tcpdf.php');

    // Create a new PDF instance
    $pdf = new TCPDF();

    // Add a new page to the PDF document
    $pdf->AddPage();

    // Set the barcode dimensions
    $w = 80;
    $h = 20;

    // Generate the barcode image and add it to the PDF
    $pdf->write1DBarcode($barcode, 'C128', '', '', '', $w, $h);

    // Output the barcode number below the barcode
    $pdf->SetXY(10, $h + 70); // Adjust the position as needed
    $pdf->SetFont('helvetica', '', 30); // Set font and size
    $pdf->Cell(0, 10, $barcode, 0, 1, 'C'); // Output the barcode number

    // Output the PDF as an inline image
    $pdf->Output('barcode_image.pdf', 'I');
} else {
    echo "Barcode value is missing.";
}

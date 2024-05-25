<?php
// Include the database connection
include 'includes/connection.php';

// Check if the supplier_id parameter is set
if (isset($_GET['supplier_id'])) {
    // Sanitize the supplier_id to prevent SQL injection
    $supplier_id = mysqli_real_escape_string($connection, $_GET['supplier_id']);

    // Query to fetch the medicine list for the specified supplier
    $query = "SELECT DISTINCT ml.*, c.category_name, mt.type_name
              FROM medicine_list ml
              JOIN category c ON ml.category_id = c.category_id
              JOIN MedicineType mt ON ml.type_id = mt.type_id
              WHERE ml.supplier_id = $supplier_id";
    $result = mysqli_query($connection, $query);

    // Check if the query was successful
    if ($result) {
        // Start building the HTML content for the medicine list table
        $output = '<table class="table table-striped">
                        <thead>
                            <tr>                               
                                <th>Category</th>
                                <th>Product</th>
                                <th>Description</th>
                                <th>Type</th>
                                <th>Unit</th>
                                <th>Price</th>
                                <th>Barcode</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>';
        // Fetch and display each medicine record
        while ($row = mysqli_fetch_assoc($result)) {
            $output .= '<tr>                            
                            <td>' . $row["category_name"] . '</td>
                            <td>' . $row["brand"] . '</td>
                            <td>' . $row["description"] . '</td>
                            <td>' . $row["type_name"] . '</td>
                            <td>' . $row["unit"] . '</td>
                            <td>' . $row["price"] . '</td>
                            <td>' . $row["barcode"] . '</td>
                            <td>                      
                                <a href="generate_barcode.php?barcode=' . $row["barcode"] . '" target="_blank" class="btn btn-sm btn-warning rounded-pill">Generate Barcode</a>                                            
                            </td>
                        </tr>';
        }
        // Close the table
        $output .= '</tbody></table>';

        // Output the HTML content
        echo $output;
    } else {
        // If the query fails, output an error message
        echo '<div class="alert alert-danger">Failed to fetch medicine list.</div>';
    }
} else {
    // If the supplier_id parameter is not set, output an error message
    echo '<div class="alert alert-danger">Supplier ID is not provided.</div>';
}

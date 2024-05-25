<?php
session_start();

include 'includes/connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inventory_id = $_POST['inventory_id'];
    $qty_stock = $_POST['qty_stock'];
    $unit_inv_qty = $_POST['unit_inv_qty'];
    $storage_location = $_POST['storage_location'];
    $showroom_quantity_stock = $_POST['showroom_quantity_stock'];
    $showroom_location = $_POST['showroom_location'];
    $quantity_to_reorder = $_POST['quantity_to_reorder'];
    $unit_cost = $_POST['unit_cost'];

    $prev_inventory_query = "SELECT * FROM inventory WHERE inventory_id = '$inventory_id'";
    $prev_inventory_result = mysqli_query($connection, $prev_inventory_query);
    $prev_inventory_row = mysqli_fetch_assoc($prev_inventory_result);

    $update_query = "UPDATE inventory SET qty_stock = '$qty_stock', unit_inv_qty = $unit_inv_qty, storage_location = '$storage_location', showroom_quantity_stock = '$showroom_quantity_stock', showroom_location = '$showroom_location', quantity_to_reorder = '$quantity_to_reorder', unit_cost = '$unit_cost', total_cost = $unit_inv_qty * '$unit_cost' WHERE inventory_id = '$inventory_id'";
    $update_result = mysqli_query($connection, $update_query);

    if ($update_result) {
        $unit_inv_qty_change = $unit_inv_qty - $prev_inventory_row['unit_inv_qty'];

        // Fetch employee name from the database
        $employee_id = $_SESSION['employee_id'];
        $employee_query = "SELECT employee_name FROM employee_details WHERE employee_id = '$employee_id'";
        $employee_result = mysqli_query($connection, $employee_query);
        $employee_row = mysqli_fetch_assoc($employee_result);
        $employee_name = $employee_row['employee_name'];

        // Insert into inventory_logs
        $insert_query = "INSERT INTO inventory_logs (inventory_id, date, brand_name, employee, quantity, stock_after, reason) 
        VALUES ('$inventory_id', NOW(), '{$prev_inventory_row['brand']}', '$employee_name', '$unit_inv_qty_change',
        '$unit_inv_qty', 'Edit Item')";
        $insert_result = mysqli_query($connection, $insert_query);

        if ($insert_result) {
            header('location:inventory.php');
            exit;
        } else {
            echo "Error: " . mysqli_error($connection);
        }
    }
}

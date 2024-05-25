<?php
include 'includes/connection.php';
include 'includes/header.php';

if (isset($_POST['addItemBtn'])) {
    // Retrieve form data
    $supplier = $_POST['supplier'];
    $category = $_POST['category'];
    $brand = $_POST['brand'];
    $description = $_POST['description'];
    $type = $_POST['type'];
    $unit = $_POST['unit'];
    $unit_qty = $_POST['unit_qty'];
    $price = $_POST['price'];
    $barcode = $_POST['barcode'];

    // Check if the category already exists in the database
    $checkCategoryQuery = "SELECT category_id FROM category WHERE category_name = '$category'";
    $checkCategoryResult = mysqli_query($connection, $checkCategoryQuery);

    if (mysqli_num_rows($checkCategoryResult) > 0) {
        // Category already exists, retrieve its category ID
        $row = mysqli_fetch_assoc($checkCategoryResult);
        $categoryId = $row['category_id'];
    } else {
        // Category does not exist, insert it into the category table
        $insertCategoryQuery = "INSERT INTO category (category_name) VALUES ('$category')";
        $insertCategoryResult = mysqli_query($connection, $insertCategoryQuery);

        if ($insertCategoryResult) {
            // Get the auto-generated category ID
            $categoryId = mysqli_insert_id($connection);
        } else {
            // Error handling for category insertion
            echo '<script> alert("Failed to add category"); </script>';
            // Redirecting to another page
            echo '<script>window.location.href = "item.php";</script>';
            exit; // Exit script
        }
    }

    // Prepare insert query for medicine list
    $medicineQuery = "INSERT INTO medicine_list (brand, unit, unit_qty, price, type_id, description, supplier_id, category_id, barcode) 
    VALUES ('$brand', '$unit', '$unit_qty', '$price', '$type', '$description', '$supplier', '$categoryId', '$barcode')";

    // Execute medicine list insertion query
    $medicineResult = mysqli_query($connection, $medicineQuery);

    // Check if the query was successful
    if ($medicineResult) {
        // Data is successfully inserted
        echo '<script> alert("Data Saved"); </script>';
        // Redirecting to another page
        echo '<script>window.location.href = "item.php";</script>';
    } else {
        // Error handling for medicine list insertion
        echo '<script> alert("Failed to add medicine"); </script>';
        // Redirecting to another page
        echo '<script>window.location.href = "item.php";</script>';
    }
}

// Close database connection
mysqli_close($connection);

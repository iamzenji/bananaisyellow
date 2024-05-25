 <?php
    require 'connect.php';



    // update qty from cart

    if (isset($_POST["id"])) {
        global $connection;
        $id = $_POST["id"];
        $upt =  $_POST["upt"];
        if ($upt == 0 || $upt == "") {
            $upt = 1;
        }
        $query = "UPDATE cart_sales SET  qty = '$upt' WHERE cart_id = $id";
        mysqli_query($connection, $query);
        echo "Updated Successfully";
    }


    // add piece
    if (isset($_GET['adding'])) {
        $adding = mysqli_real_escape_string($connection, $_GET['adding']);

        $product_qty = 1;
        $select_cart = $connection->query("SELECT * FROM cart_sales WHERE item_id = $adding");


        if (mysqli_num_rows($select_cart) == 0) {
            $query = "INSERT INTO cart_sales (item_id, qty,scale) VALUES('$adding','$product_qty','piece')";
            $query_run = mysqli_query($connection, $query);

            if ($query_run) {
                $res = [
                    'status' => 422,
                    'message' => 'Item Added'
                ];
                echo json_encode($res);
                return false;
            }
        } else {
            $res = [
                'status' => 200,
                'message' => 'Item already added'
            ];
            echo json_encode($res);
            return false;
        }
    }
    // scan to add
    if (isset($_GET['barcode'])) {
        $barcode = mysqli_real_escape_string($connection, $_GET['barcode']);

        $product_qty = 1;

        $querys =  "SELECT m.medicine_id as id, m.barcode FROM medicine_list m JOIN inventory i on inventory_id = medicine_id WHERE m.barcode = '$barcode';";
        $query_runs = mysqli_query($connection, $querys);

        if (mysqli_num_rows($query_runs) > 0) {
            foreach ($query_runs as $row) {
                $id = $row['id'];
            }
        }
        $select_cart = $connection->query("SELECT * FROM cart_sales WHERE item_id = $id");

        if (mysqli_num_rows($select_cart) == 0) {
            $query = "INSERT INTO cart_sales (item_id, qty,scale) VALUES('$id','$product_qty','piece')";
            $query_run = mysqli_query($connection, $query);

            if ($query_run) {
                $res = [
                    'status' => 422,
                    'message' => 'Item Added'
                ];
                echo json_encode($res);
                return false;
            }
        } else {
            $res = [
                'status' => 200,
                'message' => 'Item already added'
            ];
            echo json_encode($res);
            return false;
        }
    }

    // delete item on cart

    if (isset($_POST['del'])) {
        $del = $_POST['del'];
        $tr = $_POST['tr'];
        $cashier = $_POST['cashier'];
        $value = $_POST['values'];
        $ris = "";
        if ($value == "aa") {
            $ris = "Costumer change of mind ";
        } elseif ($value == "bb") {
            $ris = "Wrong Items";
        } elseif ($value == "cc") {
            $ris = "Dont want to buy anymore";
        }

        $cart = "SELECT * FROM `cart_sales` WHERE cart_id = $del ";
        $result = $connection->query($cart);

        while ($row = $result->fetch_assoc()) {
            mysqli_query($connection, "INSERT INTO `meremove`(`cashier_id`, `item_id`, `qty`, `scale`, `reasons`, `stat`) VALUES ( '$cashier','$row[item_id]','$row[qty]','$row[scale]','$ris','single')");
        }
        mysqli_query($connection, "DELETE FROM `cart_sales` WHERE cart_id = $del");
    }


    // delete all data in cart

    if (isset($_POST['value'])) {
        $tr = $_POST['tr'];
        $cashier = $_POST['cashier'];
        $value = $_POST['value'];
        $ris = "";
        if ($value == "aa") {
            $ris = "Costumer change of mind ";
        } elseif ($value == "bb") {
            $ris = "Wrong Items";
        } elseif ($value == "cc") {
            $ris = "Dont want to buy anymore";
        }

        $cart = "SELECT * FROM `cart_sales` ";
        $result = $connection->query($cart);

        while ($row = $result->fetch_assoc()) {
            mysqli_query($connection, "INSERT INTO `meremove`( `cashier_id`, `item_id`, `qty`, `scale`, `reasons`, `stat`) VALUES ( '$cashier','$row[item_id]','$row[qty]','$row[scale]','$ris','all')");
        }

        mysqli_query($connection, "DELETE FROM `cart_sales`");
    }



    // save to mesali database

    if (isset($_POST['tr'])) {
        $tr = $_POST['tr'];
        $cashier = $_POST['cashier'];
        $paym = $_POST['paym'];
        $sub = $_POST['sub'];
        $dist = $_POST['dist'];
        $dis = $_POST['dis'];
        $tot = $_POST['tot'];
        $cash = $_POST['cas'];
        $change = $_POST['change'];

        mysqli_query($connection, "INSERT INTO `transact`(`transact_no`, `cashier_id`, `pay_method`, `sub_total`, `type`, `total_dis`, `total_amount`, `bayad`, `sukli`) VALUES ('$tr', $cashier,'$paym',$sub ,'$dist', $dis,$tot,$cash,$change);");


        $cart = "SELECT * FROM `cart_sales` ";
        $result = $connection->query($cart);

        while ($row = $result->fetch_assoc()) {
            mysqli_query($connection, "INSERT INTO `mesali`(`transact_no`, `item_id`, `qty`, `scale`) VALUES ('$tr','$row[item_id]','$row[qty]','$row[scale]')");
            if ($row['scale'] == "piece") {
                mysqli_query($connection, "UPDATE `inventory` SET `showroom_quantity_stock`= (showroom_quantity_stock - $row[qty]) WHERE inventory_id  = $row[item_id] ");
            }
        }

        mysqli_query($connection, "DELETE FROM `cart_sales`");
        return 'data saved';
    }


    // add mapping

    if (isset($_POST['item'])) {

        $id = $_POST['item'];
        $sec = $_POST['sec'];
        $row = $_POST['row'];
        $column = $_POST['column'];


        mysqli_query($connection, "INSERT INTO `item_mapping`(`item_id`, `shelves`, `colum`, `row`) VALUES ($id, '$sec', $column, '$row')");
    }

    // update item shelves

    if (isset($_POST['upt'])) {

        $id = $_POST['upt'];
        $sec = $_POST['sec'];
        $row = $_POST['row'];
        $column = $_POST['column'];

        mysqli_query($connection, "UPDATE `item_mapping` SET `shelves` = '$sec', `colum` = $column, `row` = '$row' WHERE item_id = $id");
    }



    //  remove item to the shelves

    if (isset($_GET['rem'])) {
        $rem = mysqli_real_escape_string($connection, $_GET['rem']);
        mysqli_query($connection, "DELETE FROM `item_mapping` WHERE item_id = '$rem' ");
    }





    // refund
    if (isset($_POST['ret'])) {
        $id = $_POST['ret'];
        session_start();
        $_SESSION['return'] = $id;
    }

    // reefund per item

    if (isset($_POST['refId'])) {
        $del = $_POST['refId'];
        $value = $_POST['reas'];
        $ris = "";
        if ($value == "aa") {
            $ris = "Costumer change of mind ";
        } elseif ($value == "bb") {
            $ris = "Wrong Items";
        } elseif ($value == "cc") {
            $ris = "Dont want to buy anymore";
        }

        $cart = "SELECT * FROM `mesali` WHERE id = $del ";
        $result = $connection->query($cart);

        while ($row = $result->fetch_assoc()) {
            mysqli_query($connection, "INSERT INTO `mebalik`( `transact_no`, `item_id`, `qty`, `reasons`) VALUES ('$row[transact_no]','$row[item_id]','$row[qty]','$ris')");
        }
        mysqli_query($connection, "DELETE FROM `mesali` WHERE id = $del");
    }

    // refund alll


    if (isset($_POST['numtr'])) {
        $del = $_POST['numtr'];
        $value = $_POST['reass'];
        $ris = "";
        if ($value == "aa") {
            $ris = "Costumer change of mind ";
        } elseif ($value == "bb") {
            $ris = "Wrong Items";
        } elseif ($value == "cc") {
            $ris = "Dont want to buy anymore";
        }

        $cart = "SELECT * FROM `mesali` WHERE transact_no = '$del'";
        $result = $connection->query($cart);

        while ($row = $result->fetch_assoc()) {
            mysqli_query($connection, "INSERT INTO `mebalik`( `transact_no`, `item_id`, `qty`, `reasons`) VALUES ('$row[transact_no]','$row[item_id]','$row[qty]','$ris')");
        }

        mysqli_query($connection, "DELETE FROM `mesali` WHERE transact_no = '$del'");
        mysqli_query($connection, "DELETE FROM `transact` WHERE transact_no = '$del'");
    }

    // view data transact

    if (isset($_POST['view_id'])) {
        $id = $_POST['view_id'];
        $output = '';

        $sql = "SELECT * FROM `mesali` CROSS JOIN inventory on mesali.item_id = inventory.inventory_id WHERE transact_no = '$id';";
        $result = $connection->query($sql);

        if (!$result) {
            die("Invalid query: " . $connection->error);
        }
        $output .= '
    <table class="table caption-top table-bordered table-sm">
    <caption>List of Item in transact ' . $id . '</caption>
    <thead>
        <tr>

            <th>Item</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>';

        $price = 0;
        $scaler = "";
        while ($row = $result->fetch_assoc()) {

            $price = $row['unit_cost'] + ($row['unit_cost'] * .15);
            $scaler = number_format($price);
            $sub_total = number_format($price) * $row["qty"];
            $output .= '
            <tr>
                
                
                <td>' . $row["category"] . ' ' . $row["brand"] . '_' . $row["type"] . '/' . $row["unit"] . '</td>
                <td>' . $row["qty"] . '  ' . '</td>
                <td> ₱ ' . $scaler . '</td>
                <td> ₱ ' . $sub_total . '</td>
                
            </tr>';
        }
        $output .= '
    </tbody>
</table>';

        echo $output;
    }


    ?>
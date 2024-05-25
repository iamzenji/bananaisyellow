_<?php
    include 'includes/connection.php';


    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Retrieve form data
        $employeeName = $_POST['employeeName'];
        $salary = $_POST['salary'];
        $insurance = $_POST['insurance'];
        $tax = $_POST['tax'];

        // Retrieve employee_id based on the selected employee name
        $employeeIdQuery = "SELECT employee_id FROM employee_details WHERE employee_name = '$employeeName'";
        $employeeIdResult = $connection->query($employeeIdQuery);

        if ($employeeIdResult->num_rows > 0) {
            $row = $employeeIdResult->fetch_assoc();
            $employeeId = $row['employee_id'];

            // Prepare the SQL statement
            $sql = "INSERT INTO employee_salary (employee_id, salary, insurance, tax)
VALUES ('$employeeId', '$salary', '$insurance', '$tax')";

            // Execute the SQL statement
            if ($connection->query($sql) === TRUE) {
                // Display success message using JavaScript
                echo '<script>
    document.addEventListener("DOMContentLoaded", function() {
        var modal = document.getElementById("myModal");
        var okButton = document.getElementById("okButton");

        modal.style.display = "block";

        okButton.onclick = function() {
            modal.style.display = "none";
            window.location.href = "salary.php";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                window.location.href = "salary.php";
            }
        }
    });
</script>';
            } else {
                echo "Error: " . $sql . "<br>" . $connection->error;
            }
        } else {
            echo "Error: Employee not found";
        }
    }

    // Close the database connectionection
    $connection->close();
    ?>


<div id="myModal" class="modal">


    <div class="modal-content">
        <p>Salary Added Successfully!</p>
        <button id="okButton">OK</button>
    </div>

</div>
<?php include 'connect.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REFUND</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.1/css/dataTables.bootstrap5.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.5/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/datatables.min.css" rel="stylesheet">

    <style>
        table.dataTable thead>tr>th.dt-orderable-asc,
        table.dataTable thead>tr>th.dt-orderable-desc,
        table.dataTable thead>tr>td.dt-orderable-asc,
        table.dataTable thead>tr>td.dt-orderable-desc {
            text-align: center;
            background: #FCE844;
        }

        table.table.dataTable> :not(caption)>*>* {
            text-align: center;
        }

        .rep {
            text-align: left;
            font-family: 'Times New Roman', Times, serif;
            height: 17vh;
        }

        .catchy-text {
            font-size: 24px;
            font-weight: bold;
            color: #FFF;
            text-transform: uppercase;
            letter-spacing: 2px;
            background-color: #FCE844;
            padding: 10px 40px 10px 40px;
            border-radius: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: absolute;
            right: 20px;
        }
    </style>
    <script>
        function displayTimeAndDate() {
            const now = new Date();
            let hours = now.getHours();
            const meridiem = hours >= 12 ? 'PM' : 'AM';
            hours = (hours % 12) || 12; // Convert to 12-hour format
            const minutes = now.getMinutes().toString().padStart(2, '0');
            const seconds = now.getSeconds().toString().padStart(2, '0');
            const timeString = `${hours}:${minutes}:${seconds} ${meridiem}`;

            const month = (now.getMonth() + 1).toString().padStart(2, '0');
            const day = now.getDate().toString().padStart(2, '0');
            const year = now.getFullYear();
            const dateString = `${month}/${day}/${year}`;


            var date = document.getElementById('date');
            var time = document.getElementById('time');
            if (time !== null && date !== null) {
                time.textContent = timeString;
                date.textContent = dateString;
            }

        }

        // Update time and date every second
        setInterval(displayTimeAndDate, 1000);

        // Initial display
        displayTimeAndDate();
    </script>
</head>

<body>
    <div class="main-content"><?php include('sidebar.php'); ?>
        <div class="header">
            <div class="timer">
                <div id="time"></div>
                <div id="date"></div>
            </div>
            <h1><i style="margin: 1rem;" class='bx bxs-file-export bx-tada'></i>Refund</h1>
        </div>
        <div class="dropdown position-absolute top-0 end-0" style="margin: 12px 7px 0 0;">
            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class='bx bx-user'></i>
            </button>
            <ul class="dropdown-menu" style="width: 12vw;">

                <li><span class="dropdown-item-text"><i class='bx bxs-user-circle'></i> <?php echo $_SESSION['name'] ?></span></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="logout.php">Logout</a></li>
            </ul>
        </div>
        <div class="" style="margin-left: 2vw;width:90vw;">

            <div style="box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);width: 85vw; height: 74vh; padding: 2rem 1vh 4rem 0; margin: 3vh 2rem 0 1rem;">

                <div style="position: absolute; margin-left: 2rem;">
                    <div style="margin-left: 80vw;">
                        <p class="catchy-text">Transact# : <?php echo $_SESSION['return']; ?></p>
                    </div>
                    <button onclick="location.href='records.php'" type="button" class="btn btn-warning"> Back</button>
                </div>


                <div>
                    <div style="padding: 5rem 2rem 1rem 3rem;">
                        <table id="r" class="table table-striped table-hover" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Qty</th>
                                    <th>Price</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <?php
                                $id = $_SESSION['return'];
                                $sql = "SELECT * FROM `mesali` CROSS JOIN inventory on mesali.item_id = inventory.inventory_id WHERE transact_no = '$id';";
                                $result = $connection->query($sql);

                                if (!$result) {
                                    die("Invalid query: " . $connection->error);
                                }
                                $price = 0;
                                $scaler = "";
                                while ($row = $result->fetch_assoc()) {
                        
                                    $price = $row['unit_cost'] + ($row['unit_cost'] * .15);
                                    $scaler = number_format($price);
                                    $sub_total = number_format($price) * $row["qty"];
                                ?>
                                    <tr id="<?php echo $row['id']; ?>">
                                        <td><?php echo "$row[category] $row[brand] _ $row[type] / $row[unit] "; ?></td>
                                        <td><?php echo "$row[qty]" ?></td>
                                        <td><?php echo $scaler ?></td>
                                        <td><?php echo $sub_total ?></td>
                                        <td><button id="tanggol" data-id="<?php echo $row['id']; ?>" value="<?= $row['id'] ?>" class="btn btn-sm btn-danger">refund</button></td>
                                    </tr>

                                <?php   } ?>

                            </tbody>
                        </table>
                    </div>
                    <div class="d-grid col-2 mt-5" style="margin-left: 68vw;">
                    <button id="tanggollAll" class="btn btn-danger p-3" type="button">Refund All Item</button>
                    <input type="hidden" id="transactnum" value="<?php echo "$_SESSION[return]" ?>">

                </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.5/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/datatables.min.js"></script>


<script>
    new DataTable('#r', {
        
        scrollCollapse: true,
        scrollY: '30vh',
        paging: false,
        info: false
       
    });
</script>

<script>
   
// refund per item

    function removeitem(del) {
		var tr = $('#tr').val();
		var cashier = $('#cashier').val();
		(async () => {
			const {
				value: reason
			} = await Swal.fire({
				background: "#ebd1d2",
				confirmButtonColor: "#41B06E",
				cancelButtonColor: "#d33",
				confirmButtonText: "ok",
				title: "Select reason validation",
				input: "select",
				inputOptions: {
					Reasons: {
						aa: "Change of Mind",
						bb: "Wrong Item",
						cc: "Don't Want to Buy Anymore",

					},
				},
				inputPlaceholder: "Select a reason",
				showCancelButton: true,
				inputValidator: (value) => {
					return new Promise((resolve) => {
						if (value != "") {
							$.ajax({
								url: 'code.php',
								type: 'post',
								data: {
								    refId: del,
									reas: value
								},
								success: function(response) {
                                    window.location.reload();
								}
							});
							resolve();
							Swal.fire({
								background: "#ebd1d2",
								showCancelButton: false,
								showConfirmButton: false,
								icon: "success",
								title: "Item Removed...",
								timer: 800
							});
                           


						} else {
							resolve("You need to select reason");
						}
					});
				}
			});
		})()
	}
	$(document).on('click', '#tanggol', function() {
		let del = $(this).val();
		
			Swal.fire({
				title: "Are you sure to remove the item?",
				text: "You won't be able to revert this!",
				icon: "warning",
				background: "#ebd1d2",
				showCancelButton: true,
				showConfirmButton: true,
				confirmButtonColor: "#41B06E",
				cancelButtonColor: "#d33",
				confirmButtonText: "Yes, Remove it!"
			}).then((result) => {
				if (result.isConfirmed) {
                 
					removeitem(del)
				}
			});
	
	});



// refund all

function remove() {
        let numtr = $('#transactnum').val();
		(async () => {
			const {
				value: reason
			} = await Swal.fire({
				background: "#ebd1d2",
				confirmButtonColor: "#41B06E",
				cancelButtonColor: "#d33",
				confirmButtonText: "ok",
				title: "Select reason validation",
				input: "select",
				inputOptions: {
					Reasons: {
						aa: "Change of Mind",
						bb: "Wrong Items",
						cc: "Don't Want to Buy Anymore",

					},
				},
				inputPlaceholder: "Select a reason",
				showCancelButton: true,
				inputValidator: (value) => {
					return new Promise((resolve) => {
						if (value != "") {
							$.ajax({
								url: 'code.php',
								type: 'post',
								data: {
                                    numtr: numtr,
									reass: value
								},
								success: function(response) {
                                    window.location = 'records.php'
								}
							});
							resolve();
							Swal.fire({
								background: "#ebd1d2",
								showCancelButton: false,
								showConfirmButton: false,
								icon: "success",
								title: "Items Removed...",
								timer: 800
							});



						} else {
							resolve("You need to select reason");
						}
					});
				}
			});
		})()
	}

	$('#tanggollAll').click(function() {
		
			Swal.fire({
				title: "Are you sure to remove all items?",
				text: "You won't be able to revert this!",
				icon: "warning",
				background: "#ebd1d2",
				showCancelButton: true,
				showConfirmButton: true,
				confirmButtonColor: "#41B06E",
				cancelButtonColor: "#d33",
				confirmButtonText: "Yes, remove it!"
			}).then((result) => {
				if (result.isConfirmed) {
					remove()
				}
			});
		
	})

</script>

</html>
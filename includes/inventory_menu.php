<?php include 'connection.php'; ?>
<div class="wrapper">
    <aside id="sidebar">
        <div class="d-flex">
            <button class="toggle-btn" type="button">
                <i class="lni lni-grid-alt"></i>
            </button>
            <div class="sidebar-logo">
                <a href="inventory_dashboard.php">Inventory</a>
            </div>
        </div>
        <div class="icon-logo">
            <a href="inventory_dashboard.php">
                <img src="src/img/banana.jpg" alt="Logo">
            </a>
            <div class="brand-info">
                <div class="brand-name" style="font-size: 15px;">Banana is Yellow</div>
            </div>
        </div>


        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="inventory_dashboard.php" class="sidebar-link">
                    <i class="lni lni-home"></i>
                    <span>Dashboard
                    </span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="inventory.php" class="sidebar-link">
                    <i class="lni lni-invest-monitor"></i>
                    <span>Manage Stocks
                    </span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="supplier.php" class="sidebar-link">
                    <i class="lni lni-consulting"></i>
                    <span>Supplier List</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="item.php" class="sidebar-link">
                    <i class="lni lni-list"></i>
                    <span>Item List</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown  text-decoration-none" data-bs-toggle="collapse" data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                    <i class="lni lni-cart"></i>
                    <span>Purchase Order</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="order-add.php" class="sidebar-link text-decoration-none">Ordering</a>
                    </li>
                    <li>
                        <hr class="dropdown-divider text-decoration-none ">
                    </li>
                    <li class="sidebar-item">
                        <a href="order.php" class="sidebar-link text-decoration-none">Orders</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link text-decoration-none">To Pickup</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link text-decoration-none">To Receive</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link text-decoration-none">Complete</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="inventory_return.php" class="sidebar-link text-decoration-none">Return</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="inventory_logs.php" class="sidebar-link">
                    <i class="lni lni-files"></i>
                    <span>Inventory Logs</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="inventory_discount.php" class="sidebar-link">
                    <i class="lni lni-graph"></i>
                    <span>Discounted Product</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="inventory_return.php" class="sidebar-link">
                    <i class="lni lni-reply"></i>
                    <span>Return Product</span>
                </a>
            </li>

        </ul>
        <div class="sidebar-footer">
            <a href="logout.php" class="sidebar-link">
                <i class="lni lni-exit"></i>
                <span>Logout</span>
            </a>
        </div>
    </aside>
<?php include 'connection.php'; ?>
<div class="wrapper">
    <aside id="sidebar">
        <div class="d-flex">
            <button class="toggle-btn" type="button">
                <i class="lni lni-grid-alt"></i>
            </button>
            <div class="sidebar-logo">
                <a href="purchase_dashboard.php">Purcahse Order</a>
            </div>
        </div>
        <div class="icon-logo">
            <a href="purchase_dashboard.php">
                <img src="src/img/botecha.png" alt="Logo">
            </a>
            <div class="brand-info">
                <div class="brand-name">Bo-Tech-A</div>
            </div>
        </div>

        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="purchase_dashboard.php" class="sidebar-link">
                    <i class="lni lni-home"></i>
                    <span>Dashboard
                    </span>
                </a>
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
            <!-- ADDED BY: FINANCE -->
            <li class="sidebar-item">
                <a href="financeInboxPO.php" class="sidebar-link">
                    <i class="lni lni-envelope"></i>
                    <span>Inbox</span>
                </a>
            </li>
            <!-- ----------------- -->
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
                        <a href="#" class="sidebar-link text-decoration-none">Return</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="" class="sidebar-link">
                    <i class="lni lni-popup"></i>
                    <span>Notification</span>
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
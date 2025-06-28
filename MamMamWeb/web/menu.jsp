<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu - Mam Mam</title>
    <link rel="stylesheet" href="css/menu.css">
    <script>
        function filterMenu(type) {
            const items = document.querySelectorAll('.product-item');
            items.forEach(item => {
                item.style.display = (type === 'all' || item.dataset.type === type) ? 'block' : 'none';
            });

            document.querySelectorAll('.category-list li').forEach(li => li.classList.remove('active'));
            document.getElementById(type).classList.add('active');
        }
        window.onload = function() {
        filterMenu('starter');
    };
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="Mam Mam Logo">
        </div>
        <nav>
            <a href="home.jsp">Home</a>
            <a href="MenuServlet">Menu</a>
            <a href="#">Contact</a>
            <button class="login-btn" onclick="openLoginModal()">Login</button>
        </nav>
    </header>

    <!-- Thanh trên cùng: Home > Menu | Search -->
    <div class="menu-top-bar">
        <h2>Home > Menu</h2>
        <input type="text" class="search-box" placeholder="Search...">
    </div>

    <!-- Nội dung chính -->
    <div class="menu-page">
        <!-- Sidebar -->
        <aside class="sidebar">
            <h3>Menu</h3>
            <ul class="category-list">
                <li id="starter" class="active" onclick="filterMenu('starter')">Khai vị & Ăn kèm</li>
                <li id="meat" onclick="filterMenu('meat')">Thịt</li>
                <li id="seafood" onclick="filterMenu('seafood')">Hải sản</li>
                <li id="rice" onclick="filterMenu('rice')">Cơm & Canh</li>
                <li id="hotpot" onclick="filterMenu('hotpot')">Lẩu</li>
            </ul>
        </aside>

        <!-- Danh sách món -->
        <main class="menu-content">
            <div class="product-list">
                <div class="product-item" data-type="starter">
                    <img src="images/saladhoaqua.jpg" alt="Salad hoa quả">
                    <p class="product-name">Salad hoa quả</p>
                    <p class="product-price">99.000</p>
                    <button class="add-to-cart-btn">Add to cart</button>
                </div>

                <div class="product-item" data-type="starter">
                    <img src="images/saladcangu.jpg" alt="Salad cá ngừ">
                    <p class="product-name">Salad cá ngừ</p>
                    <p class="product-price">79.000</p>
                    <button class="add-to-cart-btn">Add to cart</button>
                </div>

                <div class="product-item" data-type="starter">
                    <img src="images/kimchi.jpg" alt="Kimchi">
                    <p class="product-name">Kimchi</p>
                    <p class="product-price">29.000</p>
                    <button class="add-to-cart-btn">Add to cart</button>
                </div>

                <div class="product-item" data-type="meat">
                    <img src="images/bachibomatong.jpg" alt="Ba chỉ bò mật ong">
                    <p class="product-name">Ba chỉ bò mật ong</p>
                    <p class="product-price">159.000</p>
                    <button class="add-to-cart-btn">Add to cart</button>
                </div>
            </div>
        </main>
    </div>

    <footer>
        <div class="footer-content">
            <div class="contact-info">
                <h3>CONTACT INFORMATION</h3>
                <p>Mam Mam Korean Food<br>
                    Address: FPT University, Hoa Hai Ward, Ngu Hanh Son District, Da Nang City<br>
                    HOTLINE: 0123.456.789<br>
                    Email: mammam.food@gmail.com
                </p>
            </div>
            <div class="logo-footer">
                <img src="images/logo.png" alt="Mam Mam Logo">
            </div>
        </div>
    </footer>
</body>
</html>
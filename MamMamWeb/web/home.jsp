<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mam Mam Korean BBQ</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/cart.css">
    </head>
    <body>

        <header>
            <div class="logo">
                <img src="images/logo.png" alt="Mam Mam Logo">
            </div>
            <nav>
                <a href="home.jsp">Home</a>
                <a href="menu.jsp">Menu</a>
                <a href="cart.jsp">Cart</a>

                <% if (user == null) { %>
                <button class="login-btn" onclick="openLoginModal()">Login</button>
                <% } else { %>
                <a href="user.jsp">My Profile</a>
                <% }%>
            </nav>
        </header>

        <section class="highlight">
            <h1>Enjoy Delicious <br><span>The <span class="highlight_text">Korean Foods</span></span></h1>
            <p>We serve authentic Korean dishes, prepared with fresh ingredients by skilled chefs for a truly traditional taste.</p>
            <a href="menu.jsp" class="order-btn">Order Now</a>
        </section>

        <section class="banner">
            <img src="images/mammam.png" alt="Food Banner">
        </section>

        <section class="about">
            <h2>About Us / 저희소개</h2>
            <div class="about-content">
                <div class="text">
                    <p>
                        Mam Mam – The No.1 Korean BBQ Restaurant invites you on a flavorful journey to Seoul’s most famous barbecue spots that have made Korean cuisine world-renowned.
                        Once you’ve tasted the grilled delights at Mam Mam, you’ll never forget the mouthwatering flavors of U.S. short ribs, chuck roll, and fresh beef ribs—perfectly marinated with signature Korean spices.
                        Don't miss side dishes like bibimbap, cold noodles, kimchi stew, and various hot pots.
                    </p>
                </div>
                <div class="images">
                    <img src="images/about us.jpg" alt="About Us">
                </div>
            </div>
        </section>

        <section class="best-seller">
            <h2>Best Seller / 베스트셀러</h2>
            <div class="products">
                <div class="product">
                    <img src="images/bachibomatong.jpg" alt="Ba chỉ bò Mỹ">
                    <p class="product-name">Ba chỉ bò Mỹ ướp xốt mật ong 200g</p>
                    <p class="price">159.000</p>
                </div>
                <div class="product">
                    <img src="images/canhkimchi.jpg" alt="Canh kim chi">
                    <p class="product-name">Canh kim chi</p>
                    <p class="price">99.000</p>
                </div>
                <div class="product">
                    <img src="images/maheo.jpg" alt="Má heo Mỹ">
                    <p class="product-name">Má heo Mỹ tươi</p>
                    <p class="price">149.000</p>
                </div>
                <div class="product">
                    <img src="images/lauquandoi.jpg" alt="Lẩu quân đội">
                    <p class="product-name">Lẩu quân đội</p>
                    <p class="price">309.000</p>
                </div>
                <div class="product">
                    <img src="images/mienxao.jpg" alt="Miến xào thập cẩm">
                    <p class="product-name">Miến xào thập cẩm</p>
                    <p class="price">69.000</p>
                </div>
            </div>

            <div class="view-all">
                <a href="menu.jsp" class="order-btn">View All Menu</a>
            </div>
        </section>

        <div class="cart-icon-center">
            <a href="cart.jsp" title="Xem giỏ hàng">
                <img src="images/cart_icon.jpg" alt="Cart Icon">
            </a>
        </div>

        <section class="feedback">
            <h2>Feedback / 고객 피드백</h2>
            <div class="feedbacks">
                <div class="fb-card">
                    <p class="fb-text">Fantastic flavors, world-class experience!</p>
                    <p class="fb-name">Name: Vee Hung<br><span class="rating">Rating: 5 stars</span></p>
                </div>
                <div class="fb-card">
                    <p class="fb-text">Rất ngon rất mlemmmm</p>
                    <p class="fb-name">Name: Nguyễn Khắc An<br><span class="rating">Rating: 5 stars</span></p>
                </div>
                <div class="fb-card">
                    <p class="fb-text">Thịt nướng ở đây 100 điểm!</p>
                    <p class="fb-name">Name: KhungHắcLong<br><span class="rating">Rating: 5 stars</span></p>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-content">
                <div class="contact-info">
                    <h3>CONTACT INFORMATION</h3>
                    <p>Mam Mam Korean Food<br>
                        Address: FPT University, Da Nang<br>
                        HOTLINE: 0123.456.789<br>
                        Email: mammam.food@gmail.com
                    </p>
                </div>
                <div class="logo-footer">
                    <img src="images/logo.png" alt="Mam Mam Logo">
                </div>
            </div>
        </footer>

        <%-- LOGIN MODAL --%>
        <div id="loginModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close" onclick="closeLoginModal()">&times;</span>
                <img src="images/logo.png" alt="Mam Mam Logo" class="modal-logo">
                <h1 class="modal-title">MĂM MĂM</h1>
                <h2 class="modal-subtitle">VUI LÒNG ĐĂNG NHẬP</h2>

                <form action="login" method="post">
                    <label>Username</label>
                    <input type="text" name="username" placeholder="Số điện thoại/ Gmail" required>

                    <label>Password</label>
                    <input type="password" name="password" required>

                    <div class="forgot">
                        <a href="#">Quên mật khẩu?</a>
                    </div>

                    <button type="submit">Submit</button>
                </form>

                <p class="register">
                    Bạn chưa có tài khoản? <a href="register.jsp"><strong>Đăng ký ngay</strong></a>
                </p>
            </div>
        </div>

        <script>
            function openLoginModal() {
                document.getElementById('loginModal').style.display = 'block';
            }
            function closeLoginModal() {
                document.getElementById('loginModal').style.display = 'none';
            }
            window.onclick = function (event) {
                const modal = document.getElementById('loginModal');
                if (event.target === modal) {
                    closeLoginModal();
                }
            };
        </script>

    </body>
</html>

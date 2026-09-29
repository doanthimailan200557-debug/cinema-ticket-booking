<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- CSS đã được load qua main.css trong header.jsp --%>

<footer class="footer">
    <div class="footer-inner">
        <!-- Brand -->
        <div class="footer-brand">
            <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="footer-logo">
                <svg class="footer-brand-icon" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="20" cy="20" r="19"   stroke="#e50914" stroke-width="2"/>
                    <circle cx="20" cy="20" r="7"    fill="none" stroke="#e50914" stroke-width="2"/>
                    <circle cx="20" cy="20" r="2.5"  fill="#e50914"/>
                    <circle cx="20" cy="7"   r="2.5" fill="#e50914"/>
                    <circle cx="20" cy="33"  r="2.5" fill="#e50914"/>
                    <circle cx="7"   cy="20" r="2.5" fill="#e50914"/>
                    <circle cx="33"  cy="20" r="2.5" fill="#e50914"/>
                    <circle cx="10.6" cy="10.6" r="2.5" fill="#e50914"/>
                    <circle cx="29.4" cy="29.4" r="2.5" fill="#e50914"/>
                    <circle cx="29.4" cy="10.6" r="2.5" fill="#e50914"/>
                    <circle cx="10.6" cy="29.4" r="2.5" fill="#e50914"/>
                </svg>
                <div class="footer-logo-text">CINE<span>+</span></div>
            </a>
            <p class="footer-tagline">Rạp phim trong tầm tay bạn!<br>More Movies, More Feelings.</p>
        </div>

        <!-- Điều hướng -->
        <div>
            <div class="footer-col-title">Điều hướng</div>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/user/trangchu.jsp">Trang chủ</a></li>
                <li><a href="#">Danh sách phim</a></li>
                <li><a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp">Lịch chiếu</a></li>
                <li><a href="#">Rạp chiếu</a></li>
            </ul>
        </div>

        <!-- Hỗ trợ -->
        <div>
            <div class="footer-col-title">Hỗ trợ</div>
            <ul class="footer-links">
                <li><a href="#">Câu hỏi thường gặp</a></li>
                <li><a href="#">Chính sách đổi/trả vé</a></li>
                <li><a href="#">Liên hệ</a></li>
                <li><a href="#">Điều khoản dịch vụ</a></li>
            </ul>
        </div>

        <!-- Ưu đãi -->
        <div>
            <div class="footer-col-title">Ưu đãi</div>
            <ul class="footer-links">
                <li><a href="#">Thành viên mới</a></li>
                <li><a href="#">Combo bắp nước</a></li>
                <li><a href="#">Vé nhóm</a></li>
                <li><a href="#">Flash sale</a></li>
            </ul>
        </div>
    </div>

    <div class="footer-bottom">
        <span>© 2026 CINE+. All rights reserved.</span>
        <div class="footer-bottom-logo">CINE<span>+</span></div>
        <span>Rạp phim trong tầm tay bạn</span>
    </div>
</footer>

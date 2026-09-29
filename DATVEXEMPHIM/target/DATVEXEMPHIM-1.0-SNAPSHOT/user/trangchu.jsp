<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("currentPage", "trangchu");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Trang Chủ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&display=swap">
    <%@ include file="../common/header.jsp" %>
</head>
<body>
    <div class="hero-dots">
        <button class="hero-dot active" onclick="goSlide(0)"></button>
        <button class="hero-dot" onclick="goSlide(1)"></button>
    </div>
</section>

<div class="glow-div"></div>
<section class="section">
    <div class="section-header">
        <div class="section-title">
            <div class="section-title-icon">
                <svg width="16" height="16" fill="none" stroke="white" stroke-width="2.5" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3"/><path d="M7 2v20M17 2v20M2 12h20M2 7h5M17 7h5M2 17h5M17 17h5"/>
                </svg>
            </div>
            Danh Sách Phim
        </div>
        <a href="#" class="section-link">Xem tất cả →</a>
    </div>
                </svg>
            </div>
            Danh Sách Phim
        </div>
<div class="movie-grid">
    <div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0f1623,#1a2a4a,#0a0e1a);">🗡️</div>
            <div class="movie-badge">Hành động</div>
            <div class="movie-rating">⭐ 8.7</div>
            <div class="movie-duration">118 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Thanh Gươm Diệt Quỷ</div>
                <div class="movie-meta">Hành động · Phiêu lưu</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 2 -->
        <div class="movie-card">
            <div class="movie-thumb">
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0d1e30,#1a3552,#0d1825);">🕵️</div>
            <div class="movie-badge">Trinh thám</div>
            <div class="movie-rating">⭐ 8.5</div>
            <div class="movie-duration">135 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Nhiệm Vụ Bất Khả Thi</div>
                <div class="movie-meta">Hành động · Gián điệp</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 3 -->
        <div class="movie-card">
            <div class="movie-thumb">
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#1e0a22,#3d1a45,#1a0a20);">💕</div>
            <div class="movie-badge">Tình cảm</div>
            <div class="movie-rating">⭐ 8.2</div>
            <div class="movie-duration">112 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Yêu Lại Từ Đầu</div>
                <div class="movie-meta">Tình cảm · Hài hước</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 4 -->
        <div class="movie-card">
            <div class="movie-thumb">
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0a1e10,#1a4228,#0a1a10);">😊</div>
            <div class="movie-badge">Hoạt hình</div>
            <div class="movie-rating">⭐ 8.9</div>
            <div class="movie-duration">100 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Inside Out 2</div>
                <div class="movie-meta">Hoạt hình · Gia đình</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Promo Card -->
        <div class="promo-card">
            <div>
<div class="promo-card">
    <div>
        <div class="promo-icon">🍿</div>
        <div class="promo-title">Ưu Đãi<br>Đặc Biệt</div>
        <div class="promo-desc">Giảm giá đến <strong style="color:var(--red)">50%</strong> cho thành viên mới đăng ký hôm nay!</div>
    </div>
    <button class="btn-promo">Khám phá →</button>
</div>
</div>
</section>
<div class="glow-divider"></div>
</body>
</html>

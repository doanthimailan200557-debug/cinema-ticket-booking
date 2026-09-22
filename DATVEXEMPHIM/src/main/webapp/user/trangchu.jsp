<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Đặt Vé Xem Phim</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --red: #e50914;
            --dark-red: #b0060f;
            --bg-dark: #0d0d0d;
            --bg-card: #1a1a1a;
            --bg-nav: #111111;
            --text-white: #ffffff;
            --text-gray: #aaaaaa;
            --gold: #f5c518;
        }

        body {
            font-family: 'Be Vietnam Pro', sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-white);
            overflow-x: hidden;
        }

        /* ========== NAVBAR ========== */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(17, 17, 17, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(229, 9, 20, 0.2);
            padding: 0 40px;
            height: 64px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 40px;
        }

        .logo {
            display: flex;
            flex-direction: column;
            line-height: 1;
            text-decoration: none;
        }

        .logo-main {
            font-size: 26px;
            font-weight: 900;
            color: var(--red);
            letter-spacing: -1px;
        }

        .logo-main span {
            color: var(--text-white);
        }

        .logo-sub {
            font-size: 9px;
            color: var(--text-gray);
            letter-spacing: 0.5px;
        }

        .nav-menu {
            display: flex;
            align-items: center;
            gap: 8px;
            list-style: none;
        }

        .nav-menu a {
            text-decoration: none;
            color: var(--text-white);
            font-size: 14px;
            font-weight: 500;
            padding: 6px 12px;
            border-radius: 6px;
            transition: all 0.2s;
        }

        .nav-menu a:hover,
        .nav-menu a.active {
            color: var(--red);
            background: rgba(229, 9, 20, 0.1);
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .search-box {
            display: flex;
            align-items: center;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 8px;
            padding: 7px 14px;
            gap: 8px;
            transition: all 0.2s;
        }

        .search-box:focus-within {
            border-color: var(--red);
            background: rgba(229, 9, 20, 0.05);
        }

        .search-box input {
            background: none;
            border: none;
            outline: none;
            color: var(--text-white);
            font-size: 13px;
            width: 200px;
            font-family: inherit;
        }

        .search-box input::placeholder {
            color: var(--text-gray);
        }

        .search-box svg {
            color: var(--text-gray);
            flex-shrink: 0;
        }

        .btn-login {
            background: none;
            border: 1.5px solid rgba(255,255,255,0.3);
            color: var(--text-white);
            padding: 7px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            font-family: inherit;
        }

        .btn-login:hover {
            border-color: var(--red);
            color: var(--red);
        }

        .nav-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255,255,255,0.07);
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            transition: all 0.2s;
        }

        .nav-icon:hover {
            background: rgba(229, 9, 20, 0.2);
            color: var(--red);
        }

        /* ========== HERO SECTION ========== */
        .hero {
            margin-top: 64px;
            height: calc(100vh - 64px);
            min-height: 520px;
            max-height: 700px;
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #0d0d0d 0%, #1a0a0a 50%, #0d0d0d 100%);
        }

        .hero-slide {
            position: absolute;
            inset: 0;
            display: none;
            opacity: 0;
            transition: opacity 0.8s ease;
        }

        .hero-slide.active {
            display: flex;
            opacity: 1;
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg,
                rgba(0,0,0,0.92) 0%,
                rgba(0,0,0,0.7) 50%,
                rgba(0,0,0,0.2) 100%);
            z-index: 1;
        }

        .hero-poster {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 55%;
            object-fit: cover;
            object-position: center top;
        }

        .hero-genre-tags {
            position: absolute;
            top: 80px;
            right: 160px;
            z-index: 3;
            display: flex;
            flex-direction: column;
            gap: 4px;
            text-align: right;
        }

        .hero-genre-tags span {
            font-size: 13px;
            font-weight: 700;
            color: rgba(255,255,255,0.5);
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            padding: 60px 60px 0;
            max-width: 580px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .hero-title {
            font-size: 72px;
            font-weight: 900;
            line-height: 1;
            color: var(--text-white);
            text-transform: uppercase;
            margin-bottom: 8px;
            text-shadow: 0 4px 20px rgba(0,0,0,0.8);
        }

        .hero-title .highlight {
            color: var(--red);
        }

        .hero-subtitle {
            font-size: 18px;
            font-weight: 600;
            color: var(--red);
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 32px;
            border-top: 2px solid var(--red);
            padding-top: 10px;
            display: inline-block;
        }

        .hero-features {
            display: flex;
            gap: 28px;
            margin-bottom: 36px;
        }

        .hero-feature {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: rgba(255,255,255,0.75);
        }

        .hero-feature svg {
            color: var(--red);
            flex-shrink: 0;
        }

        .hero-feature span {
            font-weight: 500;
        }

        .hero-feature small {
            display: block;
            font-size: 11px;
            color: var(--text-gray);
        }

        .btn-hero {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: var(--red);
            color: white;
            padding: 14px 32px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            transition: all 0.2s;
            width: fit-content;
            border: none;
            cursor: pointer;
            font-family: inherit;
        }

        .btn-hero:hover {
            background: var(--dark-red);
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(229, 9, 20, 0.4);
        }

        /* Slide dots */
        .hero-dots {
            position: absolute;
            bottom: 28px;
            left: 60px;
            z-index: 3;
            display: flex;
            gap: 8px;
        }

        .hero-dot {
            width: 8px;
            height: 8px;
            border-radius: 4px;
            background: rgba(255,255,255,0.3);
            cursor: pointer;
            transition: all 0.3s;
            border: none;
        }

        .hero-dot.active {
            width: 24px;
            background: var(--red);
        }

        /* ========== SECTION COMMON ========== */
        .section {
            padding: 48px 40px;
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 20px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .section-title-icon {
            width: 28px;
            height: 28px;
            background: var(--red);
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .section-link {
            color: var(--red);
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 4px;
            transition: gap 0.2s;
        }

        .section-link:hover {
            gap: 8px;
        }

        /* ========== MOVIE LIST ========== */
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 16px;
        }

        .movie-card {
            background: var(--bg-card);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;
        }

        .movie-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 40px rgba(0,0,0,0.6);
        }

        .movie-card:hover .movie-overlay {
            opacity: 1;
        }

        .movie-thumb {
            position: relative;
            aspect-ratio: 2/3;
            overflow: hidden;
        }

        .movie-thumb img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s;
        }

        .movie-card:hover .movie-thumb img {
            transform: scale(1.06);
        }

        .movie-badge {
            position: absolute;
            top: 8px;
            left: 8px;
            background: var(--red);
            color: white;
            font-size: 10px;
            font-weight: 700;
            padding: 3px 7px;
            border-radius: 4px;
            letter-spacing: 0.5px;
        }

        .movie-rating {
            position: absolute;
            bottom: 8px;
            left: 8px;
            background: rgba(0,0,0,0.75);
            backdrop-filter: blur(4px);
            color: var(--gold);
            font-size: 12px;
            font-weight: 700;
            padding: 3px 7px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 3px;
        }

        .movie-duration {
            position: absolute;
            bottom: 8px;
            right: 8px;
            background: rgba(0,0,0,0.75);
            backdrop-filter: blur(4px);
            color: var(--text-gray);
            font-size: 11px;
            padding: 3px 6px;
            border-radius: 4px;
        }

        .movie-overlay {
            position: absolute;
            inset: 0;
            background: rgba(229, 9, 20, 0.15);
            opacity: 0;
            transition: opacity 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .movie-info {
            padding: 12px;
        }

        .movie-name {
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 4px;
            line-height: 1.3;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .movie-meta {
            font-size: 11px;
            color: var(--text-gray);
            margin-bottom: 10px;
        }

        .btn-book {
            width: 100%;
            padding: 8px;
            background: var(--red);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.2s;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-book:hover {
            background: var(--dark-red);
        }

        /* Promo card */
        .promo-card {
            background: linear-gradient(145deg, #1a0a0a, #2a0a0a);
            border: 1px solid rgba(229, 9, 20, 0.3);
            border-radius: 12px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .promo-card::before {
            content: '';
            position: absolute;
            top: -30px;
            right: -30px;
            width: 100px;
            height: 100px;
            background: radial-gradient(circle, rgba(229,9,20,0.2) 0%, transparent 70%);
        }

        .promo-icon {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .promo-title {
            font-size: 15px;
            font-weight: 800;
            color: var(--red);
            text-transform: uppercase;
            margin-bottom: 6px;
            line-height: 1.2;
        }

        .promo-desc {
            font-size: 12px;
            color: var(--text-gray);
            margin-bottom: 14px;
            line-height: 1.5;
        }

        .btn-promo {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: none;
            border: 1.5px solid var(--red);
            color: var(--red);
            padding: 7px 14px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.2s;
            width: fit-content;
        }

        .btn-promo:hover {
            background: var(--red);
            color: white;
        }

        /* ========== STEPS SECTION ========== */
        .steps-section {
            padding: 40px;
            background: linear-gradient(180deg, rgba(229,9,20,0.05) 0%, transparent 100%);
        }

        .steps-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .step-card {
            background: var(--bg-card);
            border-radius: 16px;
            padding: 32px 24px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.05);
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .step-card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: var(--red);
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .step-card:hover {
            border-color: rgba(229, 9, 20, 0.3);
            transform: translateY(-4px);
        }

        .step-card:hover::after {
            transform: scaleX(1);
        }

        .step-icon {
            width: 72px;
            height: 72px;
            background: rgba(229, 9, 20, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            font-size: 32px;
            border: 2px solid rgba(229, 9, 20, 0.2);
        }

        .step-title {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 6px;
            color: var(--text-white);
        }

        .step-sub {
            font-size: 12px;
            color: var(--text-gray);
        }

        /* ========== FOOTER ========== */
        .footer {
            background: #080808;
            border-top: 1px solid rgba(255,255,255,0.06);
            padding: 48px 40px 24px;
        }

        .footer-brand {
            text-align: center;
            padding: 20px 0;
        }

        .footer-logo {
            font-size: 42px;
            font-weight: 900;
            color: var(--red);
        }

        .footer-logo span {
            color: var(--text-white);
        }

        .footer-tagline {
            font-size: 14px;
            color: var(--text-gray);
            margin-top: 4px;
        }

        .footer-bottom {
            text-align: center;
            font-size: 12px;
            color: rgba(255,255,255,0.3);
            padding-top: 24px;
            border-top: 1px solid rgba(255,255,255,0.06);
            margin-top: 32px;
        }

        /* Divider glow */
        .glow-divider {
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--red), transparent);
            opacity: 0.4;
            margin: 0 40px;
        }

        /* Scrollbar */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: var(--bg-dark); }
        ::-webkit-scrollbar-thumb { background: var(--red); border-radius: 3px; }
    </style>
</head>
<body>

<!-- ========== NAVBAR ========== -->
<nav class="navbar">
    <div class="nav-left">
        <a href="#" class="logo">
            <div class="logo-main">🎬 CINE<span>+</span></div>
            <div class="logo-sub">More Movies, More Feelings</div>
        </a>
        <ul class="nav-menu">
            <li><a href="#" class="active">Trang chủ</a></li>
            <li><a href="#">Phim</a></li>
            <li><a href="#">Lịch chiếu</a></li>
            <li><a href="#">Rạp</a></li>
            <li><a href="#">Ưu đãi</a></li>
        </ul>
    </div>
    <div class="nav-right">
        <div class="search-box">
            <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
            </svg>
            <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
        </div>
        <button class="nav-icon">
            <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
            </svg>
        </button>
        <button class="nav-icon">
            <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/>
            </svg>
        </button>
    </div>
</nav>

<!-- ========== HERO SECTION ========== -->
<section class="hero">

    <!-- Slide 1 -->
    <div class="hero-slide active" id="slide-0">
        <div class="hero-bg"></div>
        <!-- Gradient poster background -->
        <div style="position:absolute;right:0;top:0;bottom:0;width:60%;background:linear-gradient(135deg,#1a0505,#3d0a0a,#1a0505);z-index:0;">
            <!-- Decorative film elements -->
            <div style="position:absolute;inset:0;background:url('data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22400%22 height=%22400%22><defs><radialGradient id=%22g%22><stop offset=%220%25%22 stop-color=%22%23e50914%22 stop-opacity=%220.15%22/><stop offset=%22100%25%22 stop-color=%22transparent%22/></radialGradient></defs><circle cx=%22300%22 cy=%22150%22 r=%22200%22 fill=%22url(%23g)%22/></svg>') no-repeat center;"></div>
            <div style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-size:220px;opacity:0.04;font-weight:900;letter-spacing:-10px;user-select:none;white-space:nowrap;color:#fff;">🎬</div>
        </div>

        <div class="hero-content">
            <div class="hero-title">ĐẶT VÉ<br><span class="highlight">XEM</span><br>PHIM</div>
            <div class="hero-subtitle">Nhanh chóng · Dễ dàng · Tiện lợi</div>
            <div class="hero-features">
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/>
                    </svg>
                    <div>
                        <span>Chọn phim yêu thích</span>
                    </div>
                </div>
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/>
                    </svg>
                    <div>
                        <span>Chọn suất chiếu linh hoạt</span>
                    </div>
                </div>
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                    </svg>
                    <div>
                        <span>Thanh toán an toàn</span>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                🎟️ Mua vé ngay →
            </a>
        </div>

        <div class="hero-genre-tags">
            <span>ACTION</span>
            <span>THRILLER</span>
            <span>DRAMA</span>
        </div>
    </div>

    <!-- Slide 2 -->
    <div class="hero-slide" id="slide-1">
        <div class="hero-bg"></div>
        <div style="position:absolute;right:0;top:0;bottom:0;width:60%;background:linear-gradient(135deg,#0a0a1a,#0a1a3d,#0a0a1a);z-index:0;">
            <div style="position:absolute;inset:0;background:url('data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22400%22 height=%22400%22><defs><radialGradient id=%22g%22><stop offset=%220%25%22 stop-color=%22%230050ff%22 stop-opacity=%220.15%22/><stop offset=%22100%25%22 stop-color=%22transparent%22/></radialGradient></defs><circle cx=%22300%22 cy=%22150%22 r=%22200%22 fill=%22url(%23g)%22/></svg>') no-repeat center;"></div>
            <div style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-size:220px;opacity:0.04;font-weight:900;letter-spacing:-10px;user-select:none;white-space:nowrap;color:#fff;">🌟</div>
        </div>
        <div class="hero-content">
            <div style="font-size:13px;color:var(--red);font-weight:700;letter-spacing:2px;text-transform:uppercase;margin-bottom:10px;">Phim mới ra mắt</div>
            <div class="hero-title" style="font-size:60px;">PHIM HAY<br>TUẦN NÀY</div>
            <div class="hero-subtitle">Trải nghiệm rạp chiếu cực đỉnh</div>
            <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                📅 Xem lịch chiếu →
            </a>
        </div>
    </div>

    <!-- Dots -->
    <div class="hero-dots">
        <button class="hero-dot active" onclick="goSlide(0)"></button>
        <button class="hero-dot" onclick="goSlide(1)"></button>
    </div>
</section>

<div class="glow-divider"></div>

<!-- ========== DANH SÁCH PHIM ========== -->
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

    <div class="movie-grid">
        <!-- Phim 1 -->
        <div class="movie-card">
            <div class="movie-thumb">
                <div style="width:100%;height:100%;background:linear-gradient(145deg,#1a1a2e,#16213e,#0f3460);display:flex;align-items:center;justify-content:center;font-size:60px;">🗡️</div>
                <div class="movie-badge">Hành động</div>
                <div class="movie-rating">⭐ 8.7</div>
                <div class="movie-duration">118 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
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
                <div style="width:100%;height:100%;background:linear-gradient(145deg,#0d2137,#1a3a5c,#0d2137);display:flex;align-items:center;justify-content:center;font-size:60px;">🕵️</div>
                <div class="movie-badge">Trinh thám</div>
                <div class="movie-rating">⭐ 8.5</div>
                <div class="movie-duration">135 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
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
                <div style="width:100%;height:100%;background:linear-gradient(145deg,#1a0a1a,#3d1a3d,#1a0a1a);display:flex;align-items:center;justify-content:center;font-size:60px;">💕</div>
                <div class="movie-badge">Tình cảm</div>
                <div class="movie-rating">⭐ 8.2</div>
                <div class="movie-duration">112 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
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
                <div style="width:100%;height:100%;background:linear-gradient(145deg,#0a1a0a,#1a3d1a,#0a1a0a);display:flex;align-items:center;justify-content:center;font-size:60px;">😊</div>
                <div class="movie-badge">Hoạt hình</div>
                <div class="movie-rating">⭐ 8.9</div>
                <div class="movie-duration">100 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
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
                <div class="promo-icon">🍿</div>
                <div class="promo-title">Ưu Đãi<br>Đặc Biệt</div>
                <div class="promo-desc">Giảm giá đến <strong style="color:var(--red)">50%</strong> cho thành viên mới đăng ký hôm nay!</div>
            </div>
            <button class="btn-promo">Khám phá →</button>
        </div>
    </div>
</section>

<div class="glow-divider"></div>

<!-- ========== STEPS ========== -->
<section class="steps-section">
    <div class="steps-grid">
        <div class="step-card">
            <div class="step-icon">🎬</div>
            <div class="step-title">Chọn Phim</div>
            <div class="step-sub">vé phim</div>
        </div>
        <div class="step-card">
            <div class="step-icon">📅</div>
            <div class="step-title">Chọn Suất</div>
            <div class="step-sub">lịch chiếu</div>
        </div>
        <div class="step-card">
            <div class="step-icon">💺</div>
            <div class="step-title">Chọn Ghế</div>
            <div class="step-sub">ma trận ghế mơ</div>
        </div>
        <div class="step-card">
            <div class="step-icon">💳</div>
            <div class="step-title">Thanh Toán</div>
            <div class="step-sub">an toàn · nhanh chóng</div>
        </div>
    </div>
</section>

<!-- ========== FOOTER ========== -->
<footer class="footer">
    <div class="footer-brand">
        <div class="footer-logo">🎬 CINE<span>+</span></div>
        <div class="footer-tagline">Rạp phim trong tầm tay bạn!</div>
    </div>
    <div class="footer-bottom">
        © 2026 CINE+ · All rights reserved · Rạp phim trong tầm tay bạn
    </div>
</footer>

<script>
    // Hero slideshow
    let currentSlide = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.hero-dot');

    function goSlide(n) {
        slides[currentSlide].classList.remove('active');
        dots[currentSlide].classList.remove('active');
        currentSlide = n;
        slides[currentSlide].classList.add('active');
        dots[currentSlide].classList.add('active');
    }

    // Auto slide every 5s
    setInterval(() => {
        goSlide((currentSlide + 1) % slides.length);
    }, 5000);
</script>

</body>
</html>

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
    <%@ include file="../common/header.jsp" %>
</head>
<body>
<div class="page-content">

<!-- ============================================================
     HERO BANNER
============================================================ -->
<section class="hero">
    <div class="hero-slides">

        <!-- Slide 1 -->
        <div class="hero-slide active" id="sl0">
            <div class="hero-bg-img" style="background-image:url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=1400&q=80');"></div>
            <div class="hero-overlay"></div>
            <div class="hero-red-tint"></div>

            <div class="hero-tags">
                <span>ACTION</span>
                <span>THRILLER</span>
                <span>DRAMA</span>
            </div>

            <div class="hero-content">
                <div class="hero-title">
                    ĐẶT VÉ<br>
                    <span class="hl">XEM</span><br>
                    PHIM
                </div>
                <div class="hero-sub">Nhanh Chóng · Dễ Dàng · Tiện Lợi</div>
                <div class="hero-feats">
                    <div class="hero-feat">
                        <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/>
                        </svg>
                        <span>Chọn phim yêu thích</span>
                    </div>
                    <div class="hero-feat">
                        <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <rect x="3" y="4" width="18" height="18" rx="2"/>
                            <line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/>
                            <line x1="3" y1="10" x2="21" y2="10"/>
                        </svg>
                        <span>Chọn suất chiếu linh hoạt</span>
                    </div>
                    <div class="hero-feat">
                        <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                        </svg>
                        <span>Thanh toán an toàn</span>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                    MUA VÉ NGAY &nbsp;→
                </a>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="hero-slide" id="sl1">
            <div class="hero-bg-img" style="background-image:url('https://images.unsplash.com/photo-1485846234645-a62644f84728?w=1400&q=80');"></div>
            <div class="hero-overlay"></div>
            <div class="hero-red-tint"></div>
            <div class="hero-content">
                <div style="font-size:11px;color:var(--red);font-weight:700;letter-spacing:3px;text-transform:uppercase;margin-bottom:10px;">✦ Phim mới ra mắt</div>
                <div class="hero-title" style="font-size:64px;">PHIM HAY<br>TUẦN NÀY</div>
                <div class="hero-sub">Trải Nghiệm Rạp Chiếu Cực Đỉnh</div>
                <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                    XEM LỊCH CHIẾU &nbsp;→
                </a>
            </div>
        </div>

    </div>

    <div class="hero-dots">
        <button class="hero-dot active" onclick="goSlide(0)"></button>
        <button class="hero-dot" onclick="goSlide(1)"></button>
    </div>
</section>

<div class="glow-div"></div>

<!-- ============================================================
     DANH SÁCH PHIM
============================================================ -->
<section class="section">
    <div class="sec-head">
        <div class="sec-title">
            <div class="sec-title-icon">
                <svg width="14" height="14" fill="none" stroke="white" stroke-width="2.5" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3"/>
                    <path d="M7 2v20M17 2v20M2 12h20M2 7h5M17 7h5M2 17h5M17 17h5"/>
                </svg>
            </div>
            Danh Sách Phim
        </div>
        <a href="#" class="sec-link">Xem tất cả →</a>
    </div>

    <div class="movie-grid">

        <!-- Phim 1 -->
        <div class="movie-card">
            <div class="movie-thumb">
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0f1623,#1a2a4a,#0a0e1a);">
                    <svg width="80" height="120" viewBox="0 0 80 120" fill="none" style="opacity:0.6">
                        <ellipse cx="40" cy="20" rx="16" ry="18" fill="#aaa"/>
                        <rect x="33" y="36" width="14" height="50" rx="4" fill="#888"/>
                        <rect x="20" y="58" width="40" height="7"  rx="3" fill="#666"/>
                        <rect x="38" y="82" width="4"  height="28" rx="2" fill="#555"/>
                    </svg>
                </div>
                <div class="movie-badge">Hành động</div>
                <div class="movie-rating">★ 8.7</div>
                <div class="movie-dur">118'</div>
                <div class="movie-ov">
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white"/>
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
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0d1e30,#1a3552,#0d1825);">
                    <svg width="80" height="120" viewBox="0 0 80 120" fill="none" style="opacity:0.6">
                        <ellipse cx="40" cy="22" rx="15" ry="17" fill="#bbb"/>
                        <rect x="28" y="37" width="24" height="48" rx="5" fill="#999"/>
                        <rect x="22" y="50" width="8"  height="25" rx="3" fill="#777"/>
                        <rect x="50" y="50" width="8"  height="25" rx="3" fill="#777"/>
                        <rect x="33" y="83" width="7"  height="28" rx="3" fill="#666"/>
                        <rect x="40" y="83" width="7"  height="28" rx="3" fill="#666"/>
                    </svg>
                </div>
                <div class="movie-badge">Trinh thám</div>
                <div class="movie-rating">★ 8.5</div>
                <div class="movie-dur">135'</div>
                <div class="movie-ov">
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white"/>
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
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#1e0a22,#3d1a45,#1a0a20);">
                    <svg width="80" height="120" viewBox="0 0 80 120" fill="none" style="opacity:0.6">
                        <ellipse cx="28" cy="20" rx="12" ry="14" fill="#daa"/>
                        <ellipse cx="52" cy="24" rx="13" ry="15" fill="#caa"/>
                        <rect x="16" y="32" width="22" height="42" rx="5" fill="#c88"/>
                        <rect x="42" y="36" width="20" height="42" rx="5" fill="#b88"/>
                        <path d="M30 55 Q40 65 50 55" stroke="#e50914" stroke-width="3" fill="none"/>
                    </svg>
                </div>
                <div class="movie-badge">Tình cảm</div>
                <div class="movie-rating">★ 8.2</div>
                <div class="movie-dur">112'</div>
                <div class="movie-ov">
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white"/>
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
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0a1e10,#1a4228,#0a1a10);">
                    <svg width="80" height="120" viewBox="0 0 80 120" fill="none" style="opacity:0.7">
                        <circle cx="40" cy="30" r="22" fill="#f0c040"/>
                        <circle cx="32" cy="26" r="4"  fill="#333"/>
                        <circle cx="48" cy="26" r="4"  fill="#333"/>
                        <path d="M30 38 Q40 48 50 38" stroke="#333" stroke-width="3" fill="none" stroke-linecap="round"/>
                        <ellipse cx="40" cy="80" rx="20" ry="28" fill="#4fc3a1"/>
                    </svg>
                </div>
                <div class="movie-badge">Hoạt hình</div>
                <div class="movie-rating">★ 8.9</div>
                <div class="movie-dur">100'</div>
                <div class="movie-ov">
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white"/>
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
                <div class="promo-emoji">🍿</div>
                <div class="promo-title">Ưu Đãi<br>Đặc Biệt</div>
                <div class="promo-desc">
                    Giảm giá đến <strong style="color:var(--red);font-size:15px;">50%</strong><br>
                    cho thành viên mới!
                </div>
            </div>
            <button class="btn-promo">Khám phá →</button>
        </div>

    </div>
</section>

<div class="glow-div"></div>

<!-- ============================================================
     4 BƯỚC ĐẶT VÉ
============================================================ -->
<section class="steps-section">
    <div class="steps-grid">

        <div class="step-card">
            <div class="step-icon">
                <svg width="28" height="28" fill="none" stroke="#e50914" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3" fill="none"/>
                    <path d="M7 2v20M17 2v20M2 12h20M2 7h5M17 7h5M2 17h5M17 17h5"/>
                </svg>
            </div>
            <div class="step-title">Chọn Phim</div>
            <div class="step-sub">vé phim</div>
        </div>

        <div class="step-card">
            <div class="step-icon">
                <svg width="28" height="28" fill="none" stroke="#e50914" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="3" y="4" width="18" height="18" rx="2"/>
                    <line x1="16" y1="2" x2="16" y2="6"/>
                    <line x1="8"  y1="2" x2="8"  y2="6"/>
                    <line x1="3"  y1="10" x2="21" y2="10"/>
                </svg>
            </div>
            <div class="step-title">Chọn Suất</div>
            <div class="step-sub">lịch chiếu</div>
        </div>

        <div class="step-card">
            <div class="step-icon">
                <svg width="28" height="28" fill="none" stroke="#e50914" stroke-width="1.8" viewBox="0 0 24 24">
                    <path d="M4 18v-6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v6"/>
                    <path d="M4 18h16M6 18v2M18 18v2"/>
                    <path d="M8 10V7a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v3"/>
                </svg>
            </div>
            <div class="step-title">Chọn Ghế</div>
            <div class="step-sub">ma trận ghế mơ</div>
        </div>

        <div class="step-card">
            <div class="step-icon">
                <svg width="28" height="28" fill="none" stroke="#e50914" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="1" y="4" width="22" height="16" rx="3"/>
                    <line x1="1"  y1="10" x2="23" y2="10"/>
                    <line x1="6"  y1="15" x2="10" y2="15"/>
                </svg>
            </div>
            <div class="step-title">Thanh Toán</div>
            <div class="step-sub">ví · thẻ · QR</div>
        </div>

    </div>
</section>

<%@ include file="../common/footer.jsp" %>

</div><!-- /.page-content -->

<script>
    let cur = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots   = document.querySelectorAll('.hero-dot');

    function goSlide(n) {
        slides[cur].classList.remove('active');
        dots[cur].classList.remove('active');
        cur = n;
        slides[cur].classList.add('active');
        dots[cur].classList.add('active');
    }

    setInterval(() => goSlide((cur + 1) % slides.length), 5500);
</script>
</body>
</html>

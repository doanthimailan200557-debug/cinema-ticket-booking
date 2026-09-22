</header>

    <!-- Main Content Container -->
    <main class="main-wrapper">

        <!-- Title Header -->
        <div class="page-header-title">
            <h1 class="page-title">CHỌN SUẤT CHIẾU</h1>
        </div>

        <!-- Filter Card Section (Combined Interface 1) -->
        <section class="filter-card">
            <!-- Horizontal Date Carousel Tabs -->
            <div class="date-selector-wrapper">
                <div class="date-tab active" data-date="14/10">
                    <div class="date-day">Hôm Nay</div>
                    <div class="date-num">14/10</div>
                </div>
                <div class="date-tab" data-date="15/10">
                    <div class="date-day">Thứ Hai</div>
                    <div class="date-num">15/10</div>
                </div>
                <div class="date-tab" data-date="16/10">
                    <div class="date-day">Thứ Ba</div>
                    <div class="date-num">16/10</div>
                </div>
                <div class="date-tab" data-date="17/10">
                    <div class="date-day">Thứ Tư</div>
                    <div class="date-num">17/10</div>
                </div>
                <div class="date-tab" data-date="18/10">
                    <div class="date-day">Thứ Năm</div>
                    <div class="date-num">18/10</div>
                </div>
                <div class="date-tab" data-date="19/10">
                    <div class="date-day">Thứ Sáu</div>
                    <div class="date-num">19/10</div>
                </div>
            </div>

            <!-- Filters Row -->
            <div class="filters-row">
                <!-- Cinema Selector -->
                <div class="filter-group">
                    <label class="filter-label" for="cinemaSelect">Chọn Rạp</label>
                    <div class="custom-select-wrapper">
                        <select id="cinemaSelect" class="custom-select">
                            <option value="all">Tất cả các rạp</option>
                            <option value="cgv_vincom" selected>CGV Vincom - Phòng 1 (2D)</option>
                            <option value="bhd_landmark">BHD Landmark 81 - IMAX</option>
                            <option value="lotte_vincom">Lotte Vincom - Phòng 1 IMAX</option>
                        </select>
                        <span class="select-arrow">▼</span>
                    </div>
                </div>

                <!-- Format Radio Options -->
                <div class="filter-group">
                    <span class="filter-label">Định dạng</span>
                    <div class="format-options">
                        <label class="format-radio-btn">
                            <input type="radio" name="formatFilter" value="all">
                            <span>Tất cả</span>
                        </label>
                        <label class="format-radio-btn">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Chọn Suất Chiếu</title>
    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

    <!-- Header Navigation -->
    <header class="header-nav">
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="brand-container">
            <div class="brand-logo-icon">
                <svg viewBox="0 0 24 24">
                    <path d="M18 4l2 4h-3l-2-4h-2l2 4h-3l-2-4h-2l2 4H7L5 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V4h-4zM8 17H4v-4h4v4zm0-6H4V7h4v4zm6 6h-4v-4h4v4zm0-6h-4V7h4v4zm6 6h-4v-4h4v4zm0-6h-4V7h4v4z"/>
                </svg>
            </div>
            <div class="brand-text-group">
                <div class="brand-name">CINE<span>+</span></div>
                <div class="brand-tagline">More Movies, More Feelings</div>
            </div>
        </a>

        <ul class="nav-menu">
            <li><a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="nav-link">Trang chủ</a></li>
            <li><a href="#" class="nav-link">Phim</a></li>
            <li><a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="nav-link active">Lịch chiếu</a></li>
            <li><a href="#" class="nav-link">Rạp</a></li>
            <li><a href="#" class="nav-link">Ưu đãi</a></li>
        </ul>

        <div class="header-right">
            <div class="search-box">
                <input type="text" class="search-input" placeholder="Tìm kiếm phim, diễn viên...">
                <button class="search-btn" type="button" aria-label="Search">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </button>
            </div>

            <button class="header-icon-btn" aria-label="User Profile">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </button>

            <button class="header-icon-btn" aria-label="Menu">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
        </div>
<input type="radio" name="formatFilter" value="2d" checked>
                            <span>2D</span>
                        </label>
                        <label class="format-radio-btn">
                            <input type="radio" name="formatFilter" value="3d">
                            <span>3D</span>
                        </label>
                        <label class="format-radio-btn">
                            <input type="radio" name="formatFilter" value="imax">
                            <span>IMAX</span>
                        </label>
                        <label class="format-radio-btn">
                            <input type="radio" name="formatFilter" value="goldclass">
                            <span>Gold Class</span>
                        </label>
                    </div>
                </div>
            </div>
        </section>

        <!-- Movie Showcase List (Combined Interface 2 - Scrollable content) -->
        <section class="movies-container">

            <!-- Movie Card 1: Thanh Gươm Diệt Quỷ -->
            <article class="movie-card">
                <div class="movie-poster-box">
                    <img src="${pageContext.request.contextPath}/assets/images/demon_slayer.png" alt="Thanh Gươm Diệt Quỷ" class="movie-poster-img">
                    <div class="movie-rating-badge">
                        <span>★</span> 8.7
                    </div>
                </div>

                <div class="movie-details">
                    <h2 class="movie-title">Thanh Gươm Diệt Quỷ</h2>
                    <div class="movie-meta">Hành động | 120 phút | Khởi chiếu từ 10/2026</div>

                    <!-- Cinema Showtime Group 1 -->
                    <div class="cinema-group" data-cinema="cgv_vincom" data-format="2d">
                        <div class="cinema-name">CGV Vincom - Phòng 1 (2D)</div>
                        <div class="showtimes-grid">
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="10:00">10:00</button>
                            <button class="showtime-btn highlight active" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="13:30">13:30</button>
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="16:00">16:00</button>
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="19:30">19:30</button>
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="22:00">22:00</button>
                        </div>
                    </div>

                    <!-- Cinema Showtime Group 2 -->
<div class="cinema-group" data-cinema="bhd_landmark" data-format="imax">
                        <div class="cinema-name">CGV Landmark 81 - IMAX</div>
                        <div class="showtimes-grid">
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81 - IMAX" data-time="11:00">11:00</button>
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81 - IMAX" data-time="14:30">14:30</button>
                            <button class="showtime-btn highlight" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81 - IMAX" data-time="18:00">18:00</button>
                            <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81 - IMAX" data-time="21:30">21:30</button>
                        </div>
                    </div>
                </div>
            </article>

            <!-- Movie Card 2: Inside Out 2 -->
            <article class="movie-card">
                <div class="movie-poster-box">
                    <img src="${pageContext.request.contextPath}/assets/images/inside_out2.png" alt="Inside Out 2" class="movie-poster-img">
                    <div class="movie-rating-badge">
                        <span>★</span> 8.9
                    </div>
                </div>

                <div class="movie-details">
                    <h2 class="movie-title">Inside Out 2</h2>
                    <div class="movie-meta">Hoạt hình | 96 phút | Gia đình, Hài hước</div>

                    <!-- Cinema Showtime Group 1 -->
                    <div class="cinema-group" data-cinema="cgv_vincom" data-format="2d">
                        <div class="cinema-name">CGV Vincom - Phòng 1 (2D)</div>
                        <div class="showtimes-grid">
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="10:00">10:00</button>
                            <button class="showtime-btn highlight" data-movie="Inside Out 2" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="13:30">13:30</button>
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="16:00">16:00</button>
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="19:30">19:30</button>
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom - Phòng 1 (2D)" data-time="22:00">22:00</button>
                        </div>
                    </div>

                    <!-- Cinema Showtime Group 2 -->
                    <div class="cinema-group" data-cinema="bhd_landmark" data-format="imax">
                        <div class="cinema-name">CGV Landmark 81 - IMAX</div>
<div class="showtimes-grid">
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Landmark 81 - IMAX" data-time="11:00">11:00</button>
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Landmark 81 - IMAX" data-time="14:30">14:30</button>
                            <button class="showtime-btn highlight" data-movie="Inside Out 2" data-cinema="CGV Landmark 81 - IMAX" data-time="18:00">18:00</button>
                            <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Landmark 81 - IMAX" data-time="21:30">21:30</button>
                        </div>
                    </div>
                </div>
            </article>

        </section>
    </main>

    <!-- Bottom Sticky Action Bar -->
    <footer class="bottom-action-bar">
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="btn-back">
            <span>←</span> Quay lại
        </a>

        <div class="brand-footer-text">
            <span>CINE+</span> Rạp phim trong tầm tay bạn!
        </div>

        <div class="btn-action-group">
            <a href="${pageContext.request.contextPath}/user/chonghe.jsp" id="continueBtn" class="btn-continue">
                Tiếp tục <span>→</span>
            </a>
        </div>
    </footer>

    <!-- JavaScript Application -->
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>
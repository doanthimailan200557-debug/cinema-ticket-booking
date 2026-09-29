<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("currentPage", "lichChieu");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Chọn Suất Chiếu</title>
    <%@ include file="../common/header.jsp" %>
    <style>
    /* ===== PAGE HEADER ===== */
    .page-title-bar {
        padding: 28px 40px 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .page-title-bar h1 {
        font-size: 22px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--text-white);
    }

    .breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--text-gray);
        margin-bottom: 4px;
    }

    .breadcrumb a { color: var(--text-gray); text-decoration: none; transition: color 0.2s; }
    .breadcrumb a:hover { color: var(--red); }
    .breadcrumb span { color: var(--red); }

    /* ===== FILTER CARD ===== */
    .filter-card {
        margin: 20px 40px;
        background: var(--bg-card);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.06);
        overflow: hidden;
    }

    /* Date tabs */
    .date-tabs {
        display: flex;
        background: rgba(0,0,0,0.3);
        border-bottom: 1px solid rgba(255,255,255,0.06);
        overflow-x: auto;
        scrollbar-width: none;
    }

    .date-tabs::-webkit-scrollbar { display: none; }

    .date-tab {
        flex: 1;
        min-width: 90px;
        padding: 14px 10px;
        text-align: center;
        cursor: pointer;
        transition: all 0.2s;
        border-right: 1px solid rgba(255,255,255,0.04);
        position: relative;
    }

    .date-tab:last-child { border-right: none; }

    .date-tab::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 2px;
        background: var(--red);
        transform: scaleX(0);
        transition: transform 0.2s;
    }

    .date-tab:hover { background: rgba(255,255,255,0.03); }

    .date-tab.active { background: rgba(229,9,20,0.06); }
    .date-tab.active::after { transform: scaleX(1); }

    .date-day {
        font-size: 11px;
        font-weight: 600;
        color: var(--text-gray);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 3px;
    }

    .date-tab.active .date-day { color: var(--red); }

    .date-num {
        font-size: 15px;
        font-weight: 800;
        color: var(--text-white);
    }

    .date-tab.active .date-num { color: var(--red); }

    /* Filter row */
    .filters-row {
        display: flex;
        align-items: flex-end;
        gap: 24px;
        padding: 18px 24px;
        flex-wrap: wrap;
    }

    .filter-group { display: flex; flex-direction: column; gap: 6px; }

    .filter-label {
        font-size: 10px;
        font-weight: 700;
        color: var(--text-gray);
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .custom-select-wrap { position: relative; }

    .custom-select {
        appearance: none;
        background: rgba(255,255,255,0.05);
        border: 1px solid rgba(255,255,255,0.1);
        border-radius: 7px;
        padding: 8px 36px 8px 12px;
        color: var(--text-white);
        font-size: 13px;
        font-family: inherit;
        cursor: pointer;
        outline: none;
        min-width: 220px;
        transition: border-color 0.2s;
    }

    .custom-select:focus { border-color: rgba(229,9,20,0.5); }
    .custom-select option { background: #1a1a1a; }

    .select-arrow {
        position: absolute;
        right: 11px; top: 50%;
        transform: translateY(-50%);
        color: var(--text-gray);
        font-size: 10px;
        pointer-events: none;
    }

    /* Format radio pills */
    .format-pills { display: flex; gap: 6px; flex-wrap: wrap; }

    .format-pill {
        display: flex;
        align-items: center;
        gap: 0;
        cursor: pointer;
    }

    .format-pill input[type="radio"] { display: none; }

    .format-pill span {
        display: inline-block;
        padding: 6px 14px;
        border-radius: 20px;
        border: 1px solid rgba(255,255,255,0.12);
        background: rgba(255,255,255,0.04);
        color: var(--text-gray);
        font-size: 12px;
        font-weight: 600;
        transition: all 0.2s;
    }

    .format-pill input:checked + span {
        background: var(--red);
        border-color: var(--red);
        color: #fff;
    }

    .format-pill span:hover { border-color: rgba(229,9,20,0.4); color: var(--text-white); }

    /* ===== MOVIES LIST ===== */
    .movies-wrap { padding: 0 40px 40px; }

    .movie-row {
        display: flex;
        gap: 0;
        background: var(--bg-card);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.05);
        margin-bottom: 16px;
        overflow: hidden;
        transition: border-color 0.2s;
    }

    .movie-row:hover { border-color: rgba(229,9,20,0.2); }

    /* Poster */
    .movie-poster-col {
        width: 120px;
        flex-shrink: 0;
        position: relative;
        background: #111;
    }

    .movie-poster-col .mthumb-inner {
        position: absolute; inset: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 48px;
    }

    .poster-rating {
        position: absolute;
        bottom: 8px; left: 8px;
        background: rgba(0,0,0,0.8);
        color: var(--gold);
        font-size: 11px; font-weight: 700;
        padding: 2px 7px; border-radius: 4px;
        backdrop-filter: blur(4px);
    }

    /* Detail */
    .movie-detail-col {
        flex: 1;
        padding: 20px 24px;
        border-right: 1px solid rgba(255,255,255,0.05);
    }

    .movie-row-title {
        font-size: 17px; font-weight: 800;
        margin-bottom: 4px;
        color: var(--text-white);
    }

    .movie-row-meta {
        font-size: 12px; color: var(--text-gray);
        margin-bottom: 16px;
    }

    .cinema-group-title {
        font-size: 11px; font-weight: 700;
        color: var(--text-gray);
        text-transform: uppercase;
        letter-spacing: 0.8px;
        margin-bottom: 8px;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .cinema-group-title::before {
        content: '';
        display: inline-block;
        width: 3px; height: 12px;
        background: var(--red);
        border-radius: 2px;
    }

    .cinema-block { margin-bottom: 16px; }
    .cinema-block:last-child { margin-bottom: 0; }

    .showtimes-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .showtime-btn {
        padding: 7px 16px;
        border-radius: 6px;
        border: 1px solid rgba(255,255,255,0.12);
        background: rgba(255,255,255,0.04);
        color: var(--text-white);
        font-size: 13px; font-weight: 700;
        cursor: pointer;
        transition: all 0.2s;
        font-family: inherit;
    }

    .showtime-btn:hover {
        border-color: rgba(229,9,20,0.5);
        background: rgba(229,9,20,0.08);
        color: var(--red);
    }

    .showtime-btn.active {
        background: var(--red);
        border-color: var(--red);
        color: #fff;
        box-shadow: 0 0 12px rgba(229,9,20,0.3);
    }

    .showtime-btn.highlight {
        border-color: rgba(229,9,20,0.4);
        color: var(--red);
    }

    /* Action footer */
    .sticky-bar {
        position: sticky;
        bottom: 0;
        background: rgba(10,10,10,0.97);
        backdrop-filter: blur(12px);
        border-top: 1px solid rgba(255,255,255,0.07);
        padding: 14px 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        z-index: 100;
    }

    .sticky-info {
        font-size: 13px;
        color: var(--text-gray);
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .sticky-info strong { color: var(--text-white); }

    .sticky-actions { display: flex; gap: 10px; align-items: center; }

    .btn-back-link {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 9px 20px;
        border-radius: 7px;
        border: 1px solid rgba(255,255,255,0.12);
        background: transparent;
        color: var(--text-gray);
        font-size: 13px; font-weight: 600;
        text-decoration: none;
        transition: all 0.2s;
        font-family: inherit;
        cursor: pointer;
    }

    .btn-back-link:hover { border-color: rgba(255,255,255,0.3); color: var(--text-white); }

    .btn-continue {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 10px 28px;
        border-radius: 7px;
        background: var(--red);
        color: #fff;
        font-size: 14px; font-weight: 800;
        text-decoration: none;
        border: none; cursor: pointer;
        transition: all 0.2s;
        font-family: inherit;
        letter-spacing: 0.5px;
    }

    .btn-continue:hover {
        background: var(--dark-red);
        transform: translateY(-1px);
        box-shadow: 0 6px 18px rgba(229,9,20,0.35);
    }
    </style>
</head>
<body>
<div class="page-content">

    <!-- Breadcrumb + Title -->
    <div class="page-title-bar">
        <div>
            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/user/trangchu.jsp">Trang chủ</a>
                <span>›</span>
                <span style="color:var(--text-white)">Lịch chiếu</span>
            </div>
            <h1>Chọn Suất Chiếu</h1>
        </div>
    </div>

    <!-- Filter Card -->
    <div class="filter-card">
        <!-- Date tabs -->
        <div class="date-tabs" id="dateTabs">
            <div class="date-tab active" data-date="0">
                <div class="date-day">Hôm Nay</div>
                <div class="date-num" id="d0"></div>
            </div>
            <div class="date-tab" data-date="1">
                <div class="date-day" id="dn1"></div>
                <div class="date-num" id="d1"></div>
            </div>
            <div class="date-tab" data-date="2">
                <div class="date-day" id="dn2"></div>
                <div class="date-num" id="d2"></div>
            </div>
            <div class="date-tab" data-date="3">
                <div class="date-day" id="dn3"></div>
                <div class="date-num" id="d3"></div>
            </div>
            <div class="date-tab" data-date="4">
                <div class="date-day" id="dn4"></div>
                <div class="date-num" id="d4"></div>
            </div>
            <div class="date-tab" data-date="5">
                <div class="date-day" id="dn5"></div>
                <div class="date-num" id="d5"></div>
            </div>
            <div class="date-tab" data-date="6">
                <div class="date-day" id="dn6"></div>
                <div class="date-num" id="d6"></div>
            </div>
        </div>

        <!-- Filters -->
        <div class="filters-row">
            <div class="filter-group">
                <span class="filter-label">Chọn Rạp</span>
                <div class="custom-select-wrap">
                    <select id="cinemaSelect" class="custom-select">
                        <option value="all">Tất cả các rạp</option>
                        <option value="cgv_vincom">CGV Vincom - Phòng 1 (2D)</option>
                        <option value="bhd_landmark">CGV Landmark 81 - IMAX</option>
                        <option value="lotte_vincom">Lotte Vincom - IMAX</option>
                    </select>
                    <span class="select-arrow">▼</span>
                </div>
            </div>

            <div class="filter-group">
                <span class="filter-label">Định dạng</span>
                <div class="format-pills">
                    <label class="format-pill"><input type="radio" name="fmt" value="all" checked><span>Tất cả</span></label>
                    <label class="format-pill"><input type="radio" name="fmt" value="2d"><span>2D</span></label>
                    <label class="format-pill"><input type="radio" name="fmt" value="3d"><span>3D</span></label>
                    <label class="format-pill"><input type="radio" name="fmt" value="imax"><span>IMAX</span></label>
                    <label class="format-pill"><input type="radio" name="fmt" value="gold"><span>Gold Class</span></label>
                </div>
            </div>
        </div>
    </div>

    <!-- Movie List -->
    <div class="movies-wrap">

        <!-- Movie 1 -->
        <div class="movie-row">
            <div class="movie-poster-col">
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0f1623,#1a2a4a);">🗡️</div>
                <div class="poster-rating">★ 8.7</div>
            </div>
            <div class="movie-detail-col">
                <div class="movie-row-title">Thanh Gươm Diệt Quỷ</div>
                <div class="movie-row-meta">Hành động · 118 phút · Khởi chiếu 10/2026</div>

                <div class="cinema-block" data-cinema="cgv_vincom" data-fmt="2d">
                    <div class="cinema-group-title">CGV Vincom - Phòng 1 (2D)</div>
                    <div class="showtimes-grid">
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom" data-time="10:00">10:00</button>
                        <button class="showtime-btn active highlight" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom" data-time="13:30">13:30</button>
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom" data-time="16:00">16:00</button>
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom" data-time="19:30">19:30</button>
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Vincom" data-time="22:00">22:00</button>
                    </div>
                </div>

                <div class="cinema-block" data-cinema="bhd_landmark" data-fmt="imax">
                    <div class="cinema-group-title">CGV Landmark 81 - IMAX</div>
                    <div class="showtimes-grid">
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81" data-time="11:00">11:00</button>
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81" data-time="14:30">14:30</button>
                        <button class="showtime-btn highlight" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81" data-time="18:00">18:00</button>
                        <button class="showtime-btn" data-movie="Thanh Gươm Diệt Quỷ" data-cinema="CGV Landmark 81" data-time="21:30">21:30</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Movie 2 -->
        <div class="movie-row">
            <div class="movie-poster-col">
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0a1e10,#1a4228);">😊</div>
                <div class="poster-rating">★ 8.9</div>
            </div>
            <div class="movie-detail-col">
                <div class="movie-row-title">Inside Out 2</div>
                <div class="movie-row-meta">Hoạt hình · 100 phút · Gia đình, Hài hước</div>

                <div class="cinema-block" data-cinema="cgv_vincom" data-fmt="2d">
                    <div class="cinema-group-title">CGV Vincom - Phòng 1 (2D)</div>
                    <div class="showtimes-grid">
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom" data-time="09:30">09:30</button>
                        <button class="showtime-btn highlight" data-movie="Inside Out 2" data-cinema="CGV Vincom" data-time="12:00">12:00</button>
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom" data-time="15:30">15:30</button>
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom" data-time="18:30">18:30</button>
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="CGV Vincom" data-time="21:00">21:00</button>
                    </div>
                </div>

                <div class="cinema-block" data-cinema="lotte_vincom" data-fmt="3d">
                    <div class="cinema-group-title">Lotte Vincom - 3D</div>
                    <div class="showtimes-grid">
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="Lotte Vincom" data-time="10:30">10:30</button>
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="Lotte Vincom" data-time="13:00">13:00</button>
                        <button class="showtime-btn highlight" data-movie="Inside Out 2" data-cinema="Lotte Vincom" data-time="16:30">16:30</button>
                        <button class="showtime-btn" data-movie="Inside Out 2" data-cinema="Lotte Vincom" data-time="20:00">20:00</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Movie 3 -->
        <div class="movie-row">
            <div class="movie-poster-col">
                <div class="mthumb-inner" style="background:linear-gradient(160deg,#0d1e30,#1a3552);">🕵️</div>
                <div class="poster-rating">★ 8.5</div>
            </div>
            <div class="movie-detail-col">
                <div class="movie-row-title">Nhiệm Vụ Bất Khả Thi</div>
                <div class="movie-row-meta">Hành động · 135 phút · Gián điệp, Hồi hộp</div>

                <div class="cinema-block" data-cinema="bhd_landmark" data-fmt="imax">
                    <div class="cinema-group-title">CGV Landmark 81 - IMAX</div>
                    <div class="showtimes-grid">
                        <button class="showtime-btn" data-movie="Nhiệm Vụ Bất Khả Thi" data-cinema="CGV Landmark 81" data-time="11:30">11:30</button>
                        <button class="showtime-btn highlight" data-movie="Nhiệm Vụ Bất Khả Thi" data-cinema="CGV Landmark 81" data-time="15:00">15:00</button>
                        <button class="showtime-btn" data-movie="Nhiệm Vụ Bất Khả Thi" data-cinema="CGV Landmark 81" data-time="19:00">19:00</button>
                        <button class="showtime-btn" data-movie="Nhiệm Vụ Bất Khả Thi" data-cinema="CGV Landmark 81" data-time="22:30">22:30</button>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- /.movies-wrap -->

    <!-- Sticky bottom bar -->
    <div class="sticky-bar">
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="btn-back-link">
            ← Quay lại
        </a>
        <div class="sticky-info">
            <span id="sel-summary" style="color:var(--text-gray)">Chưa chọn suất chiếu</span>
        </div>
        <div class="sticky-actions">
            <a href="${pageContext.request.contextPath}/user/chonghe.jsp" id="btnContinue" class="btn-continue">
                Chọn ghế &nbsp;→
            </a>
        </div>
    </div>

</div><!-- /.page-content -->

<script>
    // --- Date tabs ---
    const days = ['Chủ Nhật','Thứ Hai','Thứ Ba','Thứ Tư','Thứ Năm','Thứ Sáu','Thứ Bảy'];
    const now  = new Date();
    for (let i = 0; i < 7; i++) {
        const d = new Date(now); d.setDate(now.getDate() + i);
        const dd = String(d.getDate()).padStart(2,'0');
        const mm = String(d.getMonth()+1).padStart(2,'0');
        document.getElementById('d'+i).textContent = dd+'/'+mm;
        if (i > 0) document.getElementById('dn'+i).textContent = days[d.getDay()];
    }

    document.querySelectorAll('.date-tab').forEach(t => {
        t.addEventListener('click', function() {
            document.querySelectorAll('.date-tab').forEach(x => x.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // --- Showtime selection ---
    let selectedShowtime = null;

    document.querySelectorAll('.showtime-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            document.querySelectorAll('.showtime-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            selectedShowtime = {
                movie  : this.dataset.movie,
                cinema : this.dataset.cinema,
                time   : this.dataset.time
            };
            document.getElementById('sel-summary').innerHTML =
                '<strong>' + selectedShowtime.movie + '</strong> &nbsp;·&nbsp; ' +
                selectedShowtime.cinema + ' &nbsp;·&nbsp; ' +
                '<strong style="color:var(--red)">' + selectedShowtime.time + '</strong>';
        });
    });
</script>
</body>
</html>

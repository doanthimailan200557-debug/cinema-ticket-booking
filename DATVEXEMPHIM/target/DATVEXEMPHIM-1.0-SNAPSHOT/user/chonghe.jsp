<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("currentPage", "lichChieu");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Chọn Ghế</title>
    <%@ include file="../common/header.jsp" %>
    <style>
    /* ===== PAGE WRAPPER ===== */
    .cg-wrap {
        padding: 24px 40px 0;
        min-height: calc(100vh - 58px - 62px);
    }

    /* Breadcrumb */
    .breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--text-gray);
        margin-bottom: 20px;
    }

    .breadcrumb a { color: var(--text-gray); text-decoration: none; transition: color 0.2s; }
    .breadcrumb a:hover { color: var(--red); }
    .breadcrumb .sep { color: rgba(255,255,255,0.2); }
    .breadcrumb .cur { color: var(--text-white); }

    /* Steps indicator */
    .steps-indicator {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0;
        margin-bottom: 28px;
    }

    .step-ind {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        font-weight: 600;
        color: var(--text-gray);
    }

    .step-ind .num {
        width: 26px; height: 26px;
        border-radius: 50%;
        background: rgba(255,255,255,0.07);
        border: 1px solid rgba(255,255,255,0.12);
        display: flex; align-items: center; justify-content: center;
        font-size: 11px; font-weight: 800;
    }

    .step-ind.done .num {
        background: rgba(229,9,20,0.15);
        border-color: var(--red);
        color: var(--red);
    }

    .step-ind.done { color: var(--red); }

    .step-ind.active .num {
        background: var(--red);
        border-color: var(--red);
        color: #fff;
    }

    .step-ind.active { color: var(--text-white); }

    .step-line {
        width: 60px; height: 1px;
        background: rgba(255,255,255,0.1);
        margin: 0 12px;
    }

    .step-line.done { background: var(--red); opacity: 0.4; }

    /* ===== MAIN LAYOUT ===== */
    .cg-layout {
        display: grid;
        grid-template-columns: 220px 1fr 240px;
        gap: 20px;
        align-items: start;
    }

    /* ===== LEFT: Movie Info ===== */
    .info-panel {
        background: var(--bg-card);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.06);
        overflow: hidden;
        position: sticky;
        top: 78px;
    }

    .panel-head {
        padding: 14px 16px;
        border-bottom: 1px solid rgba(255,255,255,0.06);
        font-size: 11px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--text-gray);
        background: rgba(229,9,20,0.05);
        display: flex;
        align-items: center;
        gap: 7px;
    }

    .panel-head svg { color: var(--red); }

    .movie-card-sm {
        padding: 16px;
    }

    .movie-poster-sm {
        width: 100%;
        aspect-ratio: 2/3;
        border-radius: 8px;
        object-fit: cover;
        margin-bottom: 14px;
        background: linear-gradient(160deg,#0f1623,#1a2a4a);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 44px;
    }

    .movie-sm-title {
        font-size: 14px;
        font-weight: 800;
        margin-bottom: 12px;
        line-height: 1.3;
    }

    .info-row {
        display: flex;
        align-items: flex-start;
        gap: 8px;
        font-size: 12px;
        color: var(--text-gray);
        margin-bottom: 8px;
        line-height: 1.4;
    }

    .info-row svg { color: var(--red); flex-shrink: 0; margin-top: 1px; }
    .info-row strong { color: var(--text-white); }

    .format-tag {
        display: inline-block;
        padding: 2px 8px;
        border-radius: 4px;
        background: rgba(229,9,20,0.12);
        border: 1px solid rgba(229,9,20,0.3);
        color: var(--red);
        font-size: 10px;
        font-weight: 700;
        margin-top: 8px;
    }

    /* ===== CENTER: Seat Grid ===== */
    .seat-panel {
        background: var(--bg-card);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.06);
        padding: 24px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* Screen */
    .screen-wrap {
        width: 100%;
        margin-bottom: 36px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .screen-bar {
        width: 85%;
        height: 8px;
        background: linear-gradient(to bottom, rgba(255,255,255,0.5), transparent);
        border-radius: 50% 50% 0 0 / 100% 100% 0 0;
        box-shadow: 0 -6px 20px rgba(255,255,255,0.08);
        margin-bottom: 6px;
    }

    .screen-label {
        font-size: 10px;
        font-weight: 700;
        letter-spacing: 5px;
        color: rgba(255,255,255,0.25);
        text-transform: uppercase;
    }

    /* Seat grid */
    .seat-grid { display: flex; flex-direction: column; gap: 6px; }

    .seat-row {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .row-lbl {
        width: 22px;
        text-align: right;
        margin-right: 10px;
        font-size: 11px;
        font-weight: 700;
        color: var(--text-gray);
        flex-shrink: 0;
    }

    .seat {
        width: 26px; height: 26px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 9px;
        font-weight: 700;
        cursor: pointer;
        transition: transform 0.15s, box-shadow 0.15s;
        user-select: none;
        flex-shrink: 0;
    }

    .seat.normal {
        background: #d0d0d0;
        color: #111;
    }

    .seat.vip {
        background: transparent;
        border: 1.5px solid var(--red);
        color: var(--red);
        font-size: 7px;
    }

    .seat.sold {
        background: #2a2a2a;
        color: transparent;
        cursor: not-allowed;
        position: relative;
    }

    .seat.sold::after {
        content: '✕';
        position: absolute;
        font-size: 10px;
        color: #444;
    }

    .seat.selected {
        background: var(--red);
        color: #fff;
        border: none;
        box-shadow: 0 0 10px rgba(229,9,20,0.5);
    }

    .seat:not(.sold):hover {
        transform: scale(1.18);
        z-index: 1;
    }

    .seat.normal:not(.sold):hover  { box-shadow: 0 0 8px rgba(255,255,255,0.25); }
    .seat.vip:not(.sold):hover     { background: rgba(229,9,20,0.15); box-shadow: 0 0 8px rgba(229,9,20,0.3); }

    /* Gap between halves */
    .seat.gap { visibility: hidden; }

    /* ===== RIGHT: Summary + Legend ===== */
    .right-col {
        display: flex;
        flex-direction: column;
        gap: 16px;
        position: sticky;
        top: 78px;
    }

    .panel-card {
        background: var(--bg-card);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.06);
        overflow: hidden;
    }

    .summary-body { padding: 16px; }

    .sum-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
        font-size: 13px;
        color: var(--text-gray);
    }

    .sum-row:last-of-type { margin-bottom: 0; }
    .sum-row strong { color: var(--text-white); font-size: 13px; }

    .sum-divider {
        height: 1px;
        background: rgba(255,255,255,0.06);
        margin: 14px 0;
    }

    .sum-total {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        font-weight: 800;
        color: var(--text-white);
    }

    .sum-total .price {
        color: var(--red);
        font-size: 18px;
    }

    /* Legend */
    .legend-body { padding: 14px 16px; }

    .leg-item {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
        font-size: 12px;
        color: var(--text-gray);
    }

    .leg-item:last-child { margin-bottom: 0; }

    .leg-seat {
        width: 22px; height: 22px;
        border-radius: 4px;
        flex-shrink: 0;
        display: flex; align-items: center; justify-content: center;
        font-size: 7px; font-weight: 700;
    }

    /* ===== STICKY BOTTOM BAR ===== */
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
        margin-top: 24px;
    }

    .sticky-summary {
        font-size: 13px;
        color: var(--text-gray);
    }

    .sticky-summary strong { color: var(--text-white); }
    .sticky-summary .price { color: var(--red); font-size: 16px; font-weight: 800; }

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
        cursor: pointer;
        font-family: inherit;
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
<div class="cg-wrap">

    <!-- Breadcrumb -->
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp">Trang chủ</a>
        <span class="sep">›</span>
        <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp">Lịch chiếu</a>
        <span class="sep">›</span>
        <span class="cur">Chọn Ghế</span>
    </div>

    <!-- Steps indicator -->
    <div class="steps-indicator">
        <div class="step-ind done">
            <div class="num">✓</div>
            <span>Chọn phim</span>
        </div>
        <div class="step-line done"></div>
        <div class="step-ind done">
            <div class="num">✓</div>
            <span>Chọn suất</span>
        </div>
        <div class="step-line done"></div>
        <div class="step-ind active">
            <div class="num">3</div>
            <span>Chọn ghế</span>
        </div>
        <div class="step-line"></div>
        <div class="step-ind">
            <div class="num">4</div>
            <span>Thanh toán</span>
        </div>
    </div>

    <!-- 3-col layout -->
    <div class="cg-layout">

        <!-- LEFT: Movie info -->
        <div class="info-panel">
            <div class="panel-head">
                <svg width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3"/>
                    <path d="M7 2v20M17 2v20M2 12h20"/>
                </svg>
                Thông tin suất chiếu
            </div>
            <div class="movie-card-sm">
                <div class="movie-poster-sm">🗡️</div>
                <div class="movie-sm-title">Thanh Gươm Diệt Quỷ</div>

                <div class="info-row">
                    <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
                    </svg>
                    <span><strong>CGV Vincom</strong><br>Phòng 1</span>
                </div>
                <div class="info-row">
                    <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12 6 12 12 16 14"/>
                    </svg>
                    <span><strong>13:30</strong> · Thứ Hai</span>
                </div>
                <div class="info-row">
                    <svg width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <rect x="3" y="4" width="18" height="18" rx="2"/>
                        <line x1="16" y1="2" x2="16" y2="6"/>
                        <line x1="8" y1="2" x2="8" y2="6"/>
                        <line x1="3" y1="10" x2="21" y2="10"/>
                    </svg>
                    <span>14/10/2026</span>
                </div>
                <div class="format-tag">2D · T13</div>
            </div>
        </div>

        <!-- CENTER: Seat grid -->
        <div class="seat-panel">
            <div class="screen-wrap">
                <div class="screen-bar"></div>
                <div class="screen-label">Màn hình</div>
            </div>

            <div class="seat-grid" id="seatGrid">
                <%
                    String[] rows = {"A","B","C","D","E","F","G","H","I","J","K"};
                    int[][] soldMap = {
                        {1,2,19,20},    // A
                        {1,19,20},      // B
                        {},             // C
                        {18,19,20},     // D
                        {},             // E
                        {},             // F — F11, F12 selected
                        {18,19},        // G
                        {},             // H
                        {},             // I
                        {17,18},        // J
                        {1,2,19,20}     // K
                    };
                    int[][] selectedMap = {{6,11},{6,12}}; // row index 5 = F, cols 11,12

                    for (int ri = 0; ri < rows.length; ri++) {
                        String row = rows[ri];
                %>
                <div class="seat-row">
                    <div class="row-lbl"><%= row %></div>
                    <%
                        for (int col = 1; col <= 20; col++) {
                            // gap in middle
                            boolean isGap = (col == 10 || col == 11); // gap after col 10
                            // determine type
                            String seatClass = "normal";
                            String label = String.valueOf(col);

                            // VIP zone rows C-I, cols 6-15
                            if (col >= 6 && col <= 15 && ri >= 2 && ri <= 8) {
                                seatClass = "vip";
                                label = "VIP";
                            }

                            // Sold
                            boolean isSold = false;
                            for (int s : soldMap[ri]) {
                                if (s == col) { isSold = true; break; }
                            }
                            if (isSold) { seatClass = "sold"; label = ""; }

                            // Selected (F11, F12 = ri=5, col=11 or 12)
                            if (ri == 5 && (col == 11 || col == 12)) {
                                seatClass = "selected";
                                label = String.valueOf(col);
                            }
                    %>
                        <% if (col == 11) { %><div class="seat" style="width:10px;visibility:hidden;"></div><% } %>
                        <div class="seat <%= seatClass %>" data-row="<%= row %>" data-col="<%= col %>"><%= label %></div>
                    <% } %>
                </div>
                <% } %>
            </div>
        </div>

        <!-- RIGHT: Summary + Legend -->
        <div class="right-col">

            <!-- Summary -->
            <div class="panel-card">
                <div class="panel-head">
                    <svg width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M9 11l3 3L22 4"/>
                        <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/>
                    </svg>
                    Tóm tắt đơn hàng
                </div>
                <div class="summary-body">
                    <div class="sum-row">
                        <span>Phim</span>
                        <strong>Thanh Gươm Diệt Quỷ</strong>
                    </div>
                    <div class="sum-row">
                        <span>Suất chiếu</span>
                        <strong>13:30 · 14/10</strong>
                    </div>
                    <div class="sum-row">
                        <span>Rạp</span>
                        <strong>CGV Vincom P.1</strong>
                    </div>
                    <div class="sum-divider"></div>
                    <div class="sum-row">
                        <span>Ghế đã chọn</span>
                        <strong id="sum-seats">F11, F12</strong>
                    </div>
                    <div class="sum-row">
                        <span>Số lượng</span>
                        <strong id="sum-count">2 ghế</strong>
                    </div>
                    <div class="sum-row">
                        <span>Đơn giá</span>
                        <strong>90.000đ / ghế</strong>
                    </div>
                    <div class="sum-divider"></div>
                    <div class="sum-total">
                        <span>Tổng cộng</span>
                        <span class="price" id="sum-total">180.000đ</span>
                    </div>
                </div>
            </div>

            <!-- Legend -->
            <div class="panel-card">
                <div class="panel-head">
                    <svg width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <line x1="12" y1="8" x2="12" y2="12"/>
                        <line x1="12" y1="16" x2="12.01" y2="16"/>
                    </svg>
                    Chú thích
                </div>
                <div class="legend-body">
                    <div class="leg-item">
                        <div class="leg-seat" style="background:#d0d0d0;"></div>
                        <span>Ghế thường</span>
                    </div>
                    <div class="leg-item">
                        <div class="leg-seat" style="border:1.5px solid var(--red);color:var(--red);">VIP</div>
                        <span>Ghế VIP</span>
                    </div>
                    <div class="leg-item">
                        <div class="leg-seat" style="background:var(--red);"></div>
                        <span>Đang chọn</span>
                    </div>
                    <div class="leg-item">
                        <div class="leg-seat" style="background:#2a2a2a;"></div>
                        <span>Đã bán</span>
                    </div>
                </div>
            </div>

        </div><!-- /.right-col -->

    </div><!-- /.cg-layout -->

</div><!-- /.cg-wrap -->

<!-- Sticky bottom bar -->
<div class="sticky-bar">
    <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-back-link">
        ← Quay lại
    </a>
    <div class="sticky-summary">
        Ghế: <strong id="bar-seats">F11, F12</strong>
        &nbsp;·&nbsp;
        Tổng: <span class="price" id="bar-total">180.000đ</span>
    </div>
    <div class="sticky-actions">
        <a href="${pageContext.request.contextPath}/user/thanhtoan.jsp" class="btn-continue">
            Thanh toán &nbsp;→
        </a>
    </div>
</div>

</div><!-- /.page-content -->

<script>
    const PRICE_NORMAL = 90000;
    const PRICE_VIP    = 120000;

    let selectedSeats = [
        { row: 'F', col: 11, type: 'vip' },
        { row: 'F', col: 12, type: 'vip' }
    ];

    function fmt(n) {
        return n.toLocaleString('vi-VN') + 'đ';
    }

    function calcTotal() {
        return selectedSeats.reduce((s, seat) =>
            s + (seat.type === 'vip' ? PRICE_VIP : PRICE_NORMAL), 0);
    }

    function updateUI() {
        const labels = selectedSeats.map(s => s.row + s.col).join(', ') || '—';
        const count  = selectedSeats.length;
        const total  = calcTotal();

        document.getElementById('sum-seats').textContent  = labels;
        document.getElementById('sum-count').textContent  = count + ' ghế';
        document.getElementById('sum-total').textContent  = fmt(total);
        document.getElementById('bar-seats').textContent  = labels;
        document.getElementById('bar-total').textContent  = fmt(total);
    }

    // Handle seat clicks — skip sold & legend seats
    document.querySelectorAll('#seatGrid .seat:not(.sold)').forEach(seat => {
        seat.addEventListener('click', function () {
            const row  = this.dataset.row;
            const col  = parseInt(this.dataset.col);
            const type = this.classList.contains('vip') ? 'vip' : 'normal';

            const idx = selectedSeats.findIndex(s => s.row === row && s.col === col);

            if (idx >= 0) {
                // Deselect
                selectedSeats.splice(idx, 1);
                this.classList.remove('selected');
                // Restore type class
                this.classList.add(type);
                if (type === 'vip') this.textContent = 'VIP';
                else this.textContent = col;
            } else {
                // Select
                selectedSeats.push({ row, col, type });
                this.classList.remove('normal', 'vip');
                this.classList.add('selected');
                this.textContent = col;
            }

            updateUI();
        });
    });

    updateUI();
</script>
</body>
</html>

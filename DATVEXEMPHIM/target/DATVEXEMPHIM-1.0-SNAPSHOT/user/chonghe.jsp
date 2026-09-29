<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%  request.setAttribute("currentPage", "lichChieu"); %>
=======
<%
    request.setAttribute("currentPage", "lichChieu");
%>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Chọn Ghế</title>
<<<<<<< HEAD
    <%@ include file="../common/header.jsp" %>
</head>
<body>

<!-- Title bar -->
<div class="page-title-bar">
    <div class="page-main-title">Chọn Ghế</div>
    <div class="page-title-bar-line"></div>
</div>

<div class="cg-container">
    <div class="cg-layout">

        <!-- ── LEFT: Thông tin suất chiếu ── -->
        <div class="cg-panel cg-info">
            <div class="cg-panel-title">Thông Tin Suất Chiếu</div>

            <div class="cg-movie-mini">
                <div class="cg-mini-poster">
                    <img src="https://image.tmdb.org/t/p/w154/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg"
                         alt="Thanh Gươm Diệt Quỷ"
                         style="width:100%;height:100%;object-fit:cover;border-radius:6px;"
                         onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                    <div class="cg-mini-ph" style="background:linear-gradient(145deg,#1a1a2e,#16213e);display:none;">🗡️</div>
                </div>
                <div>
                    <div class="cg-mini-name">Thanh Gươm Diệt Quỷ</div>
                    <div class="cg-mini-rating">⭐ 9.7 / 10</div>
                </div>
            </div>

            <div class="cg-info-rows">
                <div class="cg-info-row">
                    <span class="cg-info-label">Rạp</span>
                    <span class="cg-info-val">CGV Vincom · Phòng 1</span>
                </div>
                <div class="cg-info-row">
                    <span class="cg-info-label">Suất chiếu</span>
                    <span class="cg-info-val">13:30 · Thứ Hai 14/10</span>
                </div>
                <div class="cg-info-row">
                    <span class="cg-info-label">Định dạng</span>
                    <span class="cg-info-val">2D</span>
                </div>
            </div>

            <div class="cg-info-actions">
                <button class="btn-back" onclick="history.back()">← Quay lại</button>
            </div>
        </div>

        <!-- ── CENTER: Sơ đồ ghế ── -->
        <div class="cg-panel cg-seats">

            <div class="cg-screen-wrap">
                <div class="cg-screen">
                    <div class="cg-screen-text">Màn Hình</div>
                </div>
            </div>

            <div class="cg-seat-area" id="seatArea">
                <%
                    /* Cấu hình ghế: A-L × 20 cột
                       VIP: hàng C-G, cột 5-14
                       Đã bán: rải rác  */
                    java.util.Set<String> soldSet = new java.util.HashSet<>(java.util.Arrays.asList(
                        "A2","A14","A19",
                        "B3","B16",
                        "C5","C12",
                        "D8","D9",
                        "E6","E13",
                        "F5","F14",
                        "G7","G10",
                        "H2","H17",
                        "I4","I11","I18",
                        "J3","J15",
                        "K6","K16",
                        "L1","L9","L19"
                    ));
                    java.util.Set<String> vipRows = new java.util.HashSet<>(java.util.Arrays.asList("C","D","E","F","G"));
                    String[] rowArr = {"A","B","C","D","E","F","G","H","I","J","K","L"};
                    int COLS = 20;

                    for (String row : rowArr) {
                        out.print("<div class='cg-row'>");
                        out.print("<span class='cg-row-lbl'>" + row + "</span>");

                        for (int c = 1; c <= COLS; c++) {
                            // khoảng cách giữa cột 10 và 11
                            if (c == 11) out.print("<div class='cg-gap'></div>");

                            String id   = row + c;
                            boolean vip  = vipRows.contains(row) && c >= 5 && c <= 14;
                            boolean sold = soldSet.contains(id);

                            String cls  = "seat " + (sold ? "sold" : (vip ? "vip" : "normal"));
                            String lbl  = sold ? "" : (vip ? "VIP" : String.valueOf(c));
                            String attr = sold ? "disabled" : "onclick=\"toggleSeat('" + id + "'," + vip + ")\"";

                            out.print("<button class='" + cls + "' id='s-" + id + "' " + attr + ">" + lbl + "</button>");
                        }
                        out.println("</div>");
                    }
                %>
            </div>

            <!-- Legend -->
            <div class="cg-legend">
                <div class="cg-legend-title">Chú Thích</div>
                <div class="cg-legend-grid">
                    <div class="cg-legend-item">
                        <div class="legend-seat normal">1</div>
                        <span>Thường</span>
                    </div>
                    <div class="cg-legend-item">
                        <div class="legend-seat vip">VIP</div>
                        <span>VIP</span>
                    </div>
                    <div class="cg-legend-item">
                        <div class="legend-seat selected"></div>
                        <span>Đang chọn</span>
                    </div>
                    <div class="cg-legend-item">
                        <div class="legend-seat sold"></div>
                        <span>Đã bán</span>
                    </div>
                </div>
            </div>

        </div><!-- /cg-seats -->

        <!-- ── RIGHT: Tóm tắt đơn hàng ── -->
        <div class="cg-panel cg-summary">
            <div class="cg-panel-title">Tóm Tắt Đơn Hàng</div>

            <div class="cg-sum-row">
                <span class="cg-sum-label">Ghế đã chọn:</span>
                <span class="cg-sum-val" id="sumSeats">Chưa chọn</span>
            </div>
            <div class="cg-sum-row">
                <span class="cg-sum-label">Số lượng:</span>
                <span class="cg-sum-val" id="sumCount">0 ghế</span>
            </div>

            <div class="cg-sum-divider"></div>

            <div class="cg-sum-total">
                <span class="cg-sum-total-label">Tạm tính</span>
                <span class="cg-sum-total-val" id="sumTotal">0đ</span>
            </div>

            <button class="btn-next" style="width:100%;justify-content:center;margin-top:8px;"
                    onclick="confirmSeats()">
                Tiếp tục →
            </button>
        </div>

    </div><!-- /cg-layout -->
</div><!-- /cg-container -->

<%@ include file="../common/footer.jsp" %>

<script>
    var selected = new Map();
    var PRICE_NORMAL = 90000;
    var PRICE_VIP    = 120000;

    function toggleSeat(id, isVip) {
        var btn = document.getElementById('s-' + id);
        if (selected.has(id)) {
            selected.delete(id);
            btn.classList.remove('selected');
            // restore original type
            btn.classList.add(isVip ? 'vip' : 'normal');
        } else {
            selected.set(id, { vip: isVip, price: isVip ? PRICE_VIP : PRICE_NORMAL });
            btn.classList.remove('vip', 'normal');
            btn.classList.add('selected');
        }
        updateSummary();
    }

    function updateSummary() {
        var keys  = Array.from(selected.keys()).sort();
        var total = Array.from(selected.values()).reduce(function(s,v){ return s + v.price; }, 0);

        document.getElementById('sumSeats').textContent = keys.length ? keys.join(', ') : 'Chưa chọn';
        document.getElementById('sumCount').textContent = keys.length + ' ghế';
        document.getElementById('sumTotal').textContent = keys.length
            ? total.toLocaleString('vi-VN') + 'đ'
            : '0đ';
    }

    function confirmSeats() {
        if (selected.size === 0) {
            alert('Vui lòng chọn ít nhất một ghế!');
            return;
        }
        location.href = '${pageContext.request.contextPath}/user/thanhtoan.jsp';
    }
</script>

=======
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <%@ include file="../common/header.jsp" %>
    <style>
        :root {
            --bg-dark: #0a0a0a;
            --bg-card: rgba(20, 20, 20, 0.8);
            --red: #e50914;
            --dark-red: #b0060f;
            --text-white: #ffffff;
            --text-gray: #aaaaaa;
        }
        /* keep the current booking page CSS and layout; add the incoming font/icon polish */
    </style>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
</body>
</html>

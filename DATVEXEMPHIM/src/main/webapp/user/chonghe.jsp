<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Ghế - CINE+</title>
    <!-- Use Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-red: #e50914;
            --bg-dark: #0a0a0a;
            --panel-bg: rgba(20, 20, 20, 0.75);
            --border-color: rgba(255, 255, 255, 0.1);
            --seat-normal: #e0e0e0;
            --seat-vip: transparent;
            --seat-vip-border: #e50914;
            --seat-selected: #e50914;
            --seat-sold: #333333;
            --text-main: #ffffff;
            --text-muted: #aaaaaa;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background-color: var(--bg-dark);
            background-image: 
                radial-gradient(circle at 15% 50%, rgba(229, 9, 20, 0.15) 0%, transparent 40%),
                radial-gradient(circle at 85% 50%, rgba(229, 9, 20, 0.15) 0%, transparent 40%),
                radial-gradient(circle at 50% 10%, rgba(229, 9, 20, 0.2) 0%, transparent 60%);
            color: var(--text-main);
            min-height: 100vh;
        }

        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: rgba(10, 10, 10, 0.9);
            border-bottom: 1px solid var(--border-color);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 26px;
            font-weight: 900;
            color: var(--primary-red);
            display: flex;
            align-items: center;
            gap: 10px;
            letter-spacing: 1px;
        }

        .logo span {
            font-size: 10px;
            color: #888;
            font-weight: normal;
            display: block;
            margin-top: -5px;
            letter-spacing: 0;
        }

        .nav-links {
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover, .nav-links a.active {
            color: var(--text-main);
            text-shadow: 0 0 10px rgba(255,255,255,0.5);
        }
        
        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .search-bar {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 8px 15px;
            display: flex;
            align-items: center;
            gap: 10px;
            border: 1px solid rgba(255,255,255,0.05);
            transition: all 0.3s;
        }
        
        .search-bar:focus-within {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(255,255,255,0.2);
        }

        .search-bar input {
            background: transparent;
            border: none;
            color: white;
            outline: none;
            font-size: 14px;
            width: 200px;
        }
        .search-bar input::placeholder {
            color: #777;
        }

        /* Main Layout */
        .container {
            max-width: 1350px;
            margin: 0 auto;
            padding: 30px 20px;
        }

        .page-title {
            text-align: center;
            font-size: 36px;
            font-weight: 900;
            font-style: italic;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin: 0 0 40px;
            color: white;
            text-shadow: 0 0 15px rgba(229, 9, 20, 0.6);
        }

        .main-content {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        /* Left Panel - Movie Info */
        .info-panel {
            flex: 1;
            background: var(--panel-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .info-panel h3 {
            margin-top: 0;
            font-size: 18px;
            text-transform: uppercase;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .movie-details {
            display: flex;
            gap: 20px;
        }

        .movie-poster {
            width: 100px;
            height: 150px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 4px 15px rgba(0,0,0,0.6);
        }

        .movie-text {
            font-size: 15px;
            line-height: 1.8;
            color: var(--text-muted);
        }
        .movie-text strong {
            color: var(--text-main);
        }
        .movie-title {
            font-size: 18px;
            font-weight: bold;
            color: var(--text-main);
            display: block;
            margin-bottom: 10px;
        }
        .movie-rating {
            display: inline-block;
            background: #f39c12;
            color: #000;
            font-size: 12px;
            font-weight: bold;
            padding: 2px 6px;
            border-radius: 4px;
            margin-top: 5px;
        }

        /* Center Panel - Seat Selection */
        .seat-panel {
            flex: 2.2;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .screen-container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 50px;
        }

        .screen {
            width: 90%;
            height: 60px;
            background: linear-gradient(to bottom, rgba(255,255,255,0.15) 0%, transparent 100%);
            border-top: 3px solid rgba(255,255,255,0.8);
            border-radius: 50% / 100% 100% 0 0;
            box-shadow: 0 -15px 30px rgba(255, 255, 255, 0.05);
            position: relative;
        }
        
        .screen-text {
            position: absolute;
            top: 20px;
            width: 100%;
            text-align: center;
            color: var(--text-muted);
            letter-spacing: 4px;
            font-size: 14px;
        }

        .seat-grid {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .seat-row {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .row-label {
            width: 25px;
            text-align: right;
            margin-right: 15px;
            font-weight: bold;
            color: var(--text-muted);
            font-size: 14px;
        }

        .seat {
            width: 28px;
            height: 28px;
            border-radius: 6px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s ease;
            user-select: none;
            color: #111;
        }

        .seat.normal {
            background: var(--seat-normal);
        }

        .seat.vip {
            background: var(--seat-vip);
            border: 1.5px solid var(--seat-vip-border);
            color: var(--seat-vip-border);
        }

        .seat.sold {
            background: var(--seat-sold);
            color: transparent;
            cursor: not-allowed;
            position: relative;
        }
        .seat.sold::after {
            content: '\f00d'; /* FontAwesome X */
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            font-size: 14px;
            color: #555;
        }

        .seat.selected {
            background: var(--seat-selected);
            color: white;
            border: none;
            box-shadow: 0 0 12px var(--primary-red);
        }

        .seat:not(.sold):hover {
            transform: scale(1.15);
            box-shadow: 0 0 10px rgba(255,255,255,0.3);
        }
        
        .seat.vip:not(.sold):hover {
            background: rgba(229, 9, 20, 0.2);
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.4);
        }

        /* Right Panel - Summary & Legend */
        .right-panels {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .summary-panel, .legend-panel {
            background: var(--panel-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .summary-panel h3, .legend-panel h3 {
            margin-top: 0;
            font-size: 18px;
            text-transform: uppercase;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 15px;
            color: var(--text-muted);
        }
        
        .summary-row strong {
            color: var(--text-main);
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px dashed rgba(255,255,255,0.2);
            font-size: 18px;
            font-weight: bold;
            color: var(--text-main);
        }
        
        .summary-total span:last-child {
            color: var(--primary-red);
            font-size: 20px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
            font-size: 15px;
            color: var(--text-muted);
        }

        /* Buttons */
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 50px;
            padding: 0 10px;
        }

        .btn {
            padding: 12px 35px;
            border-radius: 30px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.05);
            color: white;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn:hover {
            background: rgba(255,255,255,0.15);
            border-color: rgba(255,255,255,0.5);
        }

        .btn-primary {
            background: var(--primary-red);
            border: none;
            box-shadow: 0 0 15px rgba(229, 9, 20, 0.5);
        }

        .btn-primary:hover {
            background: #ff1e27;
            box-shadow: 0 0 25px rgba(229, 9, 20, 0.8);
            border: none;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="logo">
            <i class="fa-solid fa-film"></i> 
            <div>CINE+<br><span>More Movies, More Feelings</span></div>
        </div>
        <div class="nav-links">
            <a href="#">Trang chủ</a>
            <a href="#">Phim</a>
            <a href="#" class="active">Lịch chiếu</a>
            <a href="#">Rạp</a>
            <a href="#">Ưu đãi</a>
        </div>
        <div class="header-right">
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
                <i class="fa-solid fa-magnifying-glass" style="color: #888;"></i>
            </div>
            <i class="fa-regular fa-user" style="font-size: 20px; cursor: pointer;"></i>
            <i class="fa-solid fa-bars" style="font-size: 20px; cursor: pointer;"></i>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">Chọn Ghế</h1>

        <div class="main-content">
            <!-- Left Panel -->
            <div class="info-panel">
                <h3>Thông tin suất chiếu</h3>
                <div class="movie-details">
                    <img src="https://image.tmdb.org/t/p/w200/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg" alt="Thanh Gươm Diệt Quỷ" class="movie-poster">
                    <div class="movie-text">
                        <span class="movie-title">Thanh Gươm Diệt Quỷ</span>
                        Rạp: <strong>CGV Vincom - Phòng 1</strong><br>
                        Suất chiếu: <strong>13:30 - Thứ Hai 14/10</strong><br>
                        Định dạng: <strong>2D</strong><br>
                        <span class="movie-rating">T13</span>
                    </div>
                </div>
            </div>

            <!-- Center Panel -->
            <div class="seat-panel">
                <div class="screen-container">
                    <div class="screen">
                        <div class="screen-text">MÀN HÌNH</div>
                    </div>
                </div>

                <div class="seat-grid">
                    <% 
                        String[] rows = {"A", "B", "C", "D", "E", "F", "G", "I", "J", "K", "L"};
                        for (String row : rows) {
                    %>
                    <div class="seat-row">
                        <div class="row-label"><%= row %></div>
                        <% 
                            for (int col = 1; col <= 20; col++) {
                                String type = "normal";
                                String text = String.valueOf(col);
                                
                                // Define VIP section
                                if (col >= 6 && col <= 15 && row.compareTo("C") >= 0 && row.compareTo("I") <= 0) {
                                    type = "vip";
                                    text = "VIP";
                                }
                                
                                // Mock selected seats for demonstration
                                if (row.equals("F") && (col == 11 || col == 12)) {
                                    type = "selected";
                                }
                                
                                // Scatter some sold seats matching the mockup feel
                                if (row.equals("B") && (col <= 3 || col >= 16) ||
                                    row.equals("D") && (col >= 17) ||
                                    row.equals("G") && (col == 18 || col == 19) ||
                                    row.equals("J") && (col == 17 || col == 18)) {
                                    type = "sold";
                                    text = "";
                                }
                        %>
                            <div class="seat <%= type %>"><%= text %></div>
                        <% } %>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Right Panel -->
            <div class="right-panels">
                <div class="summary-panel">
                    <h3>Tóm tắt đơn hàng</h3>
                    <div class="summary-row">
                        <span>Ghế:</span>
                        <strong id="selected-seats">F11, F12</strong>
                    </div>
                    <div class="summary-row">
                        <span>Số lượng:</span>
                        <strong id="seat-count">2 ghế</strong>
                    </div>
                    <div class="summary-total">
                        <span>Tạm tính</span>
                        <span id="total-price">4.850.000đ</span>
                    </div>
                </div>

                <div class="legend-panel">
                    <h3>Chú thích</h3>
                    <div class="legend-item">
                        <div class="seat normal" style="margin:0;"></div> Thường
                    </div>
                    <div class="legend-item">
                        <div class="seat vip" style="margin:0; width: 40px;">VIP</div> VIP
                    </div>
                    <div class="legend-item">
                        <div class="seat selected" style="margin:0;"></div> Đang chọn
                    </div>
                    <div class="legend-item">
                        <div class="seat sold" style="margin:0;"></div> Đã bán
                    </div>
                </div>
            </div>
        </div>

        <div class="action-buttons">
            <button class="btn">Quay lại</button>
            <button class="btn btn-primary">Tiếp tục <i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const seats = document.querySelectorAll('.seat:not(.sold):not(.legend-item .seat)');
            
            seats.forEach(seat => {
                seat.addEventListener('click', function() {
                    // Toggle selected state
                    this.classList.toggle('selected');
                    
                    // Note: Real application would update the right panel data here
                    // based on selected seats (price calculation, etc.)
                });
            });
        });
    </script>
</body>
</html>

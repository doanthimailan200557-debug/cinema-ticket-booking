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
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>

    <style>
        body {
            font-family: "Arial", sans-serif;
            font-size: 16px;
            line-height: 1.5;
            color: #333;
            background-color: #f5f5f5;
        }

        h1 {
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        a {
            color: #00bcd4;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>게시글 상세</h1>
    <table>
        <tr>
            <th>번호</th>
            <td>${board.cb_idx}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.cb_title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.cb_nickname}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><fmt:formatDate value="${board.cb_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.cb_cnt}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.cb_content}</td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><c:if test="${not empty board.cb_file}">${board.cb_file}</c:if></td>
        </tr>
    </table>
    <div style="text-align: center;">
        <a href="list.bo">목록으로</a>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    session.invalidate();
    // response.sendRedirect("index.jsp");
%>
<script>alert('로그 아웃'); location.href='../index.jsp';</script>


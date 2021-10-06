<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>My Performance</title>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">

</head>
<body>
<div id="wrap">
    <header>
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <a href="../index.jsp" class="navbar-brand">My Performance</a>
                    <button class="navbar-toggle collapsed" type="button"
                            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="../inbody.jsp">인바디</a></li>
                        <li><a href="../board/board.jsp">게시판</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                계산기 <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="../calculator/bmi.jsp">bmi 계산기</a></li>
                                <li><a href="../calculator/1rm.jsp">1rm 계산기</a></li>
                                <li><a href="../calculator/basal_metabolism.jsp">기초대사량 계산기</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if(session.getAttribute("id") == null){ %>
                        <li><a href="../member/login.jsp"> 로그인 </a></li>
                        <li><a href="../member/register.jsp"> 회원가입 </a></li>
                        <%}else{ %>
                        <li><a href="../member/logout.jsp"> 로그아웃 </a></li>
                        <li><a href="../member/modify.jsp"> 정보수정 </a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
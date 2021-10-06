<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<article>
    <div class="container" id="common_header">
        <h1><a href="login.jsp">Login</a></h1>
        <hr>
    </div>
    <div class="container">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="jumbotron" id="login_jumbo">
                <h2 style="text-align: center">My Performance 로그인</h2>
                <hr>
                <form action="loginService.jsp" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="15">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                </form>
                <hr>
                <label>회원 가입은 <a href="register.jsp">여기</a>에서 할 수 있습니다.</label>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>

<%@ include file="../footer.jsp" %>

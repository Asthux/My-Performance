<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<article>
    <div class="container" id="common_header">
        <h1><a href="modify.jsp">회원 정보 수정</a></h1>
        <hr>
    </div>
    <div class="container">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="jumbotron" id="register_jumbo">
                <h2 style="text-align: center">My Performance 회원수정</h2>
                <hr>
                <form action="modifyService.jsp" method="post">
                    <label>아이디</label>
                    <div class="form-group">
                        <input type="text" class="form-control" value="<%=session.getAttribute("id") %>" name="id" maxlength="15" disabled>
                    </div>
                    <label>비밀번호</label>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
                    </div>
                    <label>비밀번호 확인</label>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호 확인" name="pwConfirm" maxlength="15">
                    </div>
                    <label>이름</label>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" value="<%=session.getAttribute("name") %>" name="name" maxlength="20">
                    </div>
                    <label>이메일</label>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이메일" value="<%=session.getAttribute("email") %>" name="email" maxlength="50">
                    </div>
                    <label>전화번호</label>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="전화번호" value="<%=session.getAttribute("mobile") %>" name="mobile" maxlength="15">
                    </div>
                    <label></label>
                    <input type="submit" class="btn btn-primary form-control" value="회원수정">
                </form>
                <hr>
                <label>회원탈퇴는 <a href="delete.jsp">여기</a>에서 할 수 있습니다</label>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>

<%@ include file="../footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<article>
    <div class="container" id="common_header">
        <h1><a href="delete.jsp">회원 삭제</a></h1>
        <hr>
    </div>
    <div class="container">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="jumbotron" id="login_jumbo">
                <h2 style="text-align: center">My Performance 회원탈퇴</h2>
                <hr>
                <form action="deleteService.jsp" id="form_delete">
                    <label>아이디</label>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="15">
                    </div>
                    <label>비밀번호</label>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="pw" id="pw" maxlength="15">
                    </div>
                    <label>비밀번호 확인</label>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호 확인" name="pwConfirm" id="pwConfirm" maxlength="15">
                    </div>
                    <label></label>
                    <input type="button" class="btn btn-primary form-control" value="탈퇴" onclick="check();">
                </form>
                <hr>
                <label>회원수정은 <a href="modify.jsp">여기</a>에서 할 수 있습니다.</label>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>
<%@ include file="../footer.jsp" %>
<script>
    function check(){
        if(document.getElementById('pw').value == ""){
            alert('패스워드를 입력하세요.');
            return;
        }
        if(document.getElementById('pw').value != document.getElementById('pwConfirm').value){
            alert('두 패스워드를 동일한 값으로 입력하세요.');
            return;
        }
        if(confirm('탈퇴하시겠습니까?'))
            document.getElementById('form_delete').submit();
    }
</script>

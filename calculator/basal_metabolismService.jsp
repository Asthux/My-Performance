<%@ page import="calc_method.Calc_method" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String age = request.getParameter("age");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    String gender = request.getParameter("gender");
    double result = 0;
    Calc_method calc_method = new Calc_method();
    if(weight == "" || age == "" || height == "" || gender == null){
        out.print("<script>alert('나이, 신장, 체중, 성별을 모두 입력하세요'); history.back(); </script>");
        return;
    } else {
        result = calc_method.basal(age,height,weight,gender);
    }
%>
<%@ include file="/header.jsp" %>
<article>
    <div class="container" id="common_header">
        <h1><a href="basal_metabolism.jsp">Basal_Metabolism Calculator</a></h1>
        <hr>
    </div>
    <div class="container">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="jumbotron" id="register_jumbo">
                <label>당신의 기초대사량은</label>
                <br><br>
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" name="weight" maxlength="10" aria-describedby="basic-addon2" value="<%=result%>" disabled>
                        <span class="input-group-addon" id="basic-addon2">kcal</span>
                    </div>
                </div>
                <label></label>
                <a href="basal_metabolism.jsp" class="btn btn-primary form-control">다시 계산하기</a>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>
<%@ include file="/footer.jsp" %>
<%@ page import="calc_method.Calc_method" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String weight = request.getParameter("weight");
    String rep = request.getParameter("rep");
    double result = 0;
    Calc_method calc_method = new Calc_method();

    if(weight == "" || rep == null){
        out.print("<script>alert('중량과 반복횟수를 설정해주세요'); history.back(); </script>");
        return;
    } else {
    result = calc_method.oneRep(weight,rep);
    }
%>
<%@ include file="/header.jsp" %>
<article>
    <div class="container" id="common_header">
        <h1><a href="1rm.jsp">1RM Calculator</a></h1>
        <hr>
    </div>
    <div class="container">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="jumbotron" id="register_jumbo">
                    <label>당신의 1 Rep Max는</label>
                    <br><br>
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" name="weight" maxlength="3" aria-describedby="basic-addon2" value="<%=result%>" disabled>
                            <span class="input-group-addon" id="basic-addon2">KG</span>
                        </div>
                    </div>
                    <label></label>
                <a href="1rm.jsp" class="btn btn-primary form-control">다시 계산하기</a>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>
<%@ include file="/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
                <form action="basal_metabolismService.jsp" method="post">
                    <label>나이</label>
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="나이" name="age" maxlength="3" aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon1">세</span>
                        </div>
                    </div>
                    <label>신장</label>
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="신장" name="height" maxlength="3" aria-describedby="basic-addon2">
                            <span class="input-group-addon" id="basic-addon2">cm</span>
                        </div>
                    </div>
                    <label>체중</label>
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="체중" name="weight" maxlength="3" aria-describedby="basic-addon3">
                            <span class="input-group-addon" id="basic-addon3">kg</span>
                        </div>
                    </div>
                    <label>성별</label>
                    <div class="form-group">
                        <select class="form-select-button form-control" name="gender">
                            <option selected value="man">남</option>
                            <option value="woman">여</option>
                        </select>
                    </div>
                    <label></label>
                    <input type="submit" class="btn btn-primary form-control" value="측정">
                </form>
            </div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</article>
<%@ include file="/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
                <form action="1rmService.jsp" method="post">
                    <label>중량</label>
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="들어올린 최대 중량" name="weight" maxlength="3" aria-describedby="basic-addon2">
                            <span class="input-group-addon" id="basic-addon2">kg</span>
                        </div>
                    </div>
                    <label>최대 반복 횟수</label>
                    <div class="form-group">
                        <select class="form-select-button form-control" name="rep">
                            <option selected>정확도를 위하여 10회 미만으로 측정하세요</option>
                            <option value="2">2개</option>
                            <option value="3">3개</option>
                            <option value="4">4개</option>
                            <option value="5">5개</option>
                            <option value="6">6개</option>
                            <option value="7">7개</option>
                            <option value="8">8개</option>
                            <option value="9">9개</option>
                            <option value="10">10개</option>
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
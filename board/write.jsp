<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/header.jsp" %>
<%
    String id = (String)session.getAttribute("id");
    if(id == null){
        out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='../member/login.jsp'</script>");
        return;
    }
%>
<article>
    <div class="container" id="common_header">
        <h1><a href="board.jsp">Board</a></h1>
        <hr>
    </div>
    <div class="container">
            <form action="writeService.jsp" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Board 글 작성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="100"></td>
                        </tr>
                        <tr>
                            <td><textarea type="text" class="form-control" placeholder="글 내용" name="content" maxlength="500" style="height: 300px"></textarea></td>
                        </tr>
                        <tr>
                            <td>
                                <input class="form-control" type="file" id="formFile" name="uploadFileName">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="pull-right">
                    <input type="submit" class="btn btn-primary" value="글쓰기">
                    <a href="board.jsp" class="btn btn-primary">취소</a>
                </div>

            </form>
    </div>
</article>
<%@ include file="/footer.jsp" %>
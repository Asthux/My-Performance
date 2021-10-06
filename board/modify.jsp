<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	String n = request.getParameter("num");
	if(n == "" || n == null){
		out.print("<script>location.href='board.jsp';</script>");
		return;
	}
	int num = Integer.parseInt(n);
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectNum(num);
	if(dto == null){
		out.print("<script>location.href='board.jsp';</script>");
		return;
	}
	String id = dto.getId();
	String sessionId = (String)session.getAttribute("id");
	if(!sessionId.equals(id)){
		out.print("<script>alert('작성자만 수정 가능합니다.'); location.href='board.jsp';</script>");
		return;
	}
	
	String subject = dto.getSubject();
	String content = dto.getContent();
	String fileName = dto.getFileName();
%>
<article>
	<div class="container" id="common_header">
		<h1><a href="board.jsp">Board</a></h1>
		<hr>
	</div>
	<div class="container">
		<form action="modifyService.jsp?num=<%=num %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<table class="table table-striped">
				<thead>
				<tr>
					<th>Board 글 수정</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="100" value="<%=subject%>"></td>
				</tr>
				<tr>
					<td><textarea type="text" class="form-control" placeholder="글 내용" name="content" maxlength="500" style="height: 300px"><%=content %></textarea></td>
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

<%@ include file="../footer.jsp"%>
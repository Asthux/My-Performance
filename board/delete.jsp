<%@page import="java.io.File"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String n = request.getParameter("num");
	if(n == ""){
		out.print("<script>location.href='board.jsp';</script>");
		return;
	}
	if (n == null){
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
	if(!id.equals(dto.getId())){
		out.print("<script>alert('작성자만 수정 가능합니다.'); location.href='board.jsp';</script>");
		return;
	}
	
	String fileName = dto.getFileName();
	String saveFolder = "/Users/asthu/IdeaProjects/MyPerformance/src/main/resources" + session.getAttribute("id");
	
	File f = new File(saveFolder + "/" + fileName);
	
	if(f.exists()){
		f.delete();
	}

	dao.delete(dto);
%>
<script>alert('게시글 삭제 완료'); location.href='board.jsp';</script>
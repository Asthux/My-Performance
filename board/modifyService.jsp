<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String n = request.getParameter("num");
	if(n == "" || n == null){
		out.print("<script>location.href='board.jsp';</script>");
		return;
	}
	int num = Integer.parseInt(n);

	String saveFolder = "/Users/asthu/IdeaProjects/MyPerformance/src/main/resources/MP" + session.getAttribute("id");
	int maxSize = 1024 * 1024 * 10; // 10MB
	String encType ="utf-8";
 /* 	File f = new File(saveFolder); */
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, saveFolder, maxSize, encType); 
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String fileName = multi.getFilesystemName("uploadFileName");
/* 	
	out.print("게시글 번호 : " + num + "<br>");
	out.print("제목 : " + subject + "<br>");
	out.print("내용 : " + content + "<br>");
	out.print("업로드 후 파일 이름 : " + fileName + "<br>"); */
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectNum(num);
	dto.setSubject(subject);
	dto.setContent(content);
	if(fileName != null)
		dto.setFileName(fileName);
	dao.modify(dto);
%>
<script>alert('게시글 수정 완료'); location.href='board.jsp';</script>


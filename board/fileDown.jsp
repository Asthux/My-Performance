<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	String saveFolder = "/Users/asthu/IdeaProjects/MyPerformance/src/main/resources/MP" + session.getAttribute("id");

	File f = new File(saveFolder + "/" + fileName);
	
	response.setContentType("application/octet-stream");
	//filename="fileName";
	response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
	
	FileInputStream fileInputStream = new FileInputStream(f);
	ServletOutputStream servletOutputStream = response.getOutputStream();
	
	byte b[] = new byte[1024];
	int data = 0;
	while(true){
		data = fileInputStream.read(b, 0, b.length);
		if(data == -1)
			break;
		servletOutputStream.write(b, 0, data);
	}
	servletOutputStream.close(); 
	fileInputStream.close();
	response.sendRedirect("view.jsp");
%>

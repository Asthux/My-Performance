<%@page import="member.MemberCheck"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    // 데이터 유무, 데이터의 형식(아이디, 패스워드, 이름 등) 검증
    MemberCheck mc = new MemberCheck();
    boolean check = mc.emptyCheck(id, pw);
    if(check == true){
        out.print("<script>alert('필수 정보는 입력되어야합니다.'); history.back();</script>");
        return;
    }

    check = mc.idCheck(id);
    if(check == false){
        out.print("<script>alert('아이디는 5~15자리, 소문자, 숫자, (_,-)로 입력하세요.'); history.back();</script>");
        return;
    }

    MemberDAO dao = new MemberDAO();
    MemberDTO checkDTO = dao.selectId(id);
    if(checkDTO != null && checkDTO.getPw().equals(pw)){
        session.setAttribute("id", id);
        session.setAttribute("name", checkDTO.getName());
        session.setAttribute("email", checkDTO.getEmail());
        session.setAttribute("mobile", checkDTO.getMobile());
        out.print("<script>alert('"+ id +"님 환영합니다.');location.href='../index.jsp';</script>");
    }else{
        out.print("<script>alert('아이디/비밀번호를 확인 후 다시 입력하세요.');history.back();</script>");
    }
%>

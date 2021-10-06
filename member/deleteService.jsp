<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String id = (String)session.getAttribute("id");
    if(id == null){
        out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='login.jsp'</script>");
        return;
    }

    request.setCharacterEncoding("utf-8");
    String pw = request.getParameter("pw");
    String confirmPw = request.getParameter("confirmPw");
    MemberCheck mc = new MemberCheck();
    boolean check = mc.emptyCheck(pw, confirmPw);
    if(check == true){
        out.print("<script>alert('탈퇴할 회원정보를 입력하세요.'); history.back();</script>");
        return;
    }

    check = mc.pwEquals(pw, confirmPw);
    if(check == false){
        out.print("<script>alert('두 패스워드는 동일한 값으로 입력하세요.'); history.back();</script>");
        return;
    }
    MemberDAO dao = new MemberDAO();
    MemberDTO checkDTO = dao.selectId(id);
    if(checkDTO != null && checkDTO.getPw().equals(pw)){
        dao.delete(checkDTO);
        session.invalidate();
        out.print("<script>alert('"+ id +" 계정 탈퇴되었습니다.');location.href='../index.jsp';</script>");
    }else{
        out.print("<script>alert('비밀번호를 확인 후 다시 입력하세요.');history.back();</script>");
    }
%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String confirmPw = request.getParameter("pwConfirm");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");

    MemberCheck mc = new MemberCheck();
    boolean check = mc.emptyCheck(id, pw, name);
    if(check == true){
        out.print("<script>alert('아이디, 비밀번호, 이름은 필수로 입력되어야합니다.'); history.back();</script>");
        return;
    }

    check = mc.idCheck(id);
    if(check == false){
        out.print("<script>alert('아이디는 5~15자리, 소문자, 숫자, (_,-)로 입력하세요.'); history.back();</script>");
        return;
    }

    check = mc.pwEquals(pw, confirmPw);
    if(check == false){
        out.print("<script>alert('비밀번호,비밀번호 확인란의 값이 다릅니다.'); history.back();</script>");
        return;
    }

    MemberDAO dao = new MemberDAO();
    MemberDTO checkDTO = dao.selectId(id);
    if(checkDTO != null){
        out.print("<script>alert('중복 아이디로 사용 할 수 없습니다.'); history.back();</script>");
        return;
    }

    MemberDTO dto = new MemberDTO();
    dto.setId(id);
    dto.setPw(pw);
    dto.setName(name);
    dto.setEmail(email);
    dto.setMobile(mobile);
    dao.insert(dto);
%>
<script>alert('회원 가입이 완료되었습니다.'); location.href='../index.jsp';</script>
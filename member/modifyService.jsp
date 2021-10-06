<%@ page import="member.MemberCheck" %>
<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %><%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("id");
    if(id == null){
        out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='login.jsp'</script>");
        return;
    }
    String pw = request.getParameter("pw");
    String confirmPw = request.getParameter("confirmPw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");

    MemberCheck mc = new MemberCheck();
    boolean check = mc.emptyCheck(pw, name);
    if(check == true){
        out.print("<script>alert('필수 정보는 입력되어야합니다.'); history.back();</script>");
        return;
    }

    check = mc.pwEquals(pw, confirmPw);
    if(check == false){
        out.print("<script>alert('두 패스워드는 동일한 값으로 입력하세요.'); history.back();</script>");
        return;
    }

    MemberDTO dto = new MemberDTO();
    dto.setId(id);
    dto.setPw(pw);
    dto.setName(name);
    dto.setEmail(email);
    dto.setMobile(mobile);

    MemberDAO dao = new MemberDAO();
    dao.update(dto);
    session.invalidate();
%>
<script>alert('회원 수정이 완료되었습니다.'); location.href='../index.jsp';</script>
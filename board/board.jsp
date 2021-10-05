<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.BoardList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/header.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String pn = request.getParameter("pageNumber");
    String mode = request.getParameter("mode");
    String find = request.getParameter("find");
    String data = request.getParameter("data");

    BoardDAO dao = new BoardDAO();
    ArrayList<BoardDTO> list = null;

    if(mode != null && mode.equals("search")){
        if(data == "" || data == null){
            out.print("<script>alert('검색어를 입력하세요'); history.back(); </script>");
            return;
        }
        list = dao.search(find, data);
    }else{
        list = dao.selectAll();
    }

    BoardList boardList = new BoardList();
    boardList.setPageNumber(pn);
    boardList.setTotalRecord(list.size());
%>
<article>
    <div class="container" id="common_header">
        <h1><a href="board.jsp">Board</a></h1>
        <hr>
    </div>
    <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(int i = boardList.getStart(); i < (boardList.getScroll() + boardList.getStart()) && i < boardList.getTotalRecord(); i++){
                        BoardDTO dto = list.get(i);
                    %>
                    <tr>
                        <td><%=dto.getNum()%></td>
                        <td class="subject">
                            <a href="view.jsp?num=<%=dto.getNum()%>&pageNumber=<%=boardList.getPageNumber()%>"><%=dto.getSubject().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a>
                        </td>
                        <td><%=dto.getId()%></td>
                        <td><%=dto.getWriteTime() %></td>
                        <td><%=dto.getHit() %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
            <div>
                <div id="page_control" >
                    <%
                        if(boardList.getPageNumber() <= 1){
                            out.print("<a href='#'>Prev </a>");
                        }else{
                            int tmp = boardList.getPageNumber() - 1;
                            out.print("<a href='board.jsp?pageNumber=" + tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "'>Prev </a>");
                        }

                        for(int i = 1; i <= boardList.getTotalPage(); i++){
                            if(boardList.getPageNumber() == i)
                                out.print("<b> " + i + " </b>");
                            else
                                out.print("<a href='board.jsp?pageNumber=" + i + "&mode=" + mode + "&find=" + find + "&data=" + data + "'> " + i + " </a>");
                        }

                        if(boardList.getPageNumber() >= boardList.getTotalPage()){
                            out.print("<a href='#'>Next </a>");
                        }else{
                            int tmp = boardList.getPageNumber() + 1;
                            out.print("<a href='board.jsp?pageNumber=" + tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "'>Next </a>");
                        }
                    %>

                </div>
                <div class="pull-left">
                    <input type="text" class="form-control pull-left">
                    <input type="button" class="btn btn-primary" value="검색">
                </div>

                <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
            </div>
    </div>
</article>
<%@ include file="/footer.jsp" %>
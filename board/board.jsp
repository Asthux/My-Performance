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
                            <a href="view.jsp?num=<%=dto.getNum()%>&pageNumber=<%=boardList.getPageNumber()%>">
                                <%=dto.getSubject()%></a>
                        </td>
                        <td><%=dto.getId()%></td>
                        <td><%=dto.getWriteTime() %></td>
                        <td><%=dto.getHit() %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
    </div>
    <div class="container">
        <form action="board.jsp?mode=search" method="post" >
            <div class="col-md-2">
                <select class="form-control" name="find">
                    <option selected>선택</option>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="id">작성자</option>
                </select>
            </div>
            <div class="col-md-3">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." name="data">
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Search</button>
                </span>
                </div>
            </div>
        </form>

        <div class="pull-right">
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </div>
    </div>
        <nav id="page_control">
            <div class="container" style="text-align: center">
            <ul class="pagination">
                <%
                    if(boardList.getPageNumber() <= 1){
                        out.print(" <li class=\"disabled\"><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");
                    }else{
                        int tmp = boardList.getPageNumber() - 1;
                        out.print("<li><a href='board.jsp?pageNumber="+ tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span></a></li>");
                    }

                    for(int i = 1; i <= boardList.getTotalPage(); i++){
                        if(boardList.getPageNumber() == i)
                            out.print("<li class='active'><a href='#'>"+i+"<span class=\"sr-only\">(current)</span></a></li>");
                        else
                            out.print("<li><a href='board.jsp?pageNumber=" + i + "&mode=" + mode + "&find=" + find + "&data=" + data + "'> "+i+"<span class=\"sr-only\">(current)</span></a></li>");
                    }

                    if(boardList.getPageNumber() >= boardList.getTotalPage()){
                        out.print("<li class=\"disabled\"><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");
                    }else{
                        int tmp = boardList.getPageNumber() + 1;
                        out.print("<li><a href='board.jsp?pageNumber=" + tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "' aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");
                    }
                %>
            </ul>
            </div>
        </nav>
</article>
<%@ include file="/footer.jsp" %>
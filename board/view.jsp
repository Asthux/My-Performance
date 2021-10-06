<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/header.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
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
    String sessionId = (String)session.getAttribute("id");
    String id = dto.getId();
    String subject = dto.getSubject();
    String content = dto.getContent();
    String writeTime = dto.getWriteTime();
    String fileName = dto.getFileName();
    int hit = dto.getHit() + 1;

    dto.setHit(hit);
    dao.modify(dto);
    if(fileName == null)
        fileName = "";

    String pageNumber = request.getParameter("pageNumber");
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
                    <th colspan="3">Board 글 보기</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 20%;">글 제목</td>
                    <td colspan="2"><%=subject%></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td colspan="2"><%=id %></td>
                </tr>
                <tr>
                    <td>작성일자</td>
                    <td colspan="2"><%=writeTime %></td>
                </tr>
                <tr>
                    <td>조회수</td>
                    <td colspan="2"><%=hit %></td>
                </tr>
                <tr>
                    <td>첨부 파일</td>
                    <td colspan="2"><a href="fileDown.jsp?fileName=<%=fileName%>"><%=fileName %></a></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="2" style="height: 300px; text-align: left"><%=content%></td>
                </tr>
            </tbody>
        </table>
        <% if(!(session.getAttribute("id") == null)){ %>
            <a href="modify.jsp?num=<%=num%>" class="btn btn-primary">수정</a>
            <a href="delete.jsp?num=<%=num%>" class="btn btn-primary">삭제</a>
        <%}%>
        <a href="board.jsp?pageNumber=<%=pageNumber%>" class="btn btn-primary pull-right">목록</a>
        <div id="disqus_thread"></div>
        <script>
            /**
             *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
             *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
            /*
            var disqus_config = function () {
            this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
            this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
            };
            */
            (function() { // DON'T EDIT BELOW THIS LINE
                var d = document, s = d.createElement('script');
                s.src = 'https://my-performance.disqus.com/embed.js';
                s.setAttribute('data-timestamp', +new Date());
                (d.head || d.body).appendChild(s);
            })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>
</article>
<%@ include file="/footer.jsp" %>
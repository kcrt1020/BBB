<%@page import="com.bbb.member.MemberDAO"%>
<%@page import="com.bbb.member.MemberBean"%>
<%@page import="com.bbb.board.BoardBean"%>
<%@page import="com.bbb.board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<html lang="en">
	<%
	// 화면 상단에 위치하는 메뉴 처리 (모든 페이지에 공유)
	
	// 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	String id= (String)session.getAttribute("id");
	
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	// id에 해당하는 회원정보 가져오기 getMember(id)
		MemberDAO mdao = new MemberDAO();
		// id에 해당하는 회원정보 가져오기 getMember(id)
		MemberBean mb=mdao.getMember(id);
	// 테이블에 저장된 글의 개수 계산 메서드
	// getBoardCount()
	int count = bdao.getBoardCount();		
	%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>빵빵브레드</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="../fonts/stylesheet.css" rel="stylesheet">
    <link href="../css/reset.css" rel="stylesheet">
    <link href="../css/slick.css" rel="stylesheet">
    <link href="../css/jquery.mb.YTPlayer.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/meanmenu.css">
    <link href="../css/owl.carousel.css" rel="stylesheet">
    <link href="../style.css" rel="stylesheet">
    <link href="../css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body class="js">


 <!-- top -->
 
  <div id="preloader"></div>

    <section class="about-us">
        <div class="logo_menu" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-6">
                        <div class="logo">
                            <a href="../index.jsp"><img src="../img/logo.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
                        <nav class="navbar">
                            <ul class="nav navbar-nav navbar-right menu">
                                 <li><a href="../about/about.jsp">BBB</a></li>
                                 <li class="current-menu-item"><a href="../about/notice.jsp">NOTICE</a></li>
                                    <li><a href="../products/products.jsp">PRODUCTS</a></li>
                                    <li><a href="../store/store.jsp">STORE</a></li>
                                    <li><a href="../contact/contact.jsp">CONTACT</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-4 col-lg-3 signup">
                        <ul class="nav navbar-nav">
                              <%
							if(id==null){ %>	
                            <li><a href="../member/loginForm.jsp">login</a></li>
                            <li><a href="../member/joinForm.jsp">sign up</a></li>
                            <%} else{%>
							 <li><a href="../member/memberInfo.jsp"><%=mb.getName() %>님 </a> </li>
							 <li><a href="../member/logout.jsp">로그아웃</a></li>
								<%
									} %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

 <section class="about_us_area" id="about">
    <div class="container">
            <div class="row page-title">
                <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                    <div class="about_us_content_title">
                        <h2>Notice</h2>
                        <h5>공지사항 [글 : <%=count %>개]</h5>
                    </div>
                </div>
              </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="about_us_content">
 						
 <%
	
		
		
		// 페이징 처리 *******************************************************

		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 5;
		// 현 페이지의 페이지값을 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){	// 페이지 정보가 없을 경우 항상 1페이지
			pageNum="1";
			
		}
		
		// 시작 행번호 계산 1...10 / 11...20 / 21...30 / 31...40
		int currentPage =Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝 행번호 계산
		int endRow = currentPage * pageSize;
		
		// 페이징 처리 *******************************************************
		
		
		
		
		ArrayList boardList=null;
		// 글이 있을 경우 모든 글의 정보를 가져오는 메서드
		if(count != 0){
			boardList=bdao.getBoardList(startRow,pageSize);
		}
	
	%>

     
                    

<!-- 게시판 -->



<table id="notice" width="900px" style="text-align:left;">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    
    <% for(int i=0;i<boardList.size();i++){
    	BoardBean bb = (BoardBean)boardList.get(i);
    	%>
    <tr>
    <td><%=bb.getBno() %></td>
    <td class="left">
    <%
	// 답글 들여쓰기 처리
	int wid=0;
	// 답글일 때 
		if(bb.getRe_lev()>0){	
			wid=10*bb.getRe_lev();
	%>
	<img src="level.gif" width="<%=wid%> height="15">
	→
	<%
		}
	%>
    <a href="content.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
    <td><%=bb.getName() %></td>
    <td><%=bb.getDate() %></td>
    <td><%=bb.getReadcount() %></td>
    </tr>
	<%} %>
	
</table>

<%
	// 다른 페이지 이동 버튼
	if(count != 0){
		// 전체 페이지수 - 글 50 / 화면10씩 출력 =>5페이지
		//			- 글 56 / 화면10씩 출력 => 6페이지
		
		int pageCount = count/pageSize+(count % pageSize == 0? 0:1);
		
		// 한 화면에 보여줄 페이지 번호 개수
		int pageBlock = 2;
		
		// 페이지 블럭의 시작페이지번호 1...10/11...20/21...30/31...40
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage+pageBlock-1;
		if(endPage>pageCount){
			endPage=pageCount;
		}
		
		
		// 이전
		if(startPage>pageBlock){
			%>
			<A href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</A>
			<%
		}
		// 숫자 (1...10/11...20/...)
		for(int i=startPage;i<=endPage;i++){
			%>
			<a href="notice.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			<%
		}
		// 다음
		if(endPage<pageCount){
			%>
			<A href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</A>
			<%
		}
	}
	%>
	
	
	

		<%
	//if(id != null){
		if(id!=null && id.equals("admin")){ // 앞에 있는 것부터 실행됨
		%>
		
<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.jsp'">

		<%
}
%>

</div>
<div class="clear"></div>

                    </div>
                </div>
               
            </div>
        </div>
    </section>

 
    <!--   end of slider area-->
  
      <!--   end of slider area-->
    <section class="footer-area" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-sm-3 col-xs-12 col-lg-4">
                    <div class="single-footer">
                        <h2>빵빵브레드</h2>
                         <p>SINCE 2020</p>
                        ENJOY THE BBANGBBANG BREAD
                       
                    </div>
                </div>
                <div class="col-md-10 col-sm-5 col-xs-12 col-lg-4">
                
                
                
                    <div class="single-footer">
                        <h2>More links</h2>
                        <ul class="list">
                            <li><a href="../about/about.jsp">BBB</a></li>
                            <li><a href="../about/notice.jsp">NOTICE</a></li>
                            <li><a href="../products/products.jsp">PRODUCTS</a></li>
                            <li><a href="../store/store.jsp">STORE</a></li>
                            <li><a href="../contact/contact.jsp">CONTACT</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
                   
                    <div class="single-footer clearfix">
                        <h2>Contact Us</h2>
                        고객센터<br>000-000-0000<br>평일 09:00-18:00 <br>(점심 12:00-13:00)
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--end of footer area-->

    <!--   start copyright text area-->
     <div class="copyright-area">
        <div class="container">
            <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                <div class="footer-text">
                    <p>Copyright 2020, All Rights Reserved</p>
                </div>
            </div>
            <div class="col-xs-12  col-sm-6 col-md-6 text-right">
                <div class="footer-text">
                    <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
                    <a href="https://twitter.com/" class="fa fa-twitter"></a>
                    <a href="https://www.linkedin.com/" class="fa fa-linkedin"></a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script src="../js/jquery.counterup.min.js"></script>
    <script src="../js/jquery.sticky.js"></script>
    <script src="../js/jquery.meanmenu.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/jquery.mb.YTPlayer.min.js"></script>
    <script src="../js/main.js"></script>
</body>

</html>
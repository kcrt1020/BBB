<%@page import="com.bbb.products.productsBean"%>
<%@page import="com.bbb.products.productsDAO"%>
<%@page import="com.bbb.member.MemberBean"%>
<%@page import="com.bbb.member.MemberDAO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.bbb.board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.bbb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
	<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	String id= (String)session.getAttribute("id");
	String name= (String)session.getAttribute("name");
	
	// BoardDAO 객체 생성
	productsDAO pdao = new productsDAO();
	
	// 글의 조회수 정보를 1 증가 (updateReadCount(bno))
	pdao.updateReadCount(bno);
	
	// 글 정보를 가져오는 메서드 생성 (getBoard(bno))
	//bdao.getBoard(bno);
	productsBean pb = pdao.getBoard(bno);
	MemberDAO mdao = new MemberDAO();

	// id에 해당하는 회원정보 가져오기 getMember(id)
	MemberBean mb=mdao.getMember(id);

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
                                 <li><a href="../about/notice.jsp">NOTICE</a></li>
                                     <li class="current-menu-item"><a href="../products/products.jsp">PRODUCTS</a></li>
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
                        <h2>Products</h2>
                        <h5>제품소개 </h5>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                    <div class="about_us_content_title">
                      
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-3">
                    <div class="about_us_content">
                      <nav id="sub_menu">

<!-- 게시판 -->
 
 


	  <section class="join-page-area">
	<table  width="800px">
	<tr>
	
	<tr>
	<td><h1><%=pb.getSubject() %></h1></td>
	</tr>
	
	<tr>
	<td><img src="upfile\<%=pb.getFile()%>"></td>
	</tr>
	
	<tr>
	<td><h2><%=pb.getContent() %></h2></td>
	</tr>
	
	<tr>
	<td colspan="4">
	
	<br><br><br><br><br>

	<!--  로그인 정보가 없거나, 글쓴이 이름과 아이디가 다를 경우 수정하기, 삭제하기 버튼을 숨김
			로그인한 아이디의 정보가 글쓴이 이름과 같다면 수정하기, 삭제하기를 보여주기
	 -->
	 <%
	 if(id != null && id.equals(pb.getName())){	
		 // 아이디 있으면서, 이름이랑 아이디 같은 경우	 
	 %> 
	 
	<input type="button" value="수정하기"
	onclick="location.href='updateForm.jsp?bno=<%=pb.getBno()%>&pageNum=<%=pageNum%>'">
	<input type="button" value="삭제하기"
	onclick="location.href='deleteForm.jsp?bno=<%=pb.getBno()%>&pageNum=<%=pageNum%>'">
	
	 <% 
	 } else if (id == null || !id.equals(pb.getName()));
	 %>
	 
	<input type="button" value="목록으로" onclick="location.href='products.jsp?pageNum=<%=pageNum%>'">
	</td>
	</tr>
	
	</table>


                    </div>
                </div>
               
            </div>
        </div>
    </section>
	</section>
 
  
    <!--start footer area-->
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
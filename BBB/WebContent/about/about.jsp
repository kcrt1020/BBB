<%@page import="com.bbb.member.MemberBean"%>
<%@page import="com.bbb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
	<%
	// 화면 상단에 위치하는 메뉴 처리 (모든 페이지에 공유)
	
	// 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	String id= (String)session.getAttribute("id");

	
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
                                 <li class="current-menu-item"><a href="../about/about.jsp">BBB</a></li>
                                  <li><a href="../about/notice.jsp">NOTICE</a></li>
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
							 <li><a><%=mb.getName() %>님 </a> </li>
							 <li><a href="../member/logout.jsp">로그아웃</a></li>
								<%
									} %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
 <!-- top -->

    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row page-title">
                <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                    <div class="about_us_content_title">
                        <h2>about us</h2>
                        <h5>브랜드 소개</h5>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                  
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="about_us_content">
                      
                        <h3>빵빵브레드</h3><br>
                        <p>빵빵브레드는 엄선한 재료로 매일매일 매장에서 직접 굽는 신선한 빵을 제공합니다.
                       	  오븐에서 방금 꺼낸 빵이 가장 맛있다는 것을 알기에, 빵빵브레드는 지금도 더욱 따뜻하고 촉촉한 갓 구운 빵을 제공하기 위해 끊임없이 노력합니다.</p>
                       	  <br><br>
                       	  <h3>편안한 공간</h3><br>
                       	 <p>빵빵브레드는 바쁜 일상 속에서 휴식과 여유를 느낄 수 있는 공간입니다.
							누구나 부담없이 편하게 즐길 수 있는 가격과
							안락한 인테리어로 지친 일상 속에서 남녀노소 모두 휴식을 취할 수 있는 베이커리입니다.</p>
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6 col-md-5">
                    <div class="about_car">
                        <img src="../img/about_car.png" alt="car">
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--start about bottom area-->
    <section class="about-us-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">
                    <div class="single-about-us-bottom">
                        <h4>소비자신뢰</h4>
                        <p>소비자 건강과 행복을 최우선으로 고려<br>소비자와 적극소통<br>지속적인 제품개발</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">
                    <div class="single-about-us-bottom">
                        <h4>정직한 경영</h4>
                        <p>직원간 충분한 의사소통<br>윤리적 책임경영<br>정직한 제품생산</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 col-lg-4">
                    <div class="single-about-us-bottom">
                        <h4>사랑의 기업</h4>
                        <p>행복한 사회를 위한 봉사활동<br>사회적 책임기업<br>나눔정신 실현</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--    start client say area-->

    <section class="client-area" id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-sm-8">
                    <div class="slients-title">
                        <h2>Since 2020 빵빵브레드</h2>
                        <p>고객과 소통하는 고객중심 경영이념을 바탕으로<br>
							고객의 건강과 행복을 회사의 최고 보람으로 여기며,<br>
							정직하고 신뢰 받는 빵빵브레드가 되도록 노력하겠습니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-clients">
                        <div class="client-img">
                            <img src="../img/client.jpg" alt="client">
                        </div>
                        <div class="client-details">
                        
                            <h4>Gong<span>Chief executive officer</span></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-clients">
                        <div class="client-img">
                            <img src="../img/client-2.jpg" alt="client">
                        </div>
                        <div class="client-details">
                           
                            <h4>Bae<span>Excutive Manger</span></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--start footer area-->

   

    <div class="copyright-area">
        <div class="container">
            <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                <div class="footer-text">
                    <p>Copyright 2020, All Rights Reserved</p>
                </div>
            </div>
            <div class="col-xs-12  col-sm-6 col-md-6 text-right">
                <div class="footer-text">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-linkedin"></a>
                    <a href="#" class="fa fa-google-plus"></a>
                    <a href="#" class="fa fa-dribbble"></a>
                </div>
            </div>
        </div>
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="../js/jquery.counterup.min.js"></script>
    <script src="../js/jquery.sticky.js"></script>
    <script src="../js/jquery.meanmenu.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/jquery.nav.js"></script>
    <script src="../js/jquery.mb.YTPlayer.min.js"></script>
    <script src="../js/main.js"></script>
</body>

</html>
<%@page import="com.bbb.member.MemberDAO"%>
<%@page import="com.bbb.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
	<%
	
	request.setCharacterEncoding("utf-8");
	// 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	String id= (String)session.getAttribute("id");
	// memberDAO 객체 생성
			MemberDAO mdao = new MemberDAO();

		// id에 해당하는 회원정보 가져오기 getMember(id)
		MemberBean mb=mdao.getMember(id);
	%>
	
	
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>빵빵브레드</title>
    <!--  bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!--  font Awesome Css  -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <!--    stylesheet for fonts-->
    <link href="../fonts/stylesheet.css" rel="stylesheet">
    <!-- Reset css-->
    <link href="../css/reset.css" rel="stylesheet">

    <!--slick css-->
    <link href="../css/slick.css" rel="stylesheet">
    <!--  owl-carousel css -->
    <link href="../css/owl.carousel.css" rel="stylesheet">
    <!--  YTPlayer css For Background Video -->
    <link href="../css/jquery.mb.YTPlayer.min.css" rel="stylesheet">
    <!--  style css  -->
    <link rel="stylesheet" href="../css/meanmenu.css">
    <link href="../style.css" rel="stylesheet">
    <!--  Responsive Css  -->
    <link href="../css/responsive.css" rel="stylesheet">

    <!--  browser campatibel css files-->
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="js">
    <!--start header area-->
   
 <div id="preloader"></div>
    <section class="header_area" id="home" >
        <!--   start logo & menu markup    -->
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
                            <!-- Collect the nav links, forms, and other content for toggling -->
                                <ul class="nav navbar-nav navbar-right menu">
                                    <li><a href="../about/about.jsp">BBB</a></li>
                                    <li><a href="../about/notice.jsp">NOTICE</a></li>
                                    <li><a href="../products/products.jsp">PRODUCTS</a></li>
                                    <li><a href="../store/store.jsp">STORE</a></li>
                                    <li><a href="../contact/contact.jsp">CONTACT</a></li>
                                </ul>
                            <!-- /.navbar-collapse -->
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
   
        <!--   end of logo menu markup     -->
        <!--  start welcome text marup  -->
       
        <div class="table">
            <div class="cell">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="welcome_text">
                                <h1>ENJOY THE </h1>
                   	  			<h1>BBANGBBANG BREAD </h1>
                                <div class="welcome_p">                       
                                    <p>빵빵브레드에서 갓구운 빵을 만나보세요!</p>
                                </div>
                                <div class="welcome_form">
                                    <form action="../products/products.jsp">
                                        <input class="form-control" type="text" placeholder="제품을 입력하세요.">
                                        <input class="submit" type="submit" value="검색">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of welcome text markup-->
    </section>
    <!--end of header area-->

    <!--   start about top area-->
  

    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="about_us_content">
                        <h2>ABOUT US</h2><br><br>
                        
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
    <!--   end of about us area-->
<hr>
    <!--start count up area-->
   <section class="contact-page-area">
        <div class="container">
          
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                    <div class="about_us_content_title">
                  <h2>Store</h2><br><br>
                 
            <div id="map" style="width:1000px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5426256a74ed299a68cf52992394bb00"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.1585847,129.0620088), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '서면 1호점', 
        latlng: new kakao.maps.LatLng(35.1585847,129.0620088)
    }
   
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>


<br><p> <b>서면 1호점</b>    부산 부산진구 동천로 109 삼한골든게이트 7층 (부전동)  |  051-111-1111</p>
               
                </div>
            </div>
        </div>
    </section>

    <!--    end of counter up area-->


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
    <!--    end of client area-->

    



    <!--   end of slider area-->
 

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
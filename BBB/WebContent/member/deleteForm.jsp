<%@page import="com.bbb.member.MemberBean"%>
<%@page import="com.bbb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	// jSP6/updateForm.jsp 참고해서 페이지 생성
	// DB 처리를 DAO 객체로 전달해서 처리
	
	// 로그인 세션처리
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("id");
	String name= (String)session.getAttribute("name");
	if(id==null){
		response.sendRedirect("../main/main.jsp");
	}
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
                                    <li><a href="../products/products.jsp">PRODUCTS</a></li>
                                    <li><a href="../store/store.jsp">STORE</a></li>
                                    <li><a href="../delivery/delivery.jsp">DELIVERY</a></li>
                                 <li> <a href="../contact/contact.jsp">CONTACT</a></li>
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
							 <li><a href="../member/memberInfo.jsp"><%=name %>님 </a> </li>
							 <li><a href="../member/logout.jsp">로그아웃</a></li>
								<%
									} %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
       <section class="join-page-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                    <div class="about_us_content_title">
                        <h2>SIGN UP</h2>
                        <h5>정보수정</h5>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                 
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="join-form">
                      
    
    
    
	<fieldset>
	<legend>회원 정보 탈퇴하기</legend>
	<form action="deletePro.jsp" method="post">
	<!-- hidden 타입 : 화면에 해당 input 태그를 숨겨서 정보를 전달-->
	아이디 <input type="text" name="id" value="<%=id %>" readonly="readonly"><br>
	비밀번호 <input type="password" name="pw"><br>
	<input type="submit" value="탈퇴하기">
	</form>
	
	</fieldset>
	
	     </div>
                </div>
              
                </div>
            </div>
        </div>
    </section>
	
	<%
	
	
	%>
	<script type="text/javascript">
	/* 사용자가 회원 가입시 */
	// 데이터 빈공백 체크
	// 가입조건 만족 (ex.. 아이디가 최소 5자리 이상, 영문자/숫자 사용)
	// 추가 정보는 입력을 안해도 됨
	
	function check(){
		// alert("테스트");
		// 아이디가 입력이 안돼있을 경우 "아이디를 입력하시오!"
		
		if(document.fr.id.value.length <= 0){
			alert("아이디를 입력하시오!");
			document.fr.id.focus();
			return false;
		}	
	}

	function winopen(){
		// id를 입력하는 텍스트 상자에 값이 비어있는지 없는지 판단
		// 값이 비어있을 경우 "ID를 입력하시오", focus(), 진행 X
		// 값이 있을 경우 진행 O
		if(document.fr.id.value.length<=0){
			alert("ID를 입력하시오.");
			document.fr.id.focus();
			return; // function 종료
		}
			
		// 새창을 열어서 페이지 오픈 => 회원 아이디 정보 중복체크
		// 페이지 이동 시 입력한 ID값 가지고 이동
		var id=document.fr.id.value;
		window.open("joinIdCheck.jsp?userid="+id,"","width=400,height=200");
		}
	

	</script>


    <!--start footer area-->
    <section class="footer-area" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-3 col-xs-12 col-lg-4">
                    <div class="single-footer">
                        <h2>about us</h2>
                        <p>ABOUT US Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
                <div class="col-md-2 col-sm-3 col-xs-12 col-lg-2">
                    <div class="single-footer">
                        <h2>More links</h2>
                        <ul class="list">
                            <li><a href="#">about us.</a></li>
                            <li><a href="#">We Accepts.</a></li>
                            <li><a href="#">news latters</a></li>
                            <li><a href="#">Pricing & plans</a></li>
                            <li><a href="#">Calculate</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
                    <div class="single-footer">
                        <h2>We Accepts</h2>
                        <a href="#"><img src="../img/cards_credt_1.png" alt="#"></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
                    <div class="single-footer clearfix">
                        <h2>news latters</h2>
                        <input type="text" class="form-control">
                        <input type="submit" class="submt-button" value="submit">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="copyright-area">
        <div class="container">
            <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                <div class="footer-text">
                    <p>Copyright 2016, All Rights Reserved</p>
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
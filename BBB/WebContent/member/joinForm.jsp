<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

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
                            <li><a href="../member/loginForm.jsp">login</a></li>
                            <li><a href="../member/joinForm.jsp">sign up</a></li>
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
                        <h5>회원가입</h5>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                 
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="join-form">
                      
    
    
    
	<form action="joinPro.jsp" method="post" name="fr" onsubmit="return check()">
	<fieldset>
	<legend>필수정보</legend>
	<label>*아이디</label> <br>
	<input type="text" name="id" placeholder="6자리 이상 입력해주세요."><input type="button" name="idcheck" value="아이디확인"  onclick="winopen()"><br>
	<label>*비밀번호</label> <br>
	<input type="password" name="pw" placeholder="6자리 이상 입력해주세요."><br>
	<label>*비밀번호 확인</label> <br>
	<input type="password" name="pw2" placeholder="비밀번호를 똑같이 입력해주세요."><br>
	<label>*이름</label> <br>
	<input type="text" name="name" placeholder=""><br>
	<label>*생년월일</label> <br>
	<input type="text" name="birth" placeholder="6자리로 입력해주세요."><br>
	<label>*이메일</label> <br>
	<input type="text" name="email"><br>
	<label>*성별</label> <br>
	<input type="radio" name="gender" value="여자" style="height: 20px">여자
	<input type="radio" name="gender" value="남자" style="height: 20px">남자<br>
	</fieldset>
	
	<br><br><br>
	
	<fieldset>
<legend>추가 정보</legend>
<label>주소</label>
<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name="addr2" id="sample6_address" placeholder="주소"><br>
<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<label>전화번호</label>
<input type="text" name="phone"><br>
<label>휴대폰번호</label>

<input type="text" name="mobile"><br>
</fieldset>
<div id="buttons">
	<input type="submit" name="submit" value="가입하기">
	<input type="reset" value="Cancel" class="cancel">
	</div>
	</form>
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
		
		if(document.fr.id.value.length <5){
			alert("아이디를 5자리 이상 입력하세요!");
			document.fr.id.focus();
			return false;
		}	
		
		if(document.fr.pw.value.length <=0){
			alert("비밀번호를 입력하세요!");
			document.fr.pw.focus();
			return false;
		}
		
		if(document.fr.pw2.value != document.fr.pw1.value){
			alert("비밀번호가 일치하지 않습니다!");
			document.fr.pw2.focus();
			return false;
		}
		
		if(document.fr.name.value.length <=0){
			alert("이름을 입력하세요!");
			document.fr.name.focus();
			return false;
		}
		
		if(document.fr.birth.value.length <=0){
			alert("생년월일을 입력하세요!");
			document.fr.birth.focus();
			return false;
		}
		
		if(document.fr.email.value.length <=0){
			alert("이메일을 입력하세요!");
			document.fr.email.focus();
			return false;
		}
		
		if(document.fr.gender.value ){
			alert("성별을 체크하세요!");
			document.fr.email.focus();
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
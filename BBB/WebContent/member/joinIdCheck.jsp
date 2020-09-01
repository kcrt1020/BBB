<%@page import="com.bbb.member.MemberDAO"%>
<%@page import="com.bbb.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>아이디 확인</h1>

	<%
	// 프로젝트의 시작페이지
//	response.sendRedirect("../main/main.jsp");
	// 중복체크 검사하기 위해서 받아온 ID값 출력
	String id=request.getParameter("userid");
	%>
<%-- 	전달 받은 값 : <%=id %> --%>
	<%
	
	MemberDAO mdao = new MemberDAO();
	
	// 중복아이디 체크하는 메서드 joinIdCheck(ID);
	int check = mdao.joinIdCheck(id);
	
	if(check==1){
		out.print("사용가능한 아이디입니다.");
		// "아이디 선택" 버튼 추가
		%>
		<input type="button" value="아이디 사용하기" onclick="return result();">
		<%
	}else if(check==0){
		out.print("사용 불가능한 아이디입니다.(중복)");
	}else{
		out.print("에러 발생!!!(-1)");
	}
	
	%>
	
	
	<fieldset>
	<form action="joinIdCheck.jsp" method="post" name="wfr">
	ID : <input type="text" name="userid" value="<%=id%>">
	<input type="submit" value="중복 확인" onclick="return check();">
	</form>
	
	</fieldset>
	
	
	
	<script type="text/javascript">
	
	function check(){
		if(document.wfr.userid.value.length<5){
			alert("아이디를 5자리 이상 입력하세요!");
			document.wfr.userid.focus();
			return false;
		}
	}
	
	function result(){
		// 중복확인창에서 회원가입 페이지로 정보 전달
		// 새창에 있는 아이디 정보 -> 회원가입창에 아이디 정보 전달
	// alert("새창 : "+document.wfr.userid.value);
	// alert("회원가입창 : "+opener.fr.id.value);
	
	opener.fr.id.value = document.wfr.userid.value; // 새창 = 회원가입창
	
	// 회원가입창 제어
	// opener.document.fr.id.disabled="disabled";
	 opener.document.fr.id.readOnly=true;
	// 창 닫기
	window.close();
	
	}
	</script>
</body>
</html>
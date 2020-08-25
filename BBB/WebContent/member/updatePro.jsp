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

	<h1>member/updatePro.jsp</h1>

	<%
	// 로그인 상태 체크
	
	String id = (String) session.getAttribute("id");
	if (id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	// 한글처리
	request.setCharacterEncoding("utf-8");

	// 전달된 파라미터값 저장 -> 액션태그 사용 자바빈 객체
	%>
	<jsp:useBean id="mb" class="com.bbb.member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>

	<% 
	// MemberDAO 객체 생성 -> 정보수정 메서드 호출updateMember(수정할 객체정보)
	MemberDAO mdao= new MemberDAO();
	int result = mdao.updateMember(mb);
	
	// 처리결과 리턴 ((1)-수정완료, (0)-비밀번호 오류, (-1)-아이디 없음)
	
	// 처리결과에 따른 페이지 이동
	if(result == 1){
	%>
	<script type="text/javascript">
	alert("수정완료");
	location.href="../main/main.jsp";
	
	</script>
	<% 	
	}else if (result==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
		
		</script>
		<% 	
		
	}else { // -1
	
	%>
	<script type="text/javascript">
	alert("아이디 없음");
	history.back();
	
	</script>
	<% 	} %>
	
	
</body>
</html>
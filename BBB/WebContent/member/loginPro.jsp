<%@page import="com.bbb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빵빵브레드</title>
</head>
<body>

	<%
	// 전달된 정보 (ID, PASS) 출력
	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	// DAO 객체 생성 -> idCheck(id, pass)
	MemberDAO mdao = new MemberDAO();
	int result=mdao.idCheck(id,pw);
	
	if(result==1){
		// 로그인 성공
		
		// 아이디값을 세션객체에 저장
		session.setAttribute("id", id);
		response.sendRedirect("../main/main.jsp");
		
	}else if (result==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류!");
		history.back();
		</script>
		
		<% 
	}else {	//result == -1
		%>
		<script type="text/javascript">
		alert("아이디가 없습니다!");
		history.back();
		</script>
		
		<% 
	
	
	}
	
	%>
<%-- 	<%=id %>
	<%=pass %> --%>

</body>
</html>
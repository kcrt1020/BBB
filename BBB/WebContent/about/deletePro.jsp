<%@page import="com.bbb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>board/deletePro.jsp</h1>
	
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달되는 데이터 처리 bno, passwd, pageNum
	int bno = Integer.parseInt(request.getParameter("bno")) ;
	String pw = request.getParameter("pw");
	String pageNum = request.getParameter("pageNum");
	
	
	
	// DAO 처리객체 -> deleteBoard(글번호, 비밀번호)
	// => 정수형 타입 데이터로 리턴 -> 페이지 이동처리
	BoardDAO bdao = new BoardDAO();
	int check = bdao.deleteBoard(bno,pw);
	
	
	
	
	if(check==1){
	%>
	<script type="text/javascript">
	alert("글 삭제 완료!");
	location.href="notice.jsp?pageNum=<%=pageNum%>";
	</script>
	
	<%
	} else if (check==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류!");
		history.back();
		</script>
		
		<%
	}else{	// check== -1
		%>
		<script type="text/javascript">
		alert("존재하지 않는 글번호입니다!");
		history.back();
		</script>
		
		<%
	}
	%>
	
</body>
</html>
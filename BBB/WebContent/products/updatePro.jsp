
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
<h1>board/updatePro.jsp</h1>

	<%
	// 한글 처리
	request.setCharacterEncoding("utf-8");
	
	// get방식으로 전달되는 데이터 처리
	String pageNum = request.getParameter("pageNum");
	String pw = request.getParameter("pw");
	
	// 파라미터값 저장 (수정할 데이터)
	// => 액션태그 사용 BoardBean 객체에 저장
	
	// <useBean>
	// <setProperty>
	%>
	<jsp:useBean id="bb" class="com.bbb.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	// DAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	// 정보 수정 메서드 updateBoard(bb)
	// => 결과를 정수형 데이터로 리턴
	int check = bdao.updateBoard(bb);
	// 1=> 정상처리, 0=>비밀번호 오류, -1=>해당 글이 없음
	// => 처리 결과에 따라서 페이지 이동
	
	if(check==1){
	%>
	<script type="text/javascript">
	alert("글 수정 완료!");
	location.href="products.jsp?pageNum=<%=pageNum%>";
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
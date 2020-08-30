package com.bbb.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class productsDAO {
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	String sql="";

	// 디비연결
		private Connection getCon(){
			
			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/bbbDB");
				
					con = ds.getConnection();
					System.out.println("연결성공!"+con);
					
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return con;	
		}
		// 드라이버 연결
		
		
		// 디비 자원해제
		public void closeDB(){
			try {
			if(rs != null){rs.close();} 
			if(pstmt != null){pstmt.close();} 
			if (con != null){con.close();}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 디비 자원해제
	
		// 자원해제
		
		
		// insertBoard() : 글쓰기처리
		public void insertBoard(productsBean pb){
			int num = 0;
			try {
			getCon();
			
			
			// sql(1) 글번호 계산, (2) 글정보를 저장
			sql = "select max(bno) from bbb_products";
			pstmt=con.prepareStatement(sql);
			
			// 실행
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			
			System.out.println("저장된 글번호 : "+num);
			
			// (2) 글정보를 저장
			// sql
			sql="insert into bbb_products (bno,name,pw,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt=con.prepareStatement(sql);
		
		
			pstmt.setInt(1, num);
			pstmt.setString(2, pb.getName());
			pstmt.setString(3, pb.getPw());
			pstmt.setString(4, pb.getSubject());
			pstmt.setString(5, pb.getContent());
			pstmt.setInt(6,0); // readcount
			pstmt.setInt(7,num); // re_ref
			pstmt.setInt(8,0); // re_lev
			pstmt.setInt(9,0);// re_seq
			pstmt.setString(10, pb.getIp());
			pstmt.setString(11, pb.getFile());
			
			// 실행
			pstmt.executeUpdate();
			
			System.out.println(num+"번 글쓰기 완료!");
			
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
		}
		
		// insertBoard() : 글쓰기처리
		
		
		// getBoardCount() : 글 개수 계산
		public int getBoardCount(){
			int count=0;
			
			try {
			// 디비연결
			getCon();
			
			// sql(글 개수 계산-count()) & pstmt
			sql="select count(*) from bbb_products";
			pstmt=con.prepareStatement(sql);
					
			// 실행
			rs = pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
			System.out.println("글 개수 : "+count );
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			// 값 리턴
			return count;
		} 
		
		// getBoardCount() : 글 개수 계산
		
		
		
		// getBoardList() : 글 전체 목록
		public ArrayList getBoardList(){
			ArrayList boardlist=new ArrayList();


			
			try {
			// 디비연결
			getCon();
			
			// sql (전체 글 정보 모두를 저장) & pstmt
			sql ="select * from bbb_products order by bno desc";
				pstmt=con.prepareStatement(sql);
			
			// 실행 -> 정보 저장
				rs= pstmt.executeQuery();
				
				while (rs.next()){ 
					// 행의 정보를 저장하는 객체 (productsBean)
					productsBean pb=new productsBean();
					
					pb.setBno(rs.getInt("bno"));
					pb.setContent(rs.getString("content"));
					pb.setDate(rs.getDate("date"));
					pb.setFile(rs.getString("file"));
					pb.setIp(rs.getString("ip"));
					pb.setName(rs.getString("name"));
					pb.setPw(rs.getString("pw"));
					pb.setRe_lev(rs.getInt("re_lev"));
					pb.setRe_ref(rs.getInt("re_ref"));
					pb.setRe_seq(rs.getInt("re_seq"));
					pb.setReadcount(rs.getInt("readcount"));
					pb.setSubject(rs.getString("subject"));
					
					// 리스트 한칸에 행의 정보 하나를 저장
					boardlist.add(pb);
				}
				
				System.out.println("글 정보 저장 완료 : "+boardlist.toString());
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	finally {
				closeDB();
			}
			return boardlist;
		}
		// getBoardList() : 글 전체 목록
		
		public ArrayList getBoardList(int startRow, int pageSize) {
			ArrayList boardList = new ArrayList();

			try {
				// 디비연결
				getCon();
				// SQL / pstmt
				// 게시판 목록중에서 10개씩 가져오기 
				// 정렬  - re_ref(그룹번호) 내림차순,
				//       re_seq(답글순서) 오름차순
				// 데이터 짤라서 가져오기  limit 시작행-1,개수
				// => 해당 위치부터 개수만큼 가져오기
				
				sql = "select * from bbb_products "
						+ "order by re_ref desc,re_seq asc "
						+ "limit ?,?";

				pstmt = con.prepareStatement(sql);
				
				//?
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);

				// 실행 -> rs
				rs = pstmt.executeQuery();

				// 데이터 처리 (검색된 모든 정보를 저장해서 이동)
				while (rs.next()) {
					// 글정보 하나를 productsBean 객체 하나에 저장
					productsBean pb = new productsBean();

					pb.setBno(rs.getInt("bno"));
					pb.setContent(rs.getString("content"));
					pb.setDate(rs.getDate("date"));
					pb.setFile(rs.getString("file"));
					pb.setIp(rs.getString("ip"));
					pb.setName(rs.getString("name"));
					pb.setPw(rs.getString("pw"));
					pb.setRe_lev(rs.getInt("re_lev"));
					pb.setRe_ref(rs.getInt("re_ref"));
					pb.setRe_seq(rs.getInt("re_seq"));
					pb.setReadcount(rs.getInt("readcount"));
					pb.setSubject(rs.getString("subject"));
					
					// 리스트 한칸에 행의 정보 하나를 저장
					boardList.add(pb);
				}

				System.out.println(" 모든 글 정보 저장 완료!");
				System.out.println(boardList);

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return boardList;
		}
		// getBoardList(startRow,pageSize)
	
		
		
		
		
	public void updateReadCount(int bno) throws Exception{
			
			// 디비연결
			getCon();
			try {
			// sql : 해당 글번호에 맞는 글에 조회수를 1 증가
			sql="update bbb_products set readcount= readcount+1 where bno=?";
			
				pstmt=con.prepareStatement(sql);
			
			
			pstmt.setInt(1, bno);
			
			// 실행
			
			pstmt.executeUpdate();
			System.out.println("조회수 1 증가 완료!");
			
			} catch (SQLException e) {
				System.out.println("조회수 1 증가 실패!");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		//updateReadCount(bno)
		
		
		// getBoard(bno);
	public productsBean getBoard(int bno){
		productsBean pb = null;
		
		// 디비연결
		try {
			getCon();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
		// sql 작성, pstmt 객체 생성
		// 글번호에 해당하는 모든 글의 정보를 가져오기 (select)
		sql = "select * from bbb_products where bno=?";
		
		// pstmt 객체
		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1, bno);

		// 실행 -> rs
		rs = pstmt.executeQuery();	

		// 데이터 처리
		if(rs.next()){ // 데이터가 있으면 실행
			// DB -> jsp 전달하기 위해서 productsBean객체에 저장
		pb = new productsBean();
		pb.setBno(rs.getInt("bno"));
		pb.setContent(rs.getString("content"));
		pb.setDate(rs.getDate("date"));
		pb.setFile(rs.getString("file"));
		pb.setIp(rs.getString("ip"));
		pb.setName(rs.getString("name"));
		pb.setPw(rs.getString("pw"));
		pb.setRe_lev(rs.getInt("re_lev"));
		pb.setRe_ref(rs.getInt("re_ref"));
		pb.setRe_seq(rs.getInt("re_seq"));
		pb.setReadcount(rs.getInt("readcount"));
		pb.setSubject(rs.getString("subject"));
		
		
		}// if
		
		// 글정보 저장 완료
				System.out.println("해당 글 저장 완료!");
				System.out.println(pb); // 정보확인
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		closeDB();
	}
		return pb;
	}

		
		// getBoard(bno);
		
	
	// updateBoard(bb)
	public int updateBoard(productsBean pb){
		int check =-1;
		
		try {
			
			// 디비연결
			getCon();
			System.out.println("디비연결 완료");
			
			// SQL -(select) 글쓴 사람 본인 확인
			// 글이 있는지 검색하는 SQL 구문
			sql="select * from bbb_products where bno=?";
			pstmt= con.prepareStatement(sql);
			// ?
			pstmt.setInt(1, pb.getBno());
			System.out.println("pstmt ? 추가 완료"+pb.getBno());
			
			rs=pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				System.out.println("rs.next()");
				if(pb.getPw().equals(rs.getString("pw"))){
					
					sql="update bbb_products set name=?, subject=?,content=? where bno=?";
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1,pb.getName());
					pstmt.setString(2, pb.getSubject());
					pstmt.setString(3, pb.getContent());
					pstmt.setInt(4, pb.getBno());
					
					pstmt.executeUpdate();
					System.out.println("수정완료");
							
					check=1;
				}
				else {
					check=0;
				}
			}else {
			check=-1;
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	// updateBoard(bb)
	
	
	// deleteBoard(글번호, 비밀번호)
	public int deleteBoard(int bno, String pw){
		int num = -1;
		
		try {
			// 디비연결
			getCon();
		
			// SQL & pstmt
			// -> 삭제하려고 하는 글이 있는지 판단
			// -> 글이 있을 경우 비밀번호 체크 삭제여부 판단
		sql="select pw from bbb_products where bno=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, bno);
		rs=pstmt.executeQuery();
		
		
		 if(rs.next()){
			 if(pw.equals(rs.getString("pw"))){
				 // 글삭제
				 sql = "delete from bbb_products where bno=?";
				 pstmt=con.prepareStatement(sql);
				 pstmt.setInt(1, bno);				 
				 pstmt.executeUpdate();
				 System.out.println("글 삭제 완료!");
				 num=1;
			 } else { num=0;
			 System.out.println("글 삭제 에러!"+num);
			 }
		 }else{
			 num=-1;
			 System.out.println("글 삭제 에러!"+num);
		 }
			 
		 	 
		 
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return num;
	} 
	
	// deleteBoard(글번호, 비밀번호)
	
	
	
	// reInsertBoard(bb)
	public void reInsertBoard(productsBean pb){
		int num = 0;
		try {
		// 디비 연결
			getCon();
	
		/******************* 답글 번호 계산 ***************************/
		// sql작성 (select-게시판의 글 번호 중 최대값 계산) & pstmt
			sql = "select max(bno) from bbb_products";
			pstmt=con.prepareStatement(sql);
			
		// 실행
			rs = pstmt.executeQuery();
		
		// 데이터 처리
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			
			System.out.println("답글 번호 : "+num);
			
		/********************************************************/
		
		/****************** 답글 순서 재배치 **************************/
		// re_ref (같은 그룹 기준) re_seq 값이 기존의 값보다 큰게 있을 경우
		// re_seq 값을 1 증가
		sql="update bbb_products set re_seq=re_seq+1 where re_ref=? and re_seq>?";
		pstmt= con.prepareStatement(sql);
		
		pstmt.setInt(1,pb.getRe_ref());
		pstmt.setInt(2,pb.getRe_seq());

		pstmt.executeUpdate();
		
		/********************************************************/
		
		/******************* 답글 추가 동작 ***************************/
		sql="insert into bbb_products values(?,?,?,?,?,?,?,?,?,now(),?,?)";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num); // 계산한 글번호 저장
		pstmt.setString(2, pb.getName());
		pstmt.setString(3, pb.getPw());
		pstmt.setString(4, pb.getSubject());
		pstmt.setString(5, pb.getContent());
		pstmt.setInt(6, pb.getReadcount());
		pstmt.setInt(7, pb.getRe_ref());	// 기존 원글의 그룹번호와 동일
		pstmt.setInt(8,pb.getRe_lev()+1);		// 기존의 값 + 1
		pstmt.setInt(9, pb.getRe_seq()+1);	// 기존의 값 + 1
		pstmt.setString(10,pb.getFile());
		pstmt.setString(11, pb.getIp());
		
		// 실행
		pstmt.executeUpdate();
		System.out.println("답글 저장 완료!");
		
		/********************************************************/
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
			
	}
	
	// reInsertBoard(bb)



	public int insertBoard(String fileName, String fileRealName) {		
		getCon();		
		String SQL = "INSERT INTO bbb_products VALUES (?, ?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,  fileName);
			pstmt.setString(2,  fileRealName);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}



}

	
	
	


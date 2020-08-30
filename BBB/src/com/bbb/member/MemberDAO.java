package com.bbb.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bbb.member.MemberBean;

public class MemberDAO {

	// 정보를 처리해서 데이터베이스에 저장
	
		// 디비연결에 필요한 변수 선언
		Connection con = null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String sql = "";
		
		
		// 드라이버 연결
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
		
		
		
		// 회원가입 메서드 insertMember
		public void insertMember(MemberBean mb){	
			try {
			con = getCon();
			// sql
			sql="insert into bbb_member values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
			
			// ?
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getBirth());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getGender());
			pstmt.setString(7, mb.getAddr1());
			pstmt.setString(8, mb.getAddr2());
			pstmt.setString(9, mb.getAddr3());
			pstmt.setString(10, mb.getPhone());
			pstmt.setString(11, mb.getMobile());
			pstmt.setDate(12, mb.getReg_date());
			
			// 실행
			pstmt.executeUpdate();
			System.out.println("회원가입 성공!");
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("회원가입 실패!");
			}finally {
				
			}closeDB();
		}
		
		// insertMember
		
		// 중복아이디 체크하는 메서드 joinIdCheck(ID);
		public int joinIdCheck(String ID){
			int result = -1;		
			try {
			// 디비 연결
			con = getCon();
			// SQL(select) - pstmt
			sql = "select * from bbb_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ID);
			// 실행
			rs = pstmt.executeQuery();
				
			// rs 데이터 처리
			// 1 - 사용 가능한 아이디
			// 0 - 사용 불가능한 아이디
			// -1 -> 에러 발생
			if (rs.next()){
				result = 0;
			}else { 
				result = 1;
			}

			System.out.println("아이디 중복체크 : "+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
			return result;
		}
		// 중복아이디 체크하는 메서드 joinIdCheck(ID);
		
		
		// 로그인 체크 메서드 idCheck(id, pass)
		public int idCheck(String id, String pw){
			int result=-1;
		
			try {
			//디비연결
			getCon();
			
			// sql(id에 해당하는 정보가 있는지 없는지 판단)
			sql="select pw from bbb_member where id=?";
		
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				// 아이디, 비밀번호 같을 때 로그인 처리
				// 아이디X(-1) 비밀번호X(0)
				
				if(rs.next()){
					if(pw.equals(rs.getString("pw"))){
						result=1; 
						
					} else{
					result=0; // 비밀번호 X
				}
				}else {
					result=-1; // 아이디 X
				}
				
				System.out.println("로그인 처리 완료 : "+result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				closeDB();
			}
		
		return result;
		}
		
		// 로그인 체크 메서드 idCheck(id, pass)
		
		
		
		
		// getMember(id)
		public MemberBean getMember(String id){
			MemberBean mb = null;
			
			try {
			// 1, 2 디비연결
			con=getCon();
			// 3 SQL 작성(select) & pstmt
			// 3-1 ?
			sql = "select * from bbb_member where id=?";
			
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
			// 4 실행	-> rs
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			
			if(rs.next()){
				// DB에 있는 회원정보를 저장 -> 페이지로 전달
				mb = new MemberBean();
				
				
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getDate("reg_date"));
				mb.setPw(rs.getString("pw"));
				mb.setAddr1(rs.getString("addr1"));
				mb.setAddr2(rs.getString("addr2"));
				mb.setAddr3(rs.getString("addr3"));
				mb.setBirth(rs.getString("birth"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
				
				System.out.println("회원정보 저장완료!");
				System.out.println(mb);
			}
			
			System.out.println("구문 실행 완료!");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
				
			} finally {
				closeDB();
			}
			return mb;
			
		} // getMember(id)


		
		
		
		// updateMember(mb)
		public int updateMember(MemberBean mb){
			int result = -1;
			
			try {
			// 1, 2 디비연결
			con = getCon();
			
			// 3 sql 작성 (select) - 수정하는 사람이 있는지를 체크
			sql = "select pw from bbb_member where id=?";
			// pstmt 객체 생성
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, mb.getId());

			// 4 실행

				rs = pstmt.executeQuery();
			
			// 5 데이터처리
			// 사용자 o - 비밀번호 체크 (o/x) => 비밀번호 수정(3,4단계) 
			// 사용자 x
				
				if(rs.next()){
					if(mb.getPw().equals(rs.getString("pw"))){
						// 데이터 수정
						
						// 3 sql & pstmt
						sql = "update bbb_member set name=?,birth=?,gender=?,email=?,addr1=?,addr2=?,addr3=?,phone=?,mobile=? where id=?";
						pstmt=con.prepareStatement(sql);
						
						pstmt.setString(1, mb.getName());
						pstmt.setString(2, mb.getBirth());
						pstmt.setString(3, mb.getGender());
						pstmt.setString(4, mb.getEmail());
						pstmt.setString(5, mb.getAddr1());
						pstmt.setString(6, mb.getAddr2());
						pstmt.setString(7, mb.getAddr3());
						pstmt.setString(8, mb.getPhone());
						pstmt.setString(9, mb.getMobile());
						pstmt.setString(10, mb.getId());
					
						
						// 4 실행
						pstmt.executeUpdate();
						System.out.println("정보수정 완료");
						
						
						result=1;
					}else{
						result=0;
					}
				}else{
					// 사용자가 없는 경우
					result = -1;
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return result;
		}
		// updateMember(mb)
		
		
		
		// deleteMember(id,pw)
		public int deleteMember(String id,String pw){
			int result = -1;
				
			try {
			
			// 1 2 디비연결
			con=getCon();
			
			// 3 SQL 구문 작성
			sql="select pw from bbb_member where id=?";
			
				pstmt= con.prepareStatement(sql);
			
			
			pstmt.setString(1,id);
			
			
			// 4 실행 -> rs
			rs = pstmt.executeQuery();
			
			// 5 데이터처리
			if(rs.next()){
				// 아이디에 해당하는 비밀번호(정보)가 있다.
				if(pw.equals(rs.getString("pw"))){
					// 비밀번호 동일함. 
					sql = "delete from bbb_member where id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.executeUpdate();
					System.out.println("탈퇴 성공! (1)");
					result=1;

				}else{
					// 비밀번호 다름 = > 비밀번호 오류(0)
					System.out.println("비밀번호 오류! (0)");
					result =0;
				}
			}else{		
				// 아이디에 해당하는 비밀번호가 없다.			
				System.out.println("아이디 없음!(-1)");
				result = -1;
			}	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
			
		}return result;
		}// deleteMember(id,pw)
		
		
		// getMemberList()
		// <> 다이아몬드 오퍼레이터 / E 제네릭타입
		public ArrayList getMemberList(){
			
			// 가변길이 배열 -> 타입지정 없이는 Object로 저장가능(모든 타입으로 저장가능)
			ArrayList memberList = new ArrayList();
			// ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
			
			
			try {
			// 1, 2 디비연결
			con = getCon();
			
			// 3 sql & pstmt
			sql="select * from bbb_member";		
				pstmt=con.prepareStatement(sql);		
			
			// 4 실행 -> rs
				rs = pstmt.executeQuery();
					
			// 5 데이터 처리
				while(rs.next()){
					// DB테이블 결과 1행의 정보 모두를 MemberBean으로 저장
					// 1명(1행)정보를 배열 한칸에 저장
					MemberBean mb = new MemberBean();
					
					
					mb.setEmail(rs.getString("email"));
					mb.setGender(rs.getString("gender"));
					mb.setId(rs.getString("id"));
					mb.setName(rs.getString("name"));
					mb.setReg_date(rs.getDate("reg_date"));
					mb.setPw(rs.getString("pw"));
					mb.setAddr1(rs.getString("addr1"));
					mb.setAddr2(rs.getString("addr2"));
					mb.setAddr3(rs.getString("addr3"));
					mb.setBirth(rs.getString("birth"));
					mb.setMobile(rs.getString("mobile"));
					mb.setPhone(rs.getString("phone"));
					///////////////////////////////////////////////////
					// 회원 1명의 정보 저장완료!(1행)
					
					// 배열(ArrayList) 저장
					// -> 가변길이 배열 (필요시마다 배열의 크기가 증가)
					memberList.add(mb);
					// 배열 한칸에 회원1명의 정보 저장 완료
				
					
					System.out.println(memberList.toString());
					
				}// while 
				
				System.out.println("정보검색완료");
				System.out.println(memberList);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return memberList;
			
		}
		
		// getMemberList()
		
		
		
		
		
		
		
	}
		
		
		


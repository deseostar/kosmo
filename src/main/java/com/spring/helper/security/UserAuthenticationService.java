package com.spring.helper.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.helper.vo.BoardVO.UserVO;

public class UserAuthenticationService implements UserDetailsService{
	private static UserAuthenticationService instance = new UserAuthenticationService();
	public static UserAuthenticationService getInstance() {
		return instance;
	}

	private UserAuthenticationService() {
		try {
			/*
			 * dbcp(Data base Connection Pool) 설정을 읽어서 커넥션을 발급받겠다.
			 * 1. Context : Server > context.xml 파일의 resource를 분석할 객체
			 */
			Context context = new InitialContext();
			/*
			 * 2. context.xml 검색(lookup)시 resource name으로 찾겠다.(커넥션풀 name : jdbc/Oracle11g)
			 * 3. db서버가 startup시 이미 커넥션이 50개 만들어진 상태
			 * 4. DataSource에 dbcp 설정된 정보를 읽어들여서 담는다.
			 * 5. 아래 각 메소드에서 datasource.getconnection()시 50중 1개 커넥션을 받고
			 * 6. 사용이 끝나면 finally에서 conn.close();해서 반납.
			 */
			datasource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g_helper");
		} catch(Exception e){
			e.printStackTrace();
		}

	}
	// 커넥션 풀 객체를 보관
	DataSource datasource;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = username;
		CustomUserDetails userVO = new CustomUserDetails();
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM users WHERE memberEmail = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			System.out.println("로그인시 DB 실행");
			if(rs.next()) {
				userVO.setMemberNumber(rs.getInt("memberNumber"));
				userVO.setMemberEmail(rs.getString("memberEmail"));
				userVO.setMemberId(rs.getString("memberId"));
				userVO.setPassword(rs.getString("password"));
				userVO.setMemberCountry(rs.getString("memberCountry"));
				userVO.setMemberRegdate(rs.getTimestamp("memberRegdate"));
				userVO.setMemberPoint(rs.getInt("memberPoint"));
				userVO.setMemberRecommend(rs.getString("memberRecommend"));
				userVO.setAuthority(rs.getString("authority"));
				userVO.setEnabled(rs.getString("enabled"));
				userVO.setMemberTemp1(rs.getString("memberTemp1"));
				userVO.setMemberTemp2(rs.getString("memberTemp2"));
				userVO.setMemberTemp3(rs.getInt("memberTemp3"));
				userVO.setAccountNumber(rs.getString("accountNumber"));
			}
			System.out.println("db실행했다.");	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return userVO;
	}

}

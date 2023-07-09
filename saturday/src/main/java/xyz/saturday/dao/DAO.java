package xyz.saturday.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import xyz.saturday.dto.DTO;

public class DAO extends JdbcDAO{
	private static DAO _dao;
	
	public DAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new DAO();
	}
	
	public static DAO getdDao() {
		return _dao;
	}
	
	//회원가입할 떄 DB에 회원정보 행 추가하는 메소드
	public void insertMember(DTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			
			String sql="insert member set id=?,password=?,name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			
		} catch (SQLException e) {
			System.out.println("sql 문장에서 에러");
		} finally {
			close(con, pstmt);
		}
	}
	
	//아이디 중복체크 떄 DB에 회원정보를 검색하는 메소드
	public DTO selectMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DTO member=null;
		try {
			con=getConnection();
			
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new DTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 문장에서 에러");
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
}

package xyz.saturday.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	public void insertMember(DTO insert) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			
			String sql="insert member set id=?,password=?,name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,insert.getId());
			pstmt.setString(2, insert.getPassword());
			pstmt.setString(3, insert.getName());
			
		} catch (SQLException e) {
			System.out.println("sql 문장에서 에러");
		} finally {
			close(con, pstmt);
		}
	}
}

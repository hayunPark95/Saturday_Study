package xyz.saturday.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import xyz.saturday.dto.DTO;

public class DAO extends JdbcDAO {
	private static DAO _dao;
	
	public DAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new DAO();
	}
	
	public static DAO getDao() {
		return _dao;
	}
	
	public int createAccount(DTO create) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into ACCOUNT values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, create.getId());
			pstmt.setString(2, create.getPassword());
			pstmt.setString(3, create.getName());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql상의 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public DTO selectAccount(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DTO create=null;
		try {
			con = getConnection();
			
			String sql="select * from ACCOUNT where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				create=new DTO();
				create.setId(rs.getString("id"));
				create.setPassword(rs.getString("password"));
				create.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			System.out.println("sql상의 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return create;
	}
}

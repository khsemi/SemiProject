package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.corba.se.spi.orbutil.fsm.State;

public class JDBCTemplate {
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
//			System.out.println("01. 드라이버 연결");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
//			System.out.println("01. 드라이버 연결실패");
			e.printStackTrace();
		}
		
		String url="jdbc:oracle:thin:@192.168.10.4:1521:xe";
		String id="test";
		String pw="test";
		
		Connection con = null;
		
		try {
			con=DriverManager.getConnection(url, id, pw);
//			System.out.println("02. 계정 연결");
			
			con.setAutoCommit(false); //내가 원할때 커밋 할수있따.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}
		return con;
	}
	
	//연결 확인 메소드
	public static boolean isConnection(Connection con) {
		boolean valid = true;
		
		try {
			if(con==null || con.isClosed()) {
				valid= false;
			}
		} catch (SQLException e) {
			valid=true;
			e.printStackTrace();
		}
		return valid;
	}
	
	
	public static void close(Connection con) {
		if(isConnection(con)) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void commit(Connection con) {
		if(isConnection(con)) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void rollback(Connection con) {
		if(isConnection(con)) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
}

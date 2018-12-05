package semi.KHC.foodticketDao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semi.KHC.foodticketDto.FoodticketDto;


public class FoodticketDao {
	

	public int insert(FoodticketDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql= "INSERT INTO KH_FOODTICKET VALUES (FOODTICKET_SEQ_IDSQ.NEXTVAL, ?, NULL, ?, ?, SYSDATE ) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getUser_seq());
			pstm.setString(2, dto.getFoodticket_name());
			pstm.setInt(3, dto.getFoodticket_pay());
			System.out.println("03.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");			
		}		
		return res;
	}
	
	public int update(String foodticket_qrcode, int foodticket_seq_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql= " UPDATE KH_FOODTICKET SET FOODTICKET_QRCODE = ? WHERE FOODTICKET_SEQ_ID = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, foodticket_qrcode);
			pstm.setInt(2, foodticket_seq_id);
			System.out.println("03.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");			
		}		
		return res;
	}
	
	public List<FoodticketDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FoodticketDto> res = new ArrayList<FoodticketDto>();

		String sql= " SELECT * FROM KH_FOODTICKET ORDER BY FOODTICKET_SEQ_ID ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비 : " + sql);
		
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				FoodticketDto tmp = new FoodticketDto();
				tmp.setFoodticket_seq_id(rs.getInt(1));
				tmp.setUser_seq(rs.getInt(2));
				tmp.setFoodticket_qrcode(rs.getString(3));
				tmp.setFoodticket_name(rs.getString(4));
				tmp.setFoodticket_pay(rs.getInt(5));
				tmp.setRegdate(rs.getDate(6));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		
		return res;
	}
	
	

	
	public int update(FoodticketDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql= " UPDATE KH_FOODTICKET SET FOODTICKET_QRCODE = ? WHERE FOODTICKET_SEQ_ID = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getFoodticket_qrcode() );
			System.out.println("03.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
	}
	
	public int Num() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql= "SELECT FOODTICKET_SEQ_ID FROM KH_FOODTICKET";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비 : " + sql);
		
			rs = pstm.executeQuery();
			while(rs.next()) {
				res = rs.getInt("FOODTICKET_SEQ_ID");
			}
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		
		return res;
	}
	
	
	
}

package semi.KHC.calendarDao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import semi.KHC.calendarDto.CalDto;

public class CalDao extends JDBCTemplate {

	public int insert(CalDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;		//CAL_SEQ,USER_SEQ,CAL_TITLE,CAL_CONTENT,CAL_MDATE,CAL_REGDATE,CAL_CATEGORY
		String sql = " INSERT INTO KH_CAL VALUES(KH_CAL_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?) ";
		int res = 0;
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1,dto.getUser_seq());
			pstm.setString(2,dto.getCal_title());
			pstm.setString(3,dto.getCal_content());
			pstm.setString(4, dto.getCal_mdate());
			pstm.setString(5, dto.getCal_category());
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		return res;
	}
	public List<CalDto> selectAll(int User_seq,String yyyyMMdd){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<CalDto> list = new ArrayList<CalDto>();
		CalDto  res = null;
		
		String sql = " SELECT * FROM KH_CAL WHERE USER_SEQ=? AND SUBSTR(CAL_MDATE,1,8) =? ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, User_seq);
			pstm.setString(2, yyyyMMdd);
			rs= pstm.executeQuery();
			
			while(rs.next()) {
				res = new CalDto(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return list;
		
	}
	
	public int multiDelete(String[] CAL_SEQ_ID) {
		Connection con = getConnection();
		PreparedStatement pstm=null;
		int res =0;
		int cnt[]=null;
		
		String sql = " DELETE FROM KH_CAL WHERE CAL_SEQ_ID=? ";
		try {
			pstm=con.prepareStatement(sql);
			for(int i=0;i<CAL_SEQ_ID.length;i++) {
				pstm.setString(1, CAL_SEQ_ID[i]);
				pstm.addBatch();
			}
			cnt = pstm.executeBatch();
			
			for(int i=0;i<cnt.length;i++) {
				if(cnt[i]==-2) {
					res++;
				}
			}
			if(CAL_SEQ_ID.length==res) {
				commit(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		return res;
		
	}
	
	public List<CalDto> getCalViewList(int User_seq,String yyyyMM){
		String sql = "SELECT CAL_SEQ_ID,USER_SEQ,CAL_TITLE,CAL_CONTENT,CAL_MDATE,CAL_REGDATE,CAL_CATEGORY FROM (SELECT (ROW_NUMBER() OVER " +
					" (PARTITION BY SUBSTR(CAL_MDATE,1,8) " + 
					" ORDER BY CAL_MDATE))RN,CAL_SEQ_ID,USER_SEQ,CAL_TITLE,CAL_CONTENT,CAL_MDATE,CAL_REGDATE,CAL_CATEGORY "+
					" FROM KH_CAL "+
					" WHERE USER_SEQ = ? AND SUBSTR(CAL_MDATE,1,6)=? ) "+
					" WHERE RN BETWEEN 1 AND 3";
		
		Connection con = getConnection();
		PreparedStatement pstm=null;
		List<CalDto> res = new ArrayList<CalDto>();
		ResultSet rs = null;
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, User_seq);
			pstm.setString(2, yyyyMM);
			rs=pstm.executeQuery();
			while(rs.next()) {
				CalDto tmp = new CalDto(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7));
				res.add(tmp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("db종료");
		}
		return res;
	}
	
	public int getCalViewCount(int User_seq,String yyyyMM) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int cnt = 0;
		
		String sql = " SELECT COUNT(*) FROM KH_CAL WHERE USER_SEQ=? AND SUBSTR(CAL_MDATE,1,8)=? ";
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, User_seq);
			pstm.setString(2, yyyyMM);
			System.out.println("03.query준비 " + sql);
			
			rs=pstm.executeQuery();
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			
		}
		
		return cnt;
	}
}

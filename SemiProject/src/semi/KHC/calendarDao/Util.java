package semi.KHC.calendarDao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import semi.KHC.calendarDto.CalDto;

public class Util {
	private String toDate;
	
	public String getToDate() {
		return toDate;
	}
	
	public void setToDate(String mdate) {
		String tmp = mdate.substring(0, 4)+"-"+mdate.substring(4,6)+"-"+mdate.substring(6,8)+" "+mdate.substring(8,10)+":"+mdate.substring(10)+":00"; 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		
		Timestamp tm=  Timestamp.valueOf(tmp);
		this.toDate = sdf.format(tm);
	}
	
	public static String istwo(String msg) {
		return (msg.length()<2)?"0"+msg:msg;
	}
	public static String getCalView(int i,List<CalDto> list) {
		String d = istwo(i+"");
		String res ="";
		
		for(CalDto dto : list) {
			if(dto.getCal_mdate().substring(6, 8).equals(d)) {
				res +="<p>";
				res +=(dto.getCal_title().length()>6)?
						dto.getCal_title().substring(0, 6)+"..":dto.getCal_title();
				res +="</p>";
			}
		}
		System.out.println(res);
		return res;
	}
	
	public static String fontColor(int date,int dayOfWeek) {
		String color="";
		if((dayOfWeek +date-1)%7==0) {
			color = "blue";
		}
		else if((dayOfWeek+date-1)%7==1) {
			color = "red";
		}else {
			color="black";
		}
		return color;
	}
	
	
	
}

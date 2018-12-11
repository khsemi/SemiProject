package semi.KHC.mapDto;

public class MapDto {
	/*
	 * CREATE TABLE KH_MAPS
	(
	    MAPS_SEQ_ID    NUMBER      NOT NULL, 
	    MAPS_NAME      VARCHAR2(4000)    UNIQUE   NOT NULL, 
	    MAPS_DETAIL    VARCHAR2(4000)    NOT NULL, 
	    MAPS_X         VARCHAR2(4000)    NOT NULL, 
	    MAPS_Y         VARCHAR2(4000)    NOT NULL, 
	    CONSTRAINT KH_MAPS_PK PRIMARY KEY (MAPS_SEQ_ID)
	);
	
	*/
	
	private int maps_seq_id;
	private String maps_name;
	private String maps_detail;
	private String maps_x;
	private String maps_y;
	
	//기본생성자
	public MapDto() {
		//super();
	}
	
	//생성자 전체
	
	public MapDto(int maps_seq_id, String maps_name, String maps_detail, String maps_x, String maps_y) {
		super();
		this.maps_seq_id = maps_seq_id;
		this.maps_name = maps_name;
		this.maps_detail = maps_detail;
		this.maps_x = maps_x;
		this.maps_y = maps_y;
	}
	
	// test insert
	public MapDto(String maps_name, String maps_x, String maps_y) {
		super();
		this.maps_name = maps_name;
		this.maps_x = maps_x;
		this.maps_y = maps_y;
	}
	// update
	public MapDto(int maps_seq_id, String maps_name, String maps_x, String maps_y) {
		this.maps_seq_id = maps_seq_id;
		this.maps_name = maps_name;
		this.maps_x = maps_x;
		this.maps_y = maps_y;
	}

	public int getMaps_seq_id() {
		return maps_seq_id;
	}

	public void setMaps_seq_id(int maps_seq_id) {
		this.maps_seq_id = maps_seq_id;
	}

	public String getMaps_name() {
		return maps_name;
	}

	public void setMaps_name(String maps_name) {
		this.maps_name = maps_name;
	}

	public String getMaps_detail() {
		return maps_detail;
	}

	public void setMaps_detail(String maps_detail) {
		this.maps_detail = maps_detail;
	}

	public String getMaps_x() {
		return maps_x;
	}

	public void setMaps_x(String maps_x) {
		this.maps_x = maps_x;
	}

	public String getMaps_y() {
		return maps_y;
	}

	public void setMaps_y(String maps_y) {
		this.maps_y = maps_y;
	}
	
	
}

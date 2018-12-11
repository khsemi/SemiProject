package semi.KHC.favoriteDto;

public class FavoriteDto {
	
	/*
	 * 
	FAVORITE_SEQ_ID    NUMBER      NOT NULL, 
    BOARD_SEQ_ID       NUMBER      NOT NULL, 
    USER_SEQ           NUMBER      NOT NULL, 
    FAVORITE_COUNT     NUMBER    NOT NULL, 
	 */
	private int favorite_seq_id;
	private int board_seq_id;
	private int user_seq;
	private int favorite_count;
	
	public FavoriteDto(){
		
	}
	
	public FavoriteDto(int favorite_seq_id, int board_seq_id, int user_seq, int favorite_count){
		this.favorite_seq_id = favorite_seq_id;
		this.board_seq_id = board_seq_id;
		this.user_seq = user_seq;
		this.favorite_count = favorite_count;
	}
	
	public int getFavorite_seq_id() {
		return favorite_seq_id;
	}

	public void setFavorite_seq_id(int favorite_seq_id) {
		this.favorite_seq_id = favorite_seq_id;
	}

	public int getBoard_seq_id() {
		return board_seq_id;
	}

	public void setBoard_seq_id(int board_seq_id) {
		this.board_seq_id = board_seq_id;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getFavorite_count() {
		return favorite_count;
	}

	public void setFavorite_count(int favorite_count) {
		this.favorite_count = favorite_count;
	}

	public FavoriteDto(int user_seq) {
		this.user_seq = user_seq;
	}
}

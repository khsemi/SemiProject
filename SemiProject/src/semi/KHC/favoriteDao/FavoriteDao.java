package semi.KHC.favoriteDao;

public interface FavoriteDao {
	
	String FAVORITE_NAMESPACE = "kh_favorite.";
	
	//1. board_detail > favorite_select(추천/비추천을 했으면 값이 넘어옴) | 로그인 시에만 
	//2. favorite_select > service > Ajax.java(ajax용 컨트롤러)
	
	//추천 테이블에 이미 추천/비추천 한적이 있는지 체크후 값(추천 : 1 / 비추천 : -1 리턴 
	public int favorite_select(int board_seq_id, int user_seq);
	//추천을 할 수 있는지 체크
	//public boolean favorite_check(int board_seq_id, int user_seq);
	//추천 테이블에서 등록(+1)
	public boolean favorite_insert_up(int board_seq_id, int user_seq);
	//추천 테이블에서 등록(-1)
	public boolean favorite_insert_down(int board_seq_id, int user_seq);
	//추천 테이블에서 삭제
	public boolean favorite_delete(int board_seq_id, int user_seq);
}

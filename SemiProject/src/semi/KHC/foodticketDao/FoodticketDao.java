package semi.KHC.foodticketDao;
import java.util.List;
import semi.KHC.foodticketDto.FoodticketDto;

public interface FoodticketDao {

	String FOODTICKET_NAMESPACE = "kh_foodticket.";
	
	public int insert(FoodticketDto foodticketDto);
	public int update(int foodticket_seq_id, String qrcode);
	public List<FoodticketDto> selectAll(int user_seq);
//	public int Num();
}

package semi.KHC.userDao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {

		// Config.xml 의 경로
		String resource = "db/khc_config.xml";

		try {
			// Config.xml 의 파을 정보를 읽어온다.
			Reader reader = Resources.getResourceAsReader(resource);
			// SqlSessionFactory 객체 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlSessionFactory;
	}

}

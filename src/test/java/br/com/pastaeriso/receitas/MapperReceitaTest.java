package br.com.pastaeriso.receitas;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import com.google.gson.Gson;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;

public class MapperReceitaTest {
  @Test
  public void selectReceitasTest() {
    List<Receita> receitas = null;

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			MapperReceita mapper = sqlSession.getMapper(MapperReceita.class);
			receitas = mapper.selectReceitas();
		}
    assertNotNull(receitas);
    System.out.println(receitas);
    //Gson gson = new Gson();
    //String string = gson.toJson(pedido);

  }
}

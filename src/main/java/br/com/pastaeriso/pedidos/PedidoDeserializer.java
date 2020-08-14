package br.com.pastaeriso.pedidos;

import br.com.pastaeriso.pedidos.FormaDePagamento;
import com.google.gson.*;
import java.lang.reflect.Type;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;

public class PedidoDeserializer {

  public static class FormaDePagamentoDeserializer implements JsonDeserializer<FormaDePagamento> {
    public FormaDePagamento deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
      String string = json.getAsJsonPrimitive().getAsString();
      // primeiro tente recuperar
      FormaDePagamento forma;
      try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
  			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
  		  forma = pedidoMapper.selectFormaDePagamentoPorForma(string);
  		}
      if(forma == null) {
        // crie
        Integer forma_id;
        try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
    			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
    		  forma_id = pedidoMapper.insertFormaDePagamento(string);
          sqlSession.commit();
    		}
        // e agora recrie
        forma = new FormaDePagamento(forma_id,string);
      }
      return forma;
    }
  }
}

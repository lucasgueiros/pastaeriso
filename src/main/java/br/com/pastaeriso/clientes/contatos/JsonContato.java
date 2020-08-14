package br.com.pastaeriso.clientes.contatos;

import com.google.gson.*;
import java.lang.reflect.Type;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;

public class JsonContato {

  public static class JsonFormaDeContato implements JsonDeserializer<FormaDeContato> {
    public FormaDeContato deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
          FormaDeContato forma = null;
          String string = json.getAsJsonPrimitive().getAsString();
          try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
            ContatoMapper contatoMapper = sqlSession.getMapper(ContatoMapper.class);
            forma = contatoMapper.selectFormaDeContatoPorForma(string);
          }
          return forma;
    }
  }
}

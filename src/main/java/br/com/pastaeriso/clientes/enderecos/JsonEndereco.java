package br.com.pastaeriso.clientes.enderecos;

import com.google.gson.*;
import java.lang.reflect.Type;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;

public class JsonEndereco implements JsonDeserializer<Endereco> {
    public Endereco deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {

          if (json.isJsonPrimitive()) {
            Integer id = new Integer(json.getAsJsonPrimitive().getAsInt());
            Endereco endereco = null;
            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
        			EnderecoMapper enderecoMapper = sqlSession.getMapper(EnderecoMapper.class);
        			endereco = enderecoMapper.selectEnderecoById(id);
        		}
            return endereco;

          } else if (json.isJsonObject()) {
            Endereco endereco = new GsonBuilder()
              .registerTypeAdapter(TipoDeEndereco.class, new TipoDeEnderecoDeserializer())
              .create()
              .fromJson(json, Endereco.class);
            //try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
        		//	ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
        		//	Integer id = clienteMapper.insertCliente(cliente);
            //  cliente = clienteMapper.selectClienteById(id);
        		//}
            return endereco;
          } else {
            return null;
          }

        }

  public static class TipoDeEnderecoDeserializer implements JsonDeserializer<TipoDeEndereco> {
    public TipoDeEndereco deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
      TipoDeEndereco tipo = null;
      System.out.println("JsonEndereco.42: as jsonelement: " + json);
      String string = json.getAsJsonPrimitive().getAsString();
      System.out.println("JsonEndereco.44: as string: " + string);
      try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
        EnderecoMapper enderecoMapper = sqlSession.getMapper(EnderecoMapper.class);
        tipo = enderecoMapper.selectTipoDeEnderecoPorTipo(string);
      }
      System.out.println("JsonEndereco.44: as tipo  de endereco: " + tipo);
      return tipo;
    }
  }
}

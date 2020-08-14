package br.com.pastaeriso.clientes;

import br.com.pastaeriso.pedidos.FormaDePagamento;
import com.google.gson.*;
import java.lang.reflect.Type;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;
import java.util.HashMap;
import br.com.pastaeriso.clientes.contatos.*;
import br.com.pastaeriso.clientes.enderecos.*;

public class JsonCliente implements JsonDeserializer<Cliente> {
    public Cliente deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {

          if (json.isJsonPrimitive()) {
            Integer id = new Integer(json.getAsJsonPrimitive().getAsInt());
            Cliente cliente = null;
            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
        			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
        			cliente = clienteMapper.selectClienteById(id);
        		}
            return cliente;

          } else if (json.isJsonObject()) {
            Cliente cliente = new GsonBuilder()
              .registerTypeAdapter(FormaDeContato.class, new JsonContato.JsonFormaDeContato())
              .registerTypeAdapter(TipoDeEndereco.class, new JsonEndereco.TipoDeEnderecoDeserializer())
              .create()
              .fromJson(json, Cliente.class);

            Integer cliente_id;
            Integer contato_id;
            Integer endereco_id;

            HashMap<String,Object> parametrosEndereco = new HashMap<>();
            parametrosEndereco.put("nome",cliente.getEnderecoPreferencial().getNome());
            parametrosEndereco.put("rua",cliente.getEnderecoPreferencial().getRua());
            parametrosEndereco.put("numero",cliente.getEnderecoPreferencial().getNumero());
            parametrosEndereco.put("bairro",cliente.getEnderecoPreferencial().getBairro());
            parametrosEndereco.put("complemento",cliente.getEnderecoPreferencial().getComplemento());
            parametrosEndereco.put("ponto_de_referencia",cliente.getEnderecoPreferencial().getPontoDeReferencia());
            parametrosEndereco.put("comentarios",cliente.getEnderecoPreferencial().getComentarios());
            parametrosEndereco.put("tipo_de_endereco",cliente.getEnderecoPreferencial().getTipo().getId());

            HashMap<String,Object> parametrosContato = new HashMap<>();
            parametrosContato.put("forma",cliente.getContatoPreferencial().getForma().getId());
            parametrosContato.put("nome",cliente.getContatoPreferencial().getNome());
            parametrosContato.put("contato",cliente.getContatoPreferencial().getContato());

            HashMap<String,Object> parametrosPreferencias = new HashMap<>();

            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
        			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
        			cliente_id = clienteMapper.insertCliente(cliente.getNome());
              System.out.println("JsonCliente.34: " + cliente);
            }

            parametrosEndereco.put("cliente_id",cliente_id);
            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
              EnderecoMapper enderecoMapper = sqlSession.getMapper(EnderecoMapper.class);
              endereco_id = enderecoMapper.insertEndereco(parametrosEndereco);
            }
            parametrosContato.put("cliente_id",cliente_id);

            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
              ContatoMapper contatoMapper = sqlSession.getMapper(ContatoMapper.class);
              contato_id = contatoMapper.insertContato(parametrosContato);
            }

            ClientePreferencias preferencias = new ClientePreferencias(cliente_id, endereco_id, contato_id);

            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
              ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
              clienteMapper.insertClientePreferencias(preferencias);
              sqlSession.commit();
        		}

            System.out.println("JsonCliente.80: " + cliente_id);
            try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
              ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
              cliente = clienteMapper.selectClienteById(cliente_id);
        		}


            System.out.println("JsonCliente.87: " + endereco_id);
            System.out.println("JsonCliente.88: " + contato_id);
            System.out.println("JsonCliente.89: " + cliente);
            return cliente;
          } else {
            return null;
          }

        }
      }

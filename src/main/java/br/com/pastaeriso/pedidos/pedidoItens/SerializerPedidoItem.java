package br.com.pastaeriso.pedidos.pedidoItens;

import com.google.gson.*;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import br.com.pastaeriso.produtos.Produto;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.produtos.ProdutoMapper;

public class SerializerPedidoItem implements JsonSerializer<PedidoItem>, JsonDeserializer<PedidoItem> {



    public JsonElement serialize(PedidoItem pedidoItem, Type type,
        JsonSerializationContext jsonSerializationContext)
    {
        if(pedidoItem == null ) return JsonNull.INSTANCE;

        JsonObject object = new JsonObject();
        object.addProperty("id",pedidoItem.getId());
        object.addProperty("produto",pedidoItem.getProduto().getNome());
        if(pedidoItem.getQuantidade() != null)
          object.addProperty("quantidade",pedidoItem.getQuantidade());
        else
          object.addProperty("quantidade",0);
        if(pedidoItem.getComentarios() != null)
          object.addProperty("comentarios",pedidoItem.getComentarios());
        else
          object.addProperty("comentarios","");
        if(pedidoItem.getSubtotal() != null)
          object.addProperty("subtotal",pedidoItem.getSubtotal());
        else
          object.addProperty("subtotal",0);
        return object;
    }

    public PedidoItem deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
      if(json != null  && json.isJsonObject()) {
        JsonObject JsonObject = json.getAsJsonObject();
        BigDecimal quantidade = BigDecimal.valueOf(JsonObject.getAsJsonPrimitive("quantidade").getAsDouble());
        String comentarios = JsonObject.getAsJsonPrimitive("comentarios").getAsString();
        String produtoNome = JsonObject.getAsJsonPrimitive("produto").getAsString();
        Produto produto = null;

        try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
    			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
    			produto = produtoMapper.selectProdutoPorNome(produtoNome);
        }
        if(produto == null ) return null;

        PedidoItem pedidoItem = new PedidoItem(produto,quantidade);
        pedidoItem.setComentarios(comentarios);
        return pedidoItem;
      }
      return null;
    }
}

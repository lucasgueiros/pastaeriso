package br.com.pastaeriso.pedidos.pedidoItens;

import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.JsonObject;
import com.google.gson.JsonNull;
import java.lang.reflect.Type;

public class SerializerPedidoItem implements JsonSerializer<PedidoItem> {

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
}

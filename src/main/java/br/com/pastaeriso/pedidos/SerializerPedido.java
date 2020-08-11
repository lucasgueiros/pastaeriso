package br.com.pastaeriso.pedidos;

import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.JsonObject;
import com.google.gson.JsonNull;
import java.lang.reflect.Type;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.time.format.DateTimeFormatter;
import br.com.pastaeriso.pedidos.pedidoItens.SerializerPedidoItem;
import br.com.pastaeriso.pedidos.pedidoItens.PedidoItem;
import java.math.BigDecimal;

public class SerializerPedido implements JsonSerializer<Pedido> {

  public JsonElement serialize(Pedido pedido, Type type,
      JsonSerializationContext jsonSerializationContext)
  {
    if(pedido == null ) return JsonNull.INSTANCE;
    Gson gson = new GsonBuilder()
                    .registerTypeAdapter(PedidoItem.class, new SerializerPedidoItem())
                    .serializeNulls()
                    .create();
    JsonObject object = new JsonObject();
    if(pedido.getId() != null)
      object.addProperty("id",pedido.getId());
    else
      object.addProperty("id",0);

    if(pedido.getCliente() != null)
      object.add("cliente",gson.toJsonTree(pedido.getCliente()));
    else
      object.addProperty("cliente","");

    if(pedido.getEnderecoEntrega() != null)
      object.add("enderecoEntrega",gson.toJsonTree(pedido.getEnderecoEntrega()));
    else
      object.addProperty("enderecoEntrega","");

    if(pedido.getTrocoPara() != null)
      object.addProperty("trocoPara",pedido.getTrocoPara());
    else
      object.addProperty("trocoPara",0);

    if(pedido.getDatahoraEntrega() != null){
      object.addProperty("datahoraEntrega",pedido.getDatahoraEntrega().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
      object.addProperty("horaEntrega",pedido.getDatahoraEntrega().format(DateTimeFormatter.ofPattern("HH:mm")));
      object.addProperty("dataEntrega",pedido.getDatahoraEntrega().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
    } else {
      object.addProperty("datahoraEntrega","");
      object.addProperty("datahoraEntrega","");
      object.addProperty("datahoraEntrega","");
    }

    if(pedido.getDatahoraFeito() != null){
      object.addProperty("datahoraFeito",pedido.getDatahoraFeito().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
    } else {
      object.addProperty("datahoraFeito","");
    }

    if(pedido.getItens() != null)
      object.add("itens",gson.toJsonTree(pedido.getItens()));
    else
      object.addProperty("itens","");

    BigDecimal total = pedido.getTotal();
    if(total != null)
      object.addProperty("total",total.doubleValue());
    else
      object.addProperty("total",0);

    BigDecimal troco = pedido.getTroco();
    if(troco != null)
      object.addProperty("troco",troco.doubleValue());
    else
      object.addProperty("troco",0);

    if(pedido.getFormaDePagamento() != null)
      object.addProperty("formaDePagamento",pedido.getFormaDePagamento().toString());
    else
      object.addProperty("formaDePagamento","");

    if(pedido.getComentarios() != null)
      object.addProperty("comentarios",pedido.getComentarios());
    else
      object.addProperty("comentarios","");
    return object;
  }

}

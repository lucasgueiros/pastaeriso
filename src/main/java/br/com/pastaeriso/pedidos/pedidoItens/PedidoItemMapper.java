package br.com.pastaeriso.pedidos.pedidoItens;

import java.util.List;

public interface PedidoItemMapper {
  public List<PedidoItem> selectPedidoItensByPedidoId(Integer pedidoId);
}

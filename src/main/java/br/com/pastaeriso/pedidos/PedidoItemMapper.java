package br.com.pastaeriso.pedidos;

public interface PedidoItemMapper {
  public List<PedidoItem> selectPedidoItensByPedidoId(Integer pedidoId);
}

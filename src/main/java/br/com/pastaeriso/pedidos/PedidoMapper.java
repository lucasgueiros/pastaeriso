package br.com.pastaeriso.pedidos;

import java.util.List;
import java.time.LocalDate;
import java.lang.Integer;

public interface PedidoMapper {

	public List<Pedido> selectPedidos();

	public List<Pedido> selectPedidosPorData(LocalDate data);

	public Pedido selectPedidoPorId(Integer id);

}

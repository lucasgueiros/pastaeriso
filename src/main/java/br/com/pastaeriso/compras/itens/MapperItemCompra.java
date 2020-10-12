package br.com.pastaeriso.compras.itens;

import java.util.List;

public interface MapperItemCompra {
  public List<ItemCompra> selectCompraItemPorCompraId(Integer compraId);
}

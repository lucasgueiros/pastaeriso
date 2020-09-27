package br.com.pastaeriso.compras;

import java.util.List;

public interface MapperItemCompra {
  public List<ItemCompra> selectCompraItemPorCompraId(Integer compraId);
}

package br.com.pastaeriso.compras;

import java.util.List;

public interface MapperCompra {

  public List<Compra> selectCompras();

  public Danfe selectDanfesPorId(Integer id);

}

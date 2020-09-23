package br.com.pastaeriso.insumos.unidades;
import java.util.List;
public interface MapperUnidade {
  public Unidade selectUnidadeById(Integer id);
  public List<UnidadeProporcao> selectUnidadesProporcaoByUndidadeId(Integer id);
}

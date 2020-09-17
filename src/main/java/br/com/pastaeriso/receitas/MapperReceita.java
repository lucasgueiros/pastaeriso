package br.com.pastaeriso.receitas;

import java.util.List;
import br.com.pastaeriso.insumos.InsumoQuantidade;

public interface MapperReceita {
  public List<Receita> selectReceitas();
  public Receita selectReceitaPorId(Integer id);
  public List<InsumoQuantidade> selectReceitaInsumoQuantidadePorReceitaId(Integer receita_id);
  public List<String> selectReceitaEtapasPorReceitaId(Integer receita_id);
  public List<String> selectReceitasNomes();
}

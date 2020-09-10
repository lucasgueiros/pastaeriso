package br.com.pastaeriso.receitas;

import java.util.List;

public interface MapperReceita {
  public List<Receita> selectReceitas();
  public List<ReceitaInsumo> selectReceitaInsumosPorReceitaId(Integer receita_id);
  public List<String> selectReceitaEtapasPorReceitaId(Integer receita_id);
  public List<String> selectReceitasNomes();
}

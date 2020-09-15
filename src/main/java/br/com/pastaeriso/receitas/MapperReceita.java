package br.com.pastaeriso.receitas;

import java.util.List;

public interface MapperReceita {
  public List<Receita> selectReceitas();
  public Receita selectReceitaPorId(Integer id);
  public List<ReceitaInsumo> selectReceitaInsumosPorReceitaId(Integer receita_id);
  public List<String> selectReceitaEtapasPorReceitaId(Integer receita_id);
  public List<String> selectReceitasNomes();
}

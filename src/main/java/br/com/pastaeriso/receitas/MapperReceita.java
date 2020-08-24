package br.com.pastaeriso.receitas;

public interface MapperReceita {
  public List<Receita> selectReceitas();
  public List<ReceitaInsumo> selectReceitaInsumosPorReceitaId(Integer receita_id);
  public List<String> selectReceitaEtapasPorReceitaId(Integer receita_id);
}

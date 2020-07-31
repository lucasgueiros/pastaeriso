package br.com.pastaeriso.produtos;

public interface ProdutoMapper {
  public List<ProdutoPreco> selectProdutoPrecosByProdutoId (Integer id);
  public List<Produtos> selectProdutos();
}

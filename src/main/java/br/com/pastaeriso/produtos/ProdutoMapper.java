package br.com.pastaeriso.produtos;

import java.util.List;

public interface ProdutoMapper {
  public List<ProdutoPreco> selectProdutoPrecosByProdutoId (Integer id);
  public List<Produto> selectProdutos();
  public Produto selectProdutoPorNome(String nome);
  public List<ProdutoInsumoQuantidade> selectProdutoInsumoQuantidadeByProdutoId(Integer id);
}

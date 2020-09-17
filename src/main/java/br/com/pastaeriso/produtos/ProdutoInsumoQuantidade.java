package br.com.pastaeriso.produtos;

import br.com.pastaeriso.insumos.InsumoQuantidade;

public class ProdutoInsumoQuantidade {
  private InsumoQuantidade insumoQuantidade;
  private boolean receita;

  // GENERATED CODE

	/**
	* Default empty ProdutoInsumoQuantidade constructor
	*/
	public ProdutoInsumoQuantidade() {
		super();
	}

	/**
	* Default ProdutoInsumoQuantidade constructor
	*/
	public ProdutoInsumoQuantidade(InsumoQuantidade insumoQuantidade, boolean receita) {
		super();
		this.insumoQuantidade = insumoQuantidade;
		this.receita = receita;
	}

	/**
	* Returns value of insumoQuantidade
	* @return
	*/
	public InsumoQuantidade getInsumoQuantidade() {
		return insumoQuantidade;
	}

	/**
	* Sets new value of insumoQuantidade
	* @param
	*/
	public void setInsumoQuantidade(InsumoQuantidade insumoQuantidade) {
		this.insumoQuantidade = insumoQuantidade;
	}

	/**
	* Returns value of receita
	* @return
	*/
	public boolean isReceita() {
		return receita;
	}

	/**
	* Sets new value of receita
	* @param
	*/
	public void setReceita(boolean receita) {
		this.receita = receita;
	}
}

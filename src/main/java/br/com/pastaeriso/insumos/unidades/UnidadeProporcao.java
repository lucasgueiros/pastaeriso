package br.com.pastaeriso.insumos.unidades;

import java.math.BigDecimal;

public class UnidadeProporcao {
  private Unidade unidade;
  private BigDecimal proporcao;


  // generated code

	/**
	* Default empty UnidadeProporcao constructor
	*/
	public UnidadeProporcao() {
		super();
	}

	/**
	* Default UnidadeProporcao constructor
	*/
	public UnidadeProporcao(Unidade unidade, BigDecimal proporcao) {
		super();
		this.unidade = unidade;
		this.proporcao = proporcao;
	}

	/**
	* Returns value of unidade
	* @return
	*/
	public Unidade getUnidade() {
		return unidade;
	}

	/**
	* Sets new value of unidade
	* @param
	*/
	public void setUnidade(Unidade unidade) {
		this.unidade = unidade;
	}

	/**
	* Returns value of proporcao
	* @return
	*/
	public BigDecimal getProporcao() {
		return proporcao;
	}

	/**
	* Sets new value of proporcao
	* @param
	*/
	public void setProporcao(BigDecimal proporcao) {
		this.proporcao = proporcao;
	}
}

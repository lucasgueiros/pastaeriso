package br.com.pastaeriso.compras.itens;

import java.math.BigDecimal;
import br.com.pastaeriso.estoque.MovimentacaoEstoque;

public class ItemCompra {

  private Integer id;
  private String marca;
  private MovimentacaoEstoque movimentacao;
  private BigDecimal valor;
  private String descricao;
  private Integer codigoProduto;
  private String nomeProduto;


	/**
	* Default empty ItemCompra constructor
	*/
	public ItemCompra() {
		super();
	}

	/**
	* Default ItemCompra constructor
	*/
	public ItemCompra(Integer id, String marca, MovimentacaoEstoque movimentacao, BigDecimal valor, String descricao, Integer codigoProduto, String nomeProduto) {
		super();
		this.id = id;
		this.marca = marca;
		this.movimentacao = movimentacao;
		this.valor = valor;
		this.descricao = descricao;
		this.codigoProduto = codigoProduto;
		this.nomeProduto = nomeProduto;
	}

	/**
	* Returns value of id
	* @return
	*/
	public Integer getId() {
		return id;
	}

	/**
	* Sets new value of id
	* @param
	*/
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	* Returns value of marca
	* @return
	*/
	public String getMarca() {
		return marca;
	}

	/**
	* Sets new value of marca
	* @param
	*/
	public void setMarca(String marca) {
		this.marca = marca;
	}

	/**
	* Returns value of movimentacao
	* @return
	*/
	public MovimentacaoEstoque getMovimentacao() {
		return movimentacao;
	}

	/**
	* Sets new value of movimentacao
	* @param
	*/
	public void setMovimentacao(MovimentacaoEstoque movimentacao) {
		this.movimentacao = movimentacao;
	}

	/**
	* Returns value of valor
	* @return
	*/
	public BigDecimal getValor() {
		return valor;
	}

	/**
	* Sets new value of valor
	* @param
	*/
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	/**
	* Returns value of descricao
	* @return
	*/
	public String getDescricao() {
		return descricao;
	}

	/**
	* Sets new value of descricao
	* @param
	*/
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	* Returns value of codigoProduto
	* @return
	*/
	public Integer getCodigoProduto() {
		return codigoProduto;
	}

	/**
	* Sets new value of codigoProduto
	* @param
	*/
	public void setCodigoProduto(Integer codigoProduto) {
		this.codigoProduto = codigoProduto;
	}

	/**
	* Returns value of nomeProduto
	* @return
	*/
	public String getNomeProduto() {
		return nomeProduto;
	}

	/**
	* Sets new value of nomeProduto
	* @param
	*/
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	/**
	* Create string representation of ItemCompra for printing
	* @return
	*/
	@Override
	public String toString() {
		return "ItemCompra [id=" + id + ", marca=" + marca + ", movimentacao=" + movimentacao + ", valor=" + valor + ", descricao=" + descricao + ", codigoProduto=" + codigoProduto + ", nomeProduto=" + nomeProduto + "]";
	}
}

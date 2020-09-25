package br.com.pastaeriso.compras;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import br.com.pastaeriso.fornecedores.Fornecedor;
import br.com.pastaeriso.transacoes.Transacao;

public class Compra {

  private Integer id;
  private Fornecedor fornecedor;
  private LocalDateTime datahora;
  private Danfe danfe;
  private Transacao transacao;

  private BigDecimal valorExtra;
  private BigDecimal totalTributos;
  private BigDecimal totalFrete;
  private BigDecimal totalSeguro;
  private BigDecimal totalDesconto;
  private BigDecimal total;



	/**
	* Default empty Compra constructor
	*/
	public Compra() {
		super();
	}

	/**
	* Default Compra constructor
	*/
	public Compra(Integer id, Fornecedor fornecedor, LocalDateTime datahora, Danfe danfe, Transacao transacao, BigDecimal valorExtra, BigDecimal totalTributos, BigDecimal totalFrete, BigDecimal totalSeguro, BigDecimal totalDesconto, BigDecimal total) {
		super();
		this.id = id;
		this.fornecedor = fornecedor;
		this.datahora = datahora;
		this.danfe = danfe;
		this.transacao = transacao;
		this.valorExtra = valorExtra;
		this.totalTributos = totalTributos;
		this.totalFrete = totalFrete;
		this.totalSeguro = totalSeguro;
		this.totalDesconto = totalDesconto;
		this.total = total;
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
	* Returns value of fornecedor
	* @return
	*/
	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	/**
	* Sets new value of fornecedor
	* @param
	*/
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	/**
	* Returns value of datahora
	* @return
	*/
	public LocalDateTime getDatahora() {
		return datahora;
	}

	/**
	* Sets new value of datahora
	* @param
	*/
	public void setDatahora(LocalDateTime datahora) {
		this.datahora = datahora;
	}

	/**
	* Returns value of danfe
	* @return
	*/
	public Danfe getDanfe() {
		return danfe;
	}

	/**
	* Sets new value of danfe
	* @param
	*/
	public void setDanfe(Danfe danfe) {
		this.danfe = danfe;
	}

	/**
	* Returns value of transacao
	* @return
	*/
	public Transacao getTransacao() {
		return transacao;
	}

	/**
	* Sets new value of transacao
	* @param
	*/
	public void setTransacao(Transacao transacao) {
		this.transacao = transacao;
	}

	/**
	* Returns value of valorExtra
	* @return
	*/
	public BigDecimal getValorExtra() {
		return valorExtra;
	}

	/**
	* Sets new value of valorExtra
	* @param
	*/
	public void setValorExtra(BigDecimal valorExtra) {
		this.valorExtra = valorExtra;
	}

	/**
	* Returns value of totalTributos
	* @return
	*/
	public BigDecimal getTotalTributos() {
		return totalTributos;
	}

	/**
	* Sets new value of totalTributos
	* @param
	*/
	public void setTotalTributos(BigDecimal totalTributos) {
		this.totalTributos = totalTributos;
	}

	/**
	* Returns value of totalFrete
	* @return
	*/
	public BigDecimal getTotalFrete() {
		return totalFrete;
	}

	/**
	* Sets new value of totalFrete
	* @param
	*/
	public void setTotalFrete(BigDecimal totalFrete) {
		this.totalFrete = totalFrete;
	}

	/**
	* Returns value of totalSeguro
	* @return
	*/
	public BigDecimal getTotalSeguro() {
		return totalSeguro;
	}

	/**
	* Sets new value of totalSeguro
	* @param
	*/
	public void setTotalSeguro(BigDecimal totalSeguro) {
		this.totalSeguro = totalSeguro;
	}

	/**
	* Returns value of totalDesconto
	* @return
	*/
	public BigDecimal getTotalDesconto() {
		return totalDesconto;
	}

	/**
	* Sets new value of totalDesconto
	* @param
	*/
	public void setTotalDesconto(BigDecimal totalDesconto) {
		this.totalDesconto = totalDesconto;
	}

	/**
	* Returns value of total
	* @return
	*/
	public BigDecimal getTotal() {
		return total;
	}

	/**
	* Sets new value of total
	* @param
	*/
	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	/**
	* Create string representation of Compra for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Compra [id=" + id + ", fornecedor=" + fornecedor + ", datahora=" + datahora + ", danfe=" + danfe + ", transacao=" + transacao + ", valorExtra=" + valorExtra + ", totalTributos=" + totalTributos + ", totalFrete=" + totalFrete + ", totalSeguro=" + totalSeguro + ", totalDesconto=" + totalDesconto + ", total=" + total + "]";
	}
}

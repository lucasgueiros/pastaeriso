package br.com.pastaeriso.produtos;

import java.math.BigDecimal;
import java.time.LocalDate;

public class ProdutoPreco {

	private Integer id;
	private BigDecimal preco;
	private LocalDate data;

	public ProdutoPreco(Integer id, BigDecimal preco, LocalDate data) {
		this(preco);
		this.data = data;
		this.id = id;
	}

	public ProdutoPreco(BigDecimal preco) {
		this.preco = preco;
	}

	public void setId(Integer id){
		this.id = id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setPreco(BigDecimal preco){
		this.preco = preco;
	}
	public BigDecimal getPreco(){
		return this.preco;
	}
	public void setData(LocalDate data){
		this.data = data;
	}
	public LocalDate getData(){
		return this.data;
	}
}

package br.com.pastaeriso.produtos;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ProdutoPreco {
	
	private Integer id;
	private BigDecimal preco;
	private LocalDateTime data;
	
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
	public void setData(LocalDateTime data){
		this.data = data;
	}
	public LocalDateTime getData(){
		return this.data;
	}
}
package br.com.pastaeriso.pedidos;

import java.math.BigDecimal;
import br.com.pastaeriso.produtos.Produto;
import java.time.LocalDateTime;

public class PedidoItem {

	private Integer id;
	private Produto produto;
	private BigDecimal preco; // preco do produto no momento da compra
	private BigDecimal quantidade;
	private String comentarios;
	private LocalDateTime data;

	public PedidoItem(Integer id, BigDecimal quantidade) {
		this.id = id;
		this.quantidade = quantidade;
	}

	public PedidoItem(Produto produto, BigDecimal quantidade) {
		this.produto = produto;
		this.quantidade = quantidade;
	}
	public void setId(Integer id){
		this.id = id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setProduto(Produto produto){
		this.produto = produto;
	}
	public Produto getProduto(){
		return this.produto;
	}
	public void setPreco(BigDecimal preco){
		this.preco = preco;
	}
	public BigDecimal getPreco(){
		return this.preco;
	}
	public void setQuantidadeo(BigDecimal quantidade){
		this.quantidade = quantidade;
	}
	public BigDecimal getQuantidade(){
		return this.quantidade;
	}
	public void setComentarios(String comentarios){
		this.comentarios = comentarios;
	}
	public String getComentarios(){
		return this.comentarios;
	}
	public void setData(LocalDateTime data){
		this.data = data;
	}
	public LocalDateTime getData(){
		return this.data;
	}
}

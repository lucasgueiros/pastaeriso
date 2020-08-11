package br.com.pastaeriso.pedidos.pedidoItens;

import java.math.BigDecimal;
import br.com.pastaeriso.produtos.Produto;
import java.time.LocalDate;

public class PedidoItem {

	private Integer id;
	private Produto produto;
	private BigDecimal quantidade;
	private String comentarios;
	private LocalDate data;

	public PedidoItem(){}
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
	public void setQuantidade(BigDecimal quantidade){
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
	public void setData(LocalDate data) {
		this.data = data;
	}
	public LocalDate getData() {
		return this.data;
	}
	public BigDecimal getSubtotal() {
		if(this.produto == null || this.quantidade == null || this.data == null)
			return new BigDecimal(0);
		return this.produto.getPreco(this.data).multiply(this.quantidade);
	}
	public String toString(){
		String r = "";
		if(produto != null )
			r += "Produto: " + produto;
		if(quantidade != null)
			r += ", Quantidade: " + quantidade;
		if(comentarios != null)
			r += ", Comentarios: " + comentarios;
		BigDecimal subtotal = this.getSubtotal();
		if(subtotal != null)
			r += ", Subtotal: " + subtotal;
		BigDecimal preco = this.produto.getPreco(this.data);
		if(preco != null)
			r += ", Preco: " + preco;
		if(data != null)
			r += ", Data: " + this.data;
		return r;
	}
}

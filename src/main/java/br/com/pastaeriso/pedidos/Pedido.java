package br.com.pastaeriso.pedidos;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.LinkedList;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.enderecos.Endereco;
import br.com.pastaeriso.pedidos.pedidoItens.PedidoItem;
import br.com.pastaeriso.produtos.Produto;
import br.com.pastaeriso.produtos.ProdutoPreco;

public class Pedido {
	private Integer id;
	private Cliente cliente;
	private Endereco enderecoEntrega;
	private BigDecimal trocoPara;
	private LocalDateTime datahoraEntrega;
	private LocalDateTime datahoraFeito;
	private List<PedidoItem> itens;
	private FormaDePagamento formaDePagamento;
	private String comentarios;

	public Pedido(){
	}

	public Pedido(Integer id){
		this.id=id;
	}

	public Pedido(Cliente cliente) {
		this.cliente = cliente;
		this.itens = new LinkedList<PedidoItem>();
	}

	public Pedido(Integer id, Cliente cliente) {
		this(cliente);
		this.id = id;
	}

	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public Cliente getCliente(){
		return cliente;
	}
	public void setCliente (Cliente cliente) {
		this.cliente = cliente;
	}
	public BigDecimal getTrocoPara(){
		return trocoPara;
	}
	public void setTrocoPara(BigDecimal trocoPara) {
		this.trocoPara = trocoPara;
	}
	public LocalDateTime getDatahoraEntrega() {
		return datahoraEntrega;
	}
	public void setDatahoraEntrega (LocalDateTime datahoraEntrega) {
		this.datahoraEntrega = datahoraEntrega;
	}
	public List<PedidoItem> getItens(){
		return this.itens;
	}
	public void setItens(List<PedidoItem> itens){
		this.itens = itens;
		updateItensData();
	}
	private void updateItensData() {
		if(this.datahoraFeito != null && this.itens != null){
			for(PedidoItem item : this.itens) {
				item.setData(this.datahoraFeito.toLocalDate());
			}
		}
	}
	public LocalDate getDataEntrega(){
		return this.datahoraEntrega.toLocalDate();
	}
	public LocalTime getHorarioEntrega(){
		return this.datahoraEntrega.toLocalTime();
	}
	public void setEnderecoEntrega(Endereco enderecoEntrega) {
		this.enderecoEntrega = enderecoEntrega;
	}
	public Endereco getEnderecoEntrega(){
		return this.enderecoEntrega;
	}
	public boolean hasEnderecoEntrega() {
		return enderecoEntrega != null;
	}
	public BigDecimal getTotal() {
		updateItensData();
		BigDecimal total = new BigDecimal(0);
		for(PedidoItem item : itens) {
			total = total.add(item.getSubtotal());
		}
		return total;
	}
	public BigDecimal getTroco() {
		if(trocoPara == null) {
			return new BigDecimal(0);
		}
		return trocoPara.subtract(this.getTotal());
	}
	public FormaDePagamento getFormaDePagamento() {
		return formaDePagamento;
	}
	public void setFormaDePagamento(FormaDePagamento formaDePagamento) {
		this.formaDePagamento = formaDePagamento;
	}
	public LocalDateTime getDatahoraFeito () {
		return datahoraFeito;
	}
	public void setDatahoraFeito(LocalDateTime datahoraFeito) {
		this.datahoraFeito = datahoraFeito;
		updateItensData();
	}
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}
	public String getComentarios() {
		return this.comentarios;
	}
	public String toString() {
		updateItensData();
		String r = "";
		if(id != null)
		r += "Id: " + id;
		if(cliente != null)
		r += "\nCliente: " + cliente;
		if(enderecoEntrega != null)
		r += "\nEndereco de entrega: " + enderecoEntrega;
		if(trocoPara != null)
		r += "\nTroco para: " + trocoPara;
		if(datahoraEntrega != null)
			r += "\nData e hora de entrega: " + datahoraEntrega;
		if(datahoraFeito != null)
			r += "\nData e hora em que foi feito: " + datahoraFeito;
		if(itens != null)
			r += "\nItens:\n" + itens.toString().replace(",","\n    ");
		else
			r += "null";
		r += "\nTotal: " + getTotal();
		if(formaDePagamento != null)
			r += "\nForma de pagamento: " + formaDePagamento;
		r += "\nTroco: " + this.getTroco();
		if(comentarios != null)
			r += "\nComentarios: " + comentarios;
		return r;
	}
}

package br.com.pastaeriso.pedidos;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;

public class Pedido {
	private Integer id;
	private String cliente;
	private String contato;
	private BigDecimal trocoPara;
	private LocalTime horarioEntrega;
	private LocalDate dataEntrega;
	private List<PedidoItem> itens;
	
	public Pedido(String cliente, String contato) {
		this.cliente = cliente;
		this.contato = contato;
		this.itens = new LinkedList<PedidoItem>();
	}
	
	public Pedido(Integer id, String cliente, String contato) {
		this(cliente,contato);
		this.id = id;
	}
	
	public Integer getId(){
		return id;
	}
	public void setId (int id) {
		this.id = id;
	}
	public String getCliente(){
		return cliente;
	}
	public void setCliente (String cliente) {
		this.cliente = cliente;
	}
	public String getContato(){
		return contato;
	}
	public void setContato (String contato) {
		this.contato = contato;
	}
	public BigDecimal getTrocoPara(){
		return trocoPara;
	}
	public void setTrocoPara(BigDecimal trocoPara) {
		this.trocoPara = trocoPara;
	}
	public LocalTime getHorarioEntrega() {
		return horarioEntrega;
	}
	public void setHorarioEntrega (LocalTime horarioEntrega) {
		this.horarioEntrega = horarioEntrega;
	}
	public LocalDate getDataEntrega() {
		return dataEntrega;
	}
	public void setDataEntrega (LocalDate dataEntrega) {
		this.dataEntrega = dataEntrega;
	}
	public List<PedidoItem> getItens(){
		return this.itens;
	}
	public void setItens(List<PedidoItem> itens){
		this.itens = itens;
	}
}
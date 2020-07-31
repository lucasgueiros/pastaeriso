package br.com.pastaeriso.pedidos;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.LinkedList;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.enderecos.Endereco;

public class Pedido {
	private Integer id;
	private Cliente cliente;
	private Endereco enderecoEntrega;
	private BigDecimal trocoPara;
	private LocalDateTime horarioEntrega;
	private List<PedidoItem> itens;
	
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
	public LocalDateTime getHorarioEntrega() {
		return horarioEntrega;
	}
	public void setHorarioEntrega (LocalDateTime horarioEntrega) {
		this.horarioEntrega = horarioEntrega;
	}
	public List<PedidoItem> getItens(){
		return this.itens;
	}
	public void setItens(List<PedidoItem> itens){
		this.itens = itens;
	}
	public LocalDate getDataEntrega(){
		return this.horarioEntrega.toLocalDate();
	}
	public LocalTime getHorarioSomenteEntrega(){
		return this.horarioEntrega.toLocalTime();
	}
	public void setEnderecoEntrega(Endereco enderecoEntrega) {
		this.enderecoEntrega = enderecoEntrega;
	}
	public Endereco getEnderecoEntrega(){
		return this.enderecoEntrega;
	}
}
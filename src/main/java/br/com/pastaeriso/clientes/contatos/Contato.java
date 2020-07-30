package br.com.pastaeriso.clientes.contatos;

public class Contato{
	
	private Integer id;
	private FormaDeContato forma;
	private String contato;
	
	public Contato(FormaDeContato forma, String contato) {
		this.contato = contato;
		this.forma = forma;
	}
	
	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public void setForma (FormaDeContato forma) {
		this.forma = forma;
	}
	public FormaDeContato getForma(){
		return this.forma;
	}
	public void setContato(String contato) {
		this.contato = contato;
	}
	public String getContato(){
		return this.contato;
	}
	
}
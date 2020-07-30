package br.com.pastaeriso.clientes;

public class FormaDeContato {
	
	private Integer id;
	private String forma;
	
	public FormaDeContato (String forma) {
		this.forma = forma;
	}
	
	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public String getForma(){
		return this.forma;
	}
	public void setForma (String forma) {
		this.forma = forma;
	}
	
}
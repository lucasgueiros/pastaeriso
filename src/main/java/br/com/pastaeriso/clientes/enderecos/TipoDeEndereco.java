package br.com.pastaeriso.clientes.enderecos;

public class TipoDeEndereco {

	private Integer id;
	private String tipo;

	public TipoDeEndereco () {}

	public TipoDeEndereco (Integer id, String tipo) {
		this(tipo);
		this.id = id;
	}
	public TipoDeEndereco (String tipo) {
		this.tipo = tipo;
	}
	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public String getTipo(){
		return this.tipo;
	}
	public void setTipo (String tipo) {
		this.tipo = tipo;
	}
}

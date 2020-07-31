package br.com.pastaeriso.clientes.enderecos;

public class Endereco {

	private Integer id;
	private String rua;
	private String numero;
	private String bairro;
	private String complemento;
	private String pontoDeReferencia;
	private String comentarios;
	private TipoDeEndereco tipo;

	public Endereco (Integer id, String rua, String numero, String bairro) {
		this(rua,numero,bairro);
		this.id=id;
	}

	public Endereco (String rua, String numero, String bairro) {
		this.rua = rua;
		this.numero = numero;
		this.bairro = bairro;
	}

	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public String getRua(){
		return rua;
	}
	public void setRua (String bairro) {
		this.bairro = bairro;
	}
	public String getBairro(){
		return bairro;
	}
	public void setBairro (String bairro) {
		this.bairro = bairro;
	}
	public String getNumero(){
		return numero;
	}
	public void setNumero (String numero) {
		this.numero = numero;
	}
	public String getComplemento(){
		return complemento;
	}
	public void setComplemento (String complemento) {
		this.complemento= complemento;
	}
	public String getPontoDeReferencia(){
		return pontoDeReferencia;
	}
	public void setPontoDeReferencia (String pontoDeReferencia) {
		this.pontoDeReferencia = pontoDeReferencia;
	}
	public String getComentarios(){
		return comentarios;
	}
	public void setComentarios (String comentarios) {
		this.comentarios = comentarios;
	}
	public TipoDeEndereco getTipo(){
		return tipo;
	}
	public void setTipo (TipoDeEndereco tipo) {
		this.tipo = tipo;
	}
	@Override
	public String toString(){
		return rua + ", " + numero + ", " + bairro + ". " + complemento;
	}

}

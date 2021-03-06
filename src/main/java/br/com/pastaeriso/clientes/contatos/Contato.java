package br.com.pastaeriso.clientes.contatos;

public class Contato{

	private Integer id;
	private FormaDeContato forma;
	private String contato;
	private String nome;

	public Contato() {}

	public Contato(Integer id, String contato) {
		this.id=id;
		this.contato = contato;
	}

	public Contato(Integer id, FormaDeContato forma, String contato) {
		this(forma,contato);
		this.id=id;
	}

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
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	public String toString() {
		String r = "(";
		if(id != null) {
			r += id + ", ";
		}
		if(nome != null) {
			r += nome + ", ";
		}
		if(contato != null){
			r += contato + ", ";
		}
		if(forma != null) {
			r += forma;
		}
		r += ")";
		return r;
	}

}

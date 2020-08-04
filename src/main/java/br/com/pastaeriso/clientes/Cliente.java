package br.com.pastaeriso.clientes;

import java.util.List;
import java.util.LinkedList;
import br.com.pastaeriso.clientes.enderecos.Endereco;
import br.com.pastaeriso.clientes.contatos.Contato;

public class Cliente {

	private Integer id;
	private String nome;
	private List<Endereco> enderecos;
	private List<Contato> contatos;

	public Cliente(){}

	public Cliente(Integer id, String nome) {
		this(nome);
		this.id = id;
	}

	public Cliente(String nome) {
		this.nome = nome;
		this.enderecos = new LinkedList<Endereco>();
		this.contatos = new LinkedList<Contato>();
	}

	public Integer getId(){
		return id;
	}
	public void setId (Integer id) {
		this.id = id;
	}
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	public List<Endereco> getEnderecos() {
		return this.enderecos;
	}
	public void setContatos(List<Contato> contatos) {
		this.contatos = contatos;
	}
	public List<Contato> getContatos() {
		return this.contatos;
	}
	public String toString(){
		String r = "cliente";
		return r;
	}
}

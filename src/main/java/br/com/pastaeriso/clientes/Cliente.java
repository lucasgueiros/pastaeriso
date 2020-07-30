package br.com.pastaeriso.clientes;

import java.util.List;
import java.util.LinkedList;

public class Cliente {
	
	private Integer id;
	private String nome;
	private List<Endereco> enderecos;
	private List<Contato> contatos;
	
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
}
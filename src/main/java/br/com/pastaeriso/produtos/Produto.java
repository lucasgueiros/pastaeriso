package br.com.pastaeriso.produtos;

import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;
public class Produto{
	
	private Integer id;
	private String nome;
	private LocalDate data;
	private String descricao;
	private String comentario;
	private List<ProdutoPreco> precos;
	
	public Produto(String nome, LocalDate data) {
		this.data = data;
		this.nome = nome;
		this.precos = new LinkedList<ProdutoPreco>();
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	public void setComentarios(String comentario){
		this.comentario = comentario;
	}
	public String getComentarios(){
		return this.comentario;
	}
	public void setData(LocalDate data){
		this.data = data;
	}
	public LocalDate getData(){
		return this.data;
	}
	public void setPrecos(List<ProdutoPreco> precos){
		this.precos = precos;
	}
	public List<ProdutoPreco> getPrecos(){
		return this.precos;
	}
}
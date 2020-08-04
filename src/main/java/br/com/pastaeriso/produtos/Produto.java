package br.com.pastaeriso.produtos;

import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;
public class Produto{

	private Integer id;
	private String nome;
	private LocalDate data;
	private String descricao;
	private String comentarios;
	private List<ProdutoPreco> precos;

	public Produto() {}

	public Produto(Integer id, String nome, LocalDate data) {
		this(nome,data);
		this.id=id;
	}

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
	public void setComentarios(String comentarios){
		this.comentarios = comentarios;
	}
	public String getComentarios(){
		return this.comentarios;
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
	public String toString() {
		String r = "\n(";
		if(nome != null )
			r += nome + ",";
		if(data != null )
			r += data + ",";
		if(descricao != null)
			r+= descricao + ",";
		if(comentarios != null)
			r += comentarios + ",";
		r+= "historico de precos:" + "\n";
		if(precos != null)
			r += this.precos.toString().replace(",","\n        ");
		else
			r += "null";
		return r;

	}
}

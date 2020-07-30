package br.com.pastaeriso.cardapios;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Cardapio{
	
	private Integer id;
	private String nome;
	private String comentarios;
	private List<LocalDate> datas;
	
	public Cardapio(String nome, String comentarios) {
		this.comentarios = comentarios;
		this.nome = nome;
	}
	
	public Cardapio(Integer id, String nome, String comentarios){
		this(nome,comentarios);
		this.id = id;
		this.datas = new ArrayList<LocalDate>();
	}
	
	public String getNome(){
		return nome;
	}
	public String getComentarios(){
		return comentarios;
	}
	public Integer getId(){
		return id;
	}
	public void setNome(String nome){
		this.nome = nome;
	}
	public void setComentarios(String comentarios){
		this.comentarios = comentarios;
	}
	public void setId(Integer id){
		this.id = id;
	}
	
	
}
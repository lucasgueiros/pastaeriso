package br.com.pastaeriso.fornecedores;

import  java.util.List;
import br.com.pastaeriso.clientes.enderecos.Endereco;
import br.com.pastaeriso.clientes.contatos.Contato;

public class Fornecedor{

  private Integer id;
  private String fornecedor;
  private String comentario;
  private String cnpj;
  private List<Endereco> enderecos;
  private List<Contato> contatos;



	/**
	* Default empty Fornecedor constructor
	*/
	public Fornecedor() {
		super();
	}

	/**
	* Default Fornecedor constructor
	*/
	public Fornecedor(Integer id, String fornecedor, String comentario, String cnpj, List<Endereco> enderecos, List<Contato> contatos) {
		super();
		this.id = id;
		this.fornecedor = fornecedor;
		this.comentario = comentario;
		this.cnpj = cnpj;
		this.enderecos = enderecos;
		this.contatos = contatos;
	}

	/**
	* Returns value of id
	* @return
	*/
	public Integer getId() {
		return id;
	}

	/**
	* Sets new value of id
	* @param
	*/
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	* Returns value of fornecedor
	* @return
	*/
	public String getFornecedor() {
		return fornecedor;
	}

	/**
	* Sets new value of fornecedor
	* @param
	*/
	public void setFornecedor(String fornecedor) {
		this.fornecedor = fornecedor;
	}

	/**
	* Returns value of comentario
	* @return
	*/
	public String getComentario() {
		return comentario;
	}

	/**
	* Sets new value of comentario
	* @param
	*/
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	/**
	* Returns value of cnpj
	* @return
	*/
	public String getCnpj() {
		return cnpj;
	}

	/**
	* Sets new value of cnpj
	* @param
	*/
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	/**
	* Returns value of enderecos
	* @return
	*/
	public List<Endereco> getEnderecos() {
		return enderecos;
	}

	/**
	* Sets new value of enderecos
	* @param
	*/
	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	/**
	* Returns value of contatos
	* @return
	*/
	public List<Contato> getContatos() {
		return contatos;
	}

	/**
	* Sets new value of contatos
	* @param
	*/
	public void setContatos(List<Contato> contatos) {
		this.contatos = contatos;
	}

	/**
	* Create string representation of Fornecedor for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Fornecedor [id=" + id + ", fornecedor=" + fornecedor + ", comentario=" + comentario + ", cnpj=" + cnpj + ", enderecos=" + enderecos + ", contatos=" + contatos + "]";
	}
}

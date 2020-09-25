package br.com.pastaeriso.transacoes;

import java.time.LocalDate;
import java.math.BigDecimal;

public class Transacao {

  private Integer id;
  private BigDecimal valor;
  private LocalDate data;
  private TipoDeTransacao tipo;
  private String comentario;


	/**
	* Default empty Transacao constructor
	*/
	public Transacao() {
		super();
	}

	/**
	* Default Transacao constructor
	*/
	public Transacao(Integer id, BigDecimal valor, LocalDate data, TipoDeTransacao tipo, String comentario) {
		super();
		this.id = id;
		this.valor = valor;
		this.data = data;
		this.tipo = tipo;
		this.comentario = comentario;
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
	* Returns value of valor
	* @return
	*/
	public BigDecimal getValor() {
		return valor;
	}

	/**
	* Sets new value of valor
	* @param
	*/
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	/**
	* Returns value of data
	* @return
	*/
	public LocalDate getData() {
		return data;
	}

	/**
	* Sets new value of data
	* @param
	*/
	public void setData(LocalDate data) {
		this.data = data;
	}

	/**
	* Returns value of tipo
	* @return
	*/
	public TipoDeTransacao getTipo() {
		return tipo;
	}

	/**
	* Sets new value of tipo
	* @param
	*/
	public void setTipo(TipoDeTransacao tipo) {
		this.tipo = tipo;
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
	* Create string representation of Transacao for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Transacao [id=" + id + ", valor=" + valor + ", data=" + data + ", tipo=" + tipo + ", comentario=" + comentario + "]";
	}
}

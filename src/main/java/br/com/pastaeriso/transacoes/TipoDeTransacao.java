package br.com.pastaeriso.transacoes;

public class TipoDeTransacao {
  private Integer id;
  private String tipo;


	/**
	* Default empty TipoDeTransacao constructor
	*/
	public TipoDeTransacao() {
		super();
	}

	/**
	* Default TipoDeTransacao constructor
	*/
	public TipoDeTransacao(Integer id, String tipo) {
		super();
		this.id = id;
		this.tipo = tipo;
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
	* Returns value of tipo
	* @return
	*/
	public String getTipo() {
		return tipo;
	}

	/**
	* Sets new value of tipo
	* @param
	*/
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	* Create string representation of TipoDeTransacao for printing
	* @return
	*/
	@Override
	public String toString() {
		return "TipoDeTransacao [id=" + id + ", tipo=" + tipo + "]";
	}
}

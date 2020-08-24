package br.com.pastaeriso.insumos.unidades;

public class Unidade {
  private Integer id;
  private String unidade;




	/**
	* Default empty Unidade constructor
	*/
	public Unidade() {
		super();
	}

	/**
	* Default Unidade constructor
	*/
	public Unidade(Integer id, String unidade) {
		super();
		this.id = id;
		this.unidade = unidade;
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
	* Returns value of unidade
	* @return
	*/
	public String getUnidade() {
		return unidade;
	}

	/**
	* Sets new value of unidade
	* @param
	*/
	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	/**
	* Create string representation of Unidade for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Unidade [id=" + id + ", unidade=" + unidade + "]";
	}
}

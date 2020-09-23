package br.com.pastaeriso.insumos;

import br.com.pastaeriso.insumos.unidades.Unidade;
import br.com.pastaeriso.insumos.unidades.UnidadesNaoEquivalentesException;
import java.math.BigDecimal;

public class Insumo {
  private Integer id;
  private String insumo;
  private Unidade unidade;
  private String comentarios;
  private BigDecimal preco;

  public BigDecimal getCusto(BigDecimal quantidade) throws UnidadesNaoEquivalentesException {
    return getCusto(quantidade,this.unidade);
  }

  public BigDecimal getCusto(BigDecimal quantidade, Unidade unidade) throws UnidadesNaoEquivalentesException {
    if(preco != null) {
      return preco.multiply(quantidade.multiply(this.unidade.getProporcao(unidade)));
    } else {
      return new BigDecimal(0);
    }
  }

	/**
	* Default empty Insumo constructor
	*/
	public Insumo() {
		super();
	}

	/**
	* Default Insumo constructor
	*/
	public Insumo(Integer id, String insumo, Unidade unidade, String comentarios, BigDecimal preco) {
		super();
		this.id = id;
		this.insumo = insumo;
		this.unidade = unidade;
		this.comentarios = comentarios;
		this.preco = preco;
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
	* Returns value of insumo
	* @return
	*/
	public String getInsumo() {
		return insumo;
	}

	/**
	* Sets new value of insumo
	* @param
	*/
	public void setInsumo(String insumo) {
		this.insumo = insumo;
	}

	/**
	* Returns value of unidade
	* @return
	*/
	public Unidade getUnidade() {
		return unidade;
	}

	/**
	* Sets new value of unidade
	* @param
	*/
	public void setUnidade(Unidade unidade) {
		this.unidade = unidade;
	}

	/**
	* Returns value of comentarios
	* @return
	*/
	public String getComentarios() {
		return comentarios;
	}

	/**
	* Sets new value of comentarios
	* @param
	*/
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	/**
	* Returns value of preco
	* @return
	*/
	public BigDecimal getPreco() {
		return preco;
	}

	/**
	* Sets new value of preco
	* @param
	*/
	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}

	/**
	* Create string representation of Insumo for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Insumo [id=" + id + ", insumo=" + insumo + ", unidade=" + unidade + ", comentarios=" + comentarios + ", preco=" + preco + "]";
	}
}

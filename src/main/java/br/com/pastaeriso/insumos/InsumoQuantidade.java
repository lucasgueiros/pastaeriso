package br.com.pastaeriso.insumos;

import br.com.pastaeriso.insumos.unidades.Unidade;
import java.math.BigDecimal;
import br.com.pastaeriso.insumos.unidades.UnidadesNaoEquivalentesException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class InsumoQuantidade {
  static final Logger logger = LogManager.getLogger(InsumoQuantidade.class);

  public Integer id;
  public BigDecimal quantidade;
  public Insumo insumo;
  public Unidade unidade;
  public String comentarios;
  public boolean proporcionado;

  public BigDecimal getCusto() throws UnidadesNaoEquivalentesException {
    return insumo.getCusto(quantidade,unidade);
  }

  public InsumoQuantidade (InsumoQuantidade original, BigDecimal proporcao) {
    super();
		this.id = original.id;
		this.quantidade = original.quantidade.multiply(proporcao);
		this.insumo = original.insumo;
		this.unidade = original.unidade;
		this.comentarios = original.comentarios;
    this.proporcionado = true;
  }

  /**
	* Returns value of comentarios
	* @return
	*/
	public String getComentarios() {
    if(this.comentarios == null)
      return "";
		return comentarios;
	}

  // GENRETED CODE

	/**
	* Default empty ReceitaInsumo constructor
	*/
	public InsumoQuantidade() {
		super();
    this.proporcionado = false;
	}

	/**
	* Default ReceitaInsumo constructor
	*/
	public InsumoQuantidade(Integer id, BigDecimal quantidade, Insumo insumo, Unidade unidade, String comentarios) {
		super();
		this.id = id;
		this.quantidade = quantidade;
		this.insumo = insumo;
		this.unidade = unidade;
		this.comentarios = comentarios;
    this.proporcionado = false;
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
	* Returns value of quantidade
	* @return
	*/
	public BigDecimal getQuantidade() {
		return quantidade;
	}

	/**
	* Sets new value of quantidade
	* @param
	*/
	public void setQuantidade(BigDecimal quantidade) {
		this.quantidade = quantidade;
	}

	/**
	* Returns value of insumo
	* @return
	*/
	public Insumo getInsumo() {
		return insumo;
	}

	/**
	* Sets new value of insumo
	* @param
	*/
	public void setInsumo(Insumo insumo) {
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
	* Sets new value of comentarios
	* @param
	*/
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	/**
	* Create string representation of ReceitaInsumo for printing
	* @return
	*/
	@Override
	public String toString() {
		return "InsumoQuantidade [id=" + id + ", quantidade=" + quantidade + ", insumo=" + insumo + ", unidade=" + unidade + ", comentarios=" + comentarios + "]";
	}
}

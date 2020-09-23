package br.com.pastaeriso.insumos.unidades;

import java.math.BigDecimal;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Unidade {
  static final Logger logger = LogManager.getLogger(Unidade.class);

  private Integer id;
  private String unidade;
  private Map<Unidade,BigDecimal> equivalentes;
  private List<UnidadeProporcao> unidadesProporcoes;

  public BigDecimal getProporcao(Unidade outra) throws UnidadesNaoEquivalentesException {
    logger.traceEntry("this: {} .getProporcao(outra: {}})",this,outra);
    logger.atTrace().log("equivalentes: " +equivalentes)
    logger.atTrace().log("unidadesProporcoes: " +unidadesProporcoes);
    if(this.equivalentes == null ){
      if(this.unidadesProporcoes != null ){
        copiarUnidadesProporcoes();
      } else {
        this.equivalentes = new HashMap<>();
      }
    }
    if(this.equals(outra)) {
      return new BigDecimal(1);
    } else if (this.equivalentes.containsKey(outra)){
      return this.equivalentes.get(outra);
    } else if (outra.equivalentes.containsKey(this)) {
      return outra.equivalentes.get(this);
    } else {
      throw new UnidadesNaoEquivalentesException("unidades nao sao equivalentes: " + this.id + " e " + outra.id);
    }
  }

  public boolean equals(Unidade outra) {
    return this.id == outra.id;
  }

  private void copiarUnidadesProporcoes() {
    this.equivalentes = new HashMap<Unidade,BigDecimal>();
    for(UnidadeProporcao up : this.unidadesProporcoes) {
      this.equivalentes.put(up.getUnidade(),up.getProporcao());
    }
  }

  // generated code


	/**
	* Default empty Unidade constructor
	*/
	public Unidade() {
		super();
	}

	/**
	* Default Unidade constructor
	*/
	public Unidade(Integer id, String unidade, Map<Unidade,BigDecimal> equivalentes, BigDecimal getProporcao) {
		super();
		this.id = id;
		this.unidade = unidade;
		this.equivalentes = equivalentes;
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
	* Returns value of equivalentes
	* @return
	*/
	public Map<Unidade,BigDecimal> getEquivalentes() {
    copiarUnidadesProporcoes();
		return equivalentes;
	}

	/**
	* Sets new value of equivalentes
	* @param
	*/
	public void setEquivalentes(Map<Unidade,BigDecimal> equivalentes) {
		this.equivalentes = equivalentes;
	}

  public void setUnidadesProporcoes(List<UnidadeProporcao> ups){
    this.unidadesProporcoes = ups;
    copiarUnidadesProporcoes();
  }

  public List<UnidadeProporcao> getUnidadesProporcoes() {
    return this.unidadesProporcoes;
  }
	/**
	* Create string representation of Unidade for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Unidade [id=" + id + ", unidade=" + unidade + ", equivalentes=" + equivalentes + "]";
	}
}

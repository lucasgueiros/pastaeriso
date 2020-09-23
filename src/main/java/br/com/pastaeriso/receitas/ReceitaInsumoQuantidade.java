package br.com.pastaeriso.receitas;

import br.com.pastaeriso.insumos.InsumoQuantidade;
import java.math.BigDecimal;
import br.com.pastaeriso.receitas.Receita;
import br.com.pastaeriso.receitas.ReceitaNaoEquivalenteAoInsumoException;
import br.com.pastaeriso.insumos.unidades.UnidadesNaoEquivalentesException;

public class ReceitaInsumoQuantidade {
  private InsumoQuantidade insumoQuantidade;
  private Receita receitaEquivalente;
  private Integer ordem;

  public BigDecimal getCusto() throws UnidadesNaoEquivalentesException,ReceitaNaoEquivalenteAoInsumoException {
    if(receitaEquivalente != null) {
      try {
        return receitaEquivalente.getCusto(insumoQuantidade);
      } catch (ReceitaNaoEquivalenteAoInsumoException e) {
        try {
          return insumoQuantidade.getCusto();
        } catch (UnidadesNaoEquivalentesException e2) {
          throw e;
        }
      }
    } else {
      return insumoQuantidade.getCusto();
    }
  }

  public ReceitaInsumoQuantidade(ReceitaInsumoQuantidade original, BigDecimal proporcao) {
    this.insumoQuantidade = new InsumoQuantidade(original.insumoQuantidade, proporcao);
    this.receitaEquivalente = original.receitaEquivalente;
    this.ordem = original.ordem;
  }

  // GENERATED CODE

	/**
	* Default empty ReceitaInsumoQuantidade constructor
	*/
	public ReceitaInsumoQuantidade() {
		super();
	}

	/**
	* Default ReceitaInsumoQuantidade constructor
	*/
	public ReceitaInsumoQuantidade(InsumoQuantidade insumoQuantidade, Receita receitaEquivalente, Integer ordem) {
		super();
		this.insumoQuantidade = insumoQuantidade;
		this.receitaEquivalente = receitaEquivalente;
    this.ordem = ordem;
	}

	/**
	* Returns value of insumoQuantidade
	* @return
	*/
	public InsumoQuantidade getInsumoQuantidade() {
		return insumoQuantidade;
	}

	/**
	* Sets new value of insumoQuantidade
	* @param
	*/
	public void setInsumoQuantidade(InsumoQuantidade insumoQuantidade) {
		this.insumoQuantidade = insumoQuantidade;
	}

	/**
	* Returns value of receitaEquivalente
	* @return
	*/
	public Receita getReceitaEquivalente() {
		return receitaEquivalente;
	}

	/**
	* Sets new value of receitaEquivalente
	* @param
	*/
	public void setReceitaEquivalente(Receita receitaEquivalente) {
		this.receitaEquivalente = receitaEquivalente;
	}

  public void setOrdem(Integer ordem) {
    this.ordem = ordem;
  }

  public Integer getOrdem() {
    return this.ordem;
  }

  public boolean getProporcionado() {
    return this.insumoQuantidade.proporcionado;
  }

	/**
	* Create string representation of ReceitaInsumoQuantidade for printing
	* @return
	*/
	@Override
	public String toString() {
		return "ReceitaInsumoQuantidade [ordem=" + ordem +"insumoQuantidade=" + insumoQuantidade + ", receitaEquivalente=" + receitaEquivalente + "]";
	}
}

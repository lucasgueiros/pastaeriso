package br.com.pastaeriso.produtos;

import br.com.pastaeriso.insumos.InsumoQuantidade;
import java.math.BigDecimal;
import br.com.pastaeriso.receitas.Receita;
import br.com.pastaeriso.receitas.ReceitaNaoEquivalenteAoInsumoException;
import br.com.pastaeriso.insumos.unidades.UnidadesNaoEquivalentesException;

public class ProdutoInsumoQuantidade {
  private InsumoQuantidade insumoQuantidade;
  private Receita receitaEquivalente;

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

  // GENERATED CODE


	/**
	* Default empty ProdutoInsumoQuantidade constructor
	*/
	public ProdutoInsumoQuantidade() {
		super();
	}

	/**
	* Default ProdutoInsumoQuantidade constructor
	*/
	public ProdutoInsumoQuantidade(InsumoQuantidade insumoQuantidade, Receita receitaEquivalente) {
		super();
		this.insumoQuantidade = insumoQuantidade;
		this.receitaEquivalente = receitaEquivalente;
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
}

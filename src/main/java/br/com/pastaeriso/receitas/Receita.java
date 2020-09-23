package br.com.pastaeriso.receitas;

import java.time.LocalDate;
import br.com.pastaeriso.insumos.Insumo;
import java.util.LinkedList;
import java.util.List;
import br.com.pastaeriso.insumos.unidades.Unidade;
import br.com.pastaeriso.insumos.unidades.UnidadesNaoEquivalentesException;
import java.math.BigDecimal;
import br.com.pastaeriso.insumos.InsumoQuantidade;

public class Receita {

  private Integer id;
  private String nome;
  private LocalDate data;
  private Integer tempoAtivo;
  private Integer tempoTotal;
  private Integer tempoGas;
  private Insumo gas;
  private BigDecimal rendimento;
  private Unidade rendimentoUnidade;
  private String comentarios;
  private List<InsumoQuantidade> ingredientes;
  private List<String> etapas;
  private boolean proporcioanada;
  private Insumo equivalente;

  public BigDecimal getCusto(InsumoQuantidade iq) throws UnidadesNaoEquivalentesException,ReceitaNaoEquivalenteAoInsumoException {
    if(!iq.getInsumo().equals(equivalente)){
      throw new ReceitaNaoEquivalenteAoInsumoException("Esta receita (id = " + this.id + ") nao e equivalente ao insumo (id = " + iq.getInsumo().getId()+ ")") ;
    }
    BigDecimal proporcaoUnidade = rendimentoUnidade.getProporcao(iq.getUnidade());
    BigDecimal quantidade = iq.getQuantidade().multiply(proporcaoUnidade);
    BigDecimal proporcao = quantidade.divide(rendimento);

    BigDecimal custo;
    custo = gas.getCusto(new BigDecimal(tempoGas).multiply(proporcao));
    for(InsumoQuantidade ingrediente : ingredientes) {
      custo = custo.add(new InsumoQuantidade(ingrediente,proporcao).getCusto());
    }
    return custo;
  }

  public Receita(Receita original, BigDecimal rendimento) {
    super();
    this.id = original.id;
		this.nome = original.nome;
		this.data = original.data;
		this.tempoAtivo = original.tempoAtivo;
		this.tempoTotal = original.tempoTotal;
		this.tempoGas = original.tempoGas;
		this.gas = original.gas;
		this.rendimento = rendimento;
		this.rendimentoUnidade = original.rendimentoUnidade;
		this.comentarios = original.comentarios;
    this.equivalente = original.equivalente;

    BigDecimal proporcao = rendimento.divide(original.rendimento);
		this.ingredientes = new LinkedList<>();
    original.ingredientes.forEach(insumoQuantidadeOriginal -> this.ingredientes.add(new InsumoQuantidade(insumoQuantidadeOriginal,proporcao)));
		this.etapas = new LinkedList<>();
    this.etapas.addAll(original.etapas);
    this.proporcioanada = true;
  }

  // GENRETED CODE

	/**
	* Default empty Receita constructor
	*/
	public Receita() {
		super();
    this.proporcioanada = false;
	}

	/**
	* Default Receita constructor
	*/
	public Receita(Integer id, String nome, LocalDate data, Integer tempoAtivo, Integer tempoTotal, Integer tempoGas, Insumo gas, BigDecimal rendimento, Unidade rendimentoUnidade, String comentarios, List<InsumoQuantidade> ingredientes, List<String> etapas, Insumo equivalente) {
		super();
		this.id = id;
		this.nome = nome;
		this.data = data;
		this.tempoAtivo = tempoAtivo;
		this.tempoTotal = tempoTotal;
		this.tempoGas = tempoGas;
		this.gas = gas;
		this.rendimento = rendimento;
		this.rendimentoUnidade = rendimentoUnidade;
		this.comentarios = comentarios;
		this.ingredientes = ingredientes;
		this.etapas = etapas;
    this.proporcioanada = false;
    this.equivalente = equivalente;
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
	* Returns value of nome
	* @return
	*/
	public String getNome() {
		return nome;
	}

	/**
	* Sets new value of nome
	* @param
	*/
	public void setNome(String nome) {
		this.nome = nome;
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
	* Returns value of tempoAtivo
	* @return
	*/
	public Integer getTempoAtivo() {
		return tempoAtivo;
	}

	/**
	* Sets new value of tempoAtivo
	* @param
	*/
	public void setTempoAtivo(Integer tempoAtivo) {
		this.tempoAtivo = tempoAtivo;
	}

	/**
	* Returns value of tempoTotal
	* @return
	*/
	public Integer getTempoTotal() {
		return tempoTotal;
	}

	/**
	* Sets new value of tempoTotal
	* @param
	*/
	public void setTempoTotal(Integer tempoTotal) {
		this.tempoTotal = tempoTotal;
	}

	/**
	* Returns value of tempoGas
	* @return
	*/
	public Integer getTempoGas() {
		return tempoGas;
	}

	/**
	* Sets new value of tempoGas
	* @param
	*/
	public void setTempoGas(Integer tempoGas) {
		this.tempoGas = tempoGas;
	}

	/**
	* Returns value of gas
	* @return
	*/
	public Insumo getGas() {
		return gas;
	}

	/**
	* Sets new value of gas
	* @param
	*/
	public void setGas(Insumo gas) {
		this.gas = gas;
	}

	/**
	* Returns value of rendimento
	* @return
	*/
	public BigDecimal getRendimento() {
		return rendimento;
	}

	/**
	* Sets new value of rendimento
	* @param
	*/
	public void setRendimento(BigDecimal rendimento) {
		this.rendimento = rendimento;
	}

	/**
	* Returns value of rendimentoUnidade
	* @return
	*/
	public Unidade getRendimentoUnidade() {
		return rendimentoUnidade;
	}

	/**
	* Sets new value of rendimentoUnidade
	* @param
	*/
	public void setRendimentoUnidade(Unidade rendimentoUnidade) {
		this.rendimentoUnidade = rendimentoUnidade;
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
	* Returns value of ingredientes
	* @return
	*/
	public List<InsumoQuantidade> getIngredientes() {
		return ingredientes;
	}

	/**
	* Sets new value of ingredientes
	* @param
	*/
	public void setIngredientes(List<InsumoQuantidade> ingredientes) {
		this.ingredientes = ingredientes;
	}

	/**
	* Returns value of etapas
	* @return
	*/
	public List<String> getEtapas() {
		return etapas;
	}

	/**
	* Sets new value of etapas
	* @param
	*/
	public void setEtapas(List<String> etapas) {
		this.etapas = etapas;
	}

  public Insumo getEquivalente() {
    return equivalente;
  }

  public void setEquivalente(Insumo equivalente){
    this.equivalente = equivalente;
  }

	/**
	* Create string representation of Receita for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Receita [id=" + id + ", nome=" + nome + ", data=" + data + ", tempoAtivo=" + tempoAtivo + ", tempoTotal=" + tempoTotal + ", tempoGas=" + tempoGas + ", gas=" + gas + ", rendimento=" + rendimento + ", rendimentoUnidade=" + rendimentoUnidade + ", comentarios=" + comentarios + ", ingredientes=" + ingredientes + ", etapas=" + etapas + "]";
	}
}

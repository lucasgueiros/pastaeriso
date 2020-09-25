package br.com.pastaeriso.estoque;

import java.time.LocalDateTime;
import br.com.pastaeriso.insumos.InsumoQuantidade;

public class MovimentacaoEstoque {

  private Integer id;
  private InsumoQuantidade InsumoQuantidade;
  private LocalDateTime datahora;


	/**
	* Default empty MovimentacaoEstoque constructor
	*/
	public MovimentacaoEstoque() {
		super();
	}

	/**
	* Default MovimentacaoEstoque constructor
	*/
	public MovimentacaoEstoque(Integer id, InsumoQuantidade InsumoQuantidade, LocalDateTime datahora) {
		super();
		this.id = id;
		this.InsumoQuantidade = InsumoQuantidade;
		this.datahora = datahora;
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
	* Returns value of InsumoQuantidade
	* @return
	*/
	public InsumoQuantidade getInsumoQuantidade() {
		return InsumoQuantidade;
	}

	/**
	* Sets new value of InsumoQuantidade
	* @param
	*/
	public void setInsumoQuantidade(InsumoQuantidade InsumoQuantidade) {
		this.InsumoQuantidade = InsumoQuantidade;
	}

	/**
	* Returns value of datahora
	* @return
	*/
	public LocalDateTime getDatahora() {
		return datahora;
	}

	/**
	* Sets new value of datahora
	* @param
	*/
	public void setDatahora(LocalDateTime datahora) {
		this.datahora = datahora;
	}

	/**
	* Create string representation of MovimentacaoEstoque for printing
	* @return
	*/
	@Override
	public String toString() {
		return "MovimentacaoEstoque [id=" + id + ", InsumoQuantidade=" + InsumoQuantidade + ", datahora=" + datahora + "]";
	}
}

package br.com.pastaeriso.receitas;

import br.com.pastaeriso.insumos.Insumo;
import br.com.pastaeriso.insumos.unidades.Unidade;

public class ReceitaInsumo {
  public Integer id;
  public BigDecimal quantidade;
  public Insumo insumo;
  public Unidade unidade;
  public String comentarios;




	/**
	* Default empty ReceitaInsumo constructor
	*/
	public ReceitaInsumo() {
		super();
	}

	/**
	* Default ReceitaInsumo constructor
	*/
	public ReceitaInsumo(Integer id, BigDecimal quantidade, Insumo insumo, Unidade unidade, String comentarios) {
		super();
		this.id = id;
		this.quantidade = quantidade;
		this.insumo = insumo;
		this.unidade = unidade;
		this.comentarios = comentarios;
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
	* Create string representation of ReceitaInsumo for printing
	* @return
	*/
	@Override
	public String toString() {
		return "ReceitaInsumo [id=" + id + ", quantidade=" + quantidade + ", insumo=" + insumo + ", unidade=" + unidade + ", comentarios=" + comentarios + "]";
	}
}

/*
create table receita_insumos(
insumo_id integer references insumos(id) on delete cascade,
receita_id integer references receitas(id) on delete cascade,
ordem integer not null generated always as (select (max(ri.ordem) + 1) from receita_insumos as ri where receita_id = ri.receita_id group by ri.receita_id) stored,
quantidade numeric not null,
unidade integer references unidades(id) on delete restrict null,
comentario text null,
constraint pk_insumos_receita primary key (insumo_id,receita_id),
check (quantidade > 0.0)
);
*/

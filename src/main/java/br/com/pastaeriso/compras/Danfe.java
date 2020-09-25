package br.com.pastaeriso.compras;

import java.io.File;
import java.time.LocalDateTime;

public class Danfe {

  private Integer id;
  private File danfe;
  private String codigoDeAcesso;
  private int codigoUf;
  private LocalDateTime datahoraEmissao;


	/**
	* Default empty Danfe constructor
	*/
	public Danfe() {
		super();
	}

	/**
	* Default Danfe constructor
	*/
	public Danfe(Integer id, File danfe, String codigoDeAcesso, int codigoUf, LocalDateTime datahoraEmissao) {
		super();
		this.id = id;
		this.danfe = danfe;
		this.codigoDeAcesso = codigoDeAcesso;
		this.codigoUf = codigoUf;
		this.datahoraEmissao = datahoraEmissao;
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
	* Returns value of danfe
	* @return
	*/
	public File getDanfe() {
		return danfe;
	}

	/**
	* Sets new value of danfe
	* @param
	*/
	public void setDanfe(File danfe) {
		this.danfe = danfe;
	}

	/**
	* Returns value of codigoDeAcesso
	* @return
	*/
	public String getCodigoDeAcesso() {
		return codigoDeAcesso;
	}

	/**
	* Sets new value of codigoDeAcesso
	* @param
	*/
	public void setCodigoDeAcesso(String codigoDeAcesso) {
		this.codigoDeAcesso = codigoDeAcesso;
	}

	/**
	* Returns value of codigoUf
	* @return
	*/
	public int getCodigoUf() {
		return codigoUf;
	}

	/**
	* Sets new value of codigoUf
	* @param
	*/
	public void setCodigoUf(int codigoUf) {
		this.codigoUf = codigoUf;
	}

	/**
	* Returns value of datahoraEmissao
	* @return
	*/
	public LocalDateTime getDatahoraEmissao() {
		return datahoraEmissao;
	}

	/**
	* Sets new value of datahoraEmissao
	* @param
	*/
	public void setDatahoraEmissao(LocalDateTime datahoraEmissao) {
		this.datahoraEmissao = datahoraEmissao;
	}

	/**
	* Create string representation of Danfe for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Danfe [id=" + id + ", danfe=" + danfe + ", codigoDeAcesso=" + codigoDeAcesso + ", codigoUf=" + codigoUf + ", datahoraEmissao=" + datahoraEmissao + "]";
	}
}

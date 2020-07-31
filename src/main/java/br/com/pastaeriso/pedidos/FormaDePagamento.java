package br.com.pastaeriso.pedidos;

public class FormaDePagamento {
  private Integer id;
  private String forma;

  public FormaDePagamento (Integer id, String forma) {
    this(forma);
    this.id = id;
  }

  public FormaDePagamento (String forma) {
    this.forma = forma;
  }

  public void setForma(String forma) {
    this.forma = forma;
  }
  public String getForma() {
    return forma;
  }
  public void setId (Integer id) {
    this.id=id;
  }
  public Integer getId() {
    return id;
  }
  public String toString () {
    return forma;
  }
}

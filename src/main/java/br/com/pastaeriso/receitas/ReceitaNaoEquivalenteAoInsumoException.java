package br.com.pastaeriso.receitas;

public class ReceitaNaoEquivalenteAoInsumoException extends Exception {
  public ReceitaNaoEquivalenteAoInsumoException(String msg) {
    super(msg);
  }
}

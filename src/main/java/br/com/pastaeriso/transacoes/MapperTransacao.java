package br.com.pastaeriso.transacoes;

public interface MapperTransacao {
  public Transacao getTransacaoPorId(Integer id);
  public TipoDeTransacao getTipoDeTransacoPorId(Integer id);
}

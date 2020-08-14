package br.com.pastaeriso.clientes;

public class ClientePreferencias {
  public Integer clienteId;
  public Integer enderecoId;
  public Integer contatoId;

  public ClientePreferencias(Integer clienteId, Integer enderecoId, Integer contatoId) {
    this.clienteId = clienteId;
    this.enderecoId = enderecoId;
    this.contatoId = contatoId;
  }

  public Integer getClienteId() {
    return clienteId;
  }
  public Integer getEnderecoId() {
    return enderecoId;
  }
  public Integer getContatoId() {
    return contatoId;
  }

}

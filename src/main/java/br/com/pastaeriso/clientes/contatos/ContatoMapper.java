package br.com.pastaeriso.clientes.contatos;

public interface ContatoMapper {
  public FormaDeContato selectFormaDeContatoById(Integer id);
  public List<Contato> selectContatosByClienteId(Integer id);
}

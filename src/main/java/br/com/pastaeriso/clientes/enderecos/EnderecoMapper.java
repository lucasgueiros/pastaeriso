package br.com.pastaeriso.clientes.enderecos;

public interface EnderecoMapper {
	
	public Endereco selectEnderecoById(Integer id);
	public TipoDeEndereco selectTipoDeEnderecoById(Integer id);
	
}
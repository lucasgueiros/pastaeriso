package br.com.pastaeriso.clientes;

import java.util.List;

public interface ClienteMapper {

	public Cliente selectClienteById(Integer id);
	public List<Cliente> selectClientes();
}

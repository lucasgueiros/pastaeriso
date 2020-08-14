package br.com.pastaeriso.clientes;

import java.util.List;
import java.util.HashMap;

public interface ClienteMapper {

	public Cliente selectClienteById(Integer id);
	public List<Cliente> selectClientes();
	public Cliente selectClientePorNome(String nome);
	public Integer insertCliente(String nome);
	public void insertClientePreferencias(ClientePreferencias parameters);
}

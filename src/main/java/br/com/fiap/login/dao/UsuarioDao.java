package br.com.fiap.login.dao;

import br.com.fiap.login.exception.DBException;
import br.com.fiap.login.model.Usuario;

public interface UsuarioDao {
    void cadastrarUsuario(Usuario usuario) throws DBException;
    boolean validarUsuario(Usuario usuario);
    double consultarSaldo(Usuario usuario) throws DBException;
}

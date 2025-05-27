package br.com.fiap.fintech.dao;

import br.com.fiap.fintech.exception.DBException;
import br.com.fiap.fintech.model.Usuario;

public interface UsuarioDao {
    void cadastrarUsuario(Usuario usuario) throws DBException;
    boolean validarUsuario(Usuario usuario);
    double consultarSaldo(Usuario usuario) throws DBException;
}

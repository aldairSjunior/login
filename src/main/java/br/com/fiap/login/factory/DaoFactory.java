package br.com.fiap.login.factory;

import br.com.fiap.login.dao.UsuarioDao;
import br.com.fiap.login.dao.impl.OracleUsuarioDao;

public class DaoFactory {

    public static UsuarioDao getUsuarioDAO(){
        return new OracleUsuarioDao();
    }
}

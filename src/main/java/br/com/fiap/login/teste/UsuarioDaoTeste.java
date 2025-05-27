package br.com.fiap.login.teste;

import br.com.fiap.login.dao.UsuarioDao;
import br.com.fiap.login.exception.DBException;
import br.com.fiap.login.factory.DaoFactory;
import br.com.fiap.login.model.Usuario;

public class UsuarioDaoTeste {
    public static void main(String[] args) {

        UsuarioDao dao = DaoFactory.getUsuarioDAO();

        //Cadastrar um produto
        Usuario usuario = new Usuario(
                0,
                "Aldair Junior",
                "Junior",
                "schmitjunior17@gmail.com",
                "27998590317",
                "14772460705",
                "e10adc3949ba59abbe56e057f20f883e");
        try {
            dao.cadastrarUsuario(usuario);
            System.out.println("Usuario cadastrado.");
        } catch (DBException e) {
            e.printStackTrace();
        }
 }
}

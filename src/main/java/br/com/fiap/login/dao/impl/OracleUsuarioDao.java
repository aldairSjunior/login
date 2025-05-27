package br.com.fiap.login.dao.impl;

import br.com.fiap.login.dao.ConnectionManager;
import br.com.fiap.login.dao.UsuarioDao;
import br.com.fiap.login.exception.DBException;
import br.com.fiap.login.model.Usuario;
import br.com.fiap.login.util.CriptografiaUtils;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleUsuarioDao implements UsuarioDao {

    private Connection conexao;

    @Override
    public void cadastrarUsuario(Usuario usuario) throws DBException {

        PreparedStatement stmt = null;


        conexao = ConnectionManager.getInstance().getConnection();

        String sql = "INSERT INTO T_USUARIO"+
                "(cod_usuario, nm_usuario, apelido, "+
                "ds_email, nr_celular, nr_cpf, ds_senha) "+
                "VALUES(SQ_T_USUARIO.NEXTVAL,?,?,?,?,?,?)";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getApelido());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getCelular());
            stmt.setString(5, usuario.getCpf());
            stmt.setString(6, CriptografiaUtils.criptografar(usuario.getSenha()));

            stmt.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace(); // Log do erro real
            throw new DBException("Erro ao cadastrar: " + e.getMessage());
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            throw new DBException("Erro na criptografia da senha: " + e.getMessage());
    } finally {
            try {
                stmt.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }

    @Override
    public boolean validarUsuario(Usuario usuario) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conexao = ConnectionManager
                    .getInstance()
                    .getConnection();

            String sql = "SELECT * FROM T_USUARIO " +
                    "WHERE ds_email = ? AND ds_senha = ?";

            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            rs = stmt.executeQuery();


            if (rs.next()){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                stmt.close();
                rs.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public double consultarSaldo(Usuario usuario)
            throws DBException {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conexao = ConnectionManager
                    .getInstance()
                    .getConnection();

            String sql = "SELECT saldo FROM T_USUARIO " +
                    "WHERE cod_usuario=?";

            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, usuario.getCodigo());
            rs = stmt.executeQuery();

            if (rs.next()){
                return rs.getDouble("saldo");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao buscar saldo: " + e.getMessage());
        }finally {
            try {
                stmt.close();
                rs.close();
                conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0.0;
    }
}

package br.com.fiap.login.controller;

import br.com.fiap.login.exception.DBException;
import br.com.fiap.login.factory.DaoFactory;

import br.com.fiap.login.dao.UsuarioDao;
import br.com.fiap.login.model.Usuario;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.text.DecimalFormat;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {

    private UsuarioDao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        dao = DaoFactory.getUsuarioDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String acao = req.getParameter("acao");

        switch (acao){
            case "cadastrar":
                cadastrar(req, resp);
                break;
        }
    }

    private void cadastrar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
            String nome = req.getParameter("nome");
            String apelido = req.getParameter("apelido");
            String email = req.getParameter("email");
            String celular = req.getParameter("celular");
            String cpf = req.getParameter("cpf");
            String senha = req.getParameter("senha");

            Usuario usuario = new Usuario(
                    0,
                    nome,
                    apelido,
                    email,
                    celular,
                    cpf,
                    senha);

            try {
                dao.cadastrarUsuario(usuario);
                req.setAttribute("mensagem", "Usuário cadastrado com sucesso");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            } catch (DBException e){
                e.printStackTrace();
                req.setAttribute("erro", "Erro ao cadastrar o usuário");
                req.getRequestDispatcher("cadastro-usuario.jsp").forward(req,resp);
            }

        }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String acao = req.getParameter("acao");

        switch (acao) {
            case "abrir-form-cadastro":
                abrirFormCadastro(req, resp);
                break;
            case "home":
                carregarHome(req, resp);
                break;
        }
    }

    private void abrirFormCadastro(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("cadastro-usuario.jsp").forward(req,resp);
    }
    private void carregarHome(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

//        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        String email = String.valueOf(req.getParameter("email"));
        Usuario usuario = new Usuario(email);

        if(usuario!=null) {
            try {
                double saldo = dao.consultarSaldo(usuario);

                DecimalFormat df = new DecimalFormat("#.##0.00");
                req.setAttribute("saldoFormatado", "R$ " + df.format(saldo));
                req.getRequestDispatcher("home.jsp").forward(req,resp);
            } catch (DBException e) {
                e.printStackTrace();
                req.setAttribute("erro", "Erro ao consultar saldo");
                req.getRequestDispatcher("home.jsp").forward(req,resp);
                throw new RuntimeException(e);
            }
        }else {
            resp.sendRedirect("login.jsp");
        }
    }

}

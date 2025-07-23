package br.com.fiap.login.controller;

import br.com.fiap.login.bo.EmailBo;
import br.com.fiap.login.dao.UsuarioDao;
import br.com.fiap.login.exception.EmailException;
import br.com.fiap.login.factory.DaoFactory;
import br.com.fiap.login.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDao dao;
    private EmailBo bo;

    public LoginServlet() {
        dao = DaoFactory.getUsuarioDAO();
        bo = new EmailBo();
    }

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario(email, senha);

        if (dao.validarUsuario(usuario)) {

            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario.getApelido());
            session.setAttribute("user", email);
            String mensagem =
                    "Um login foi realizado na plataforma Zenith em " + LocalDate.now();
            request.getRequestDispatcher("home.jsp").forward(request, response);
            try {
                bo.enviarEmail(email, "Login Realizado", mensagem);
            } catch (EmailException e) {
                e.printStackTrace();
            }

        }else {
            request.setAttribute("erro", "Usuário e/ou senha inválidos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }
}

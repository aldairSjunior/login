package br.com.fiap.fintech.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        String uri = req.getRequestURI();

        boolean isRecursoPublico = uri.contains("login.jsp") ||
                uri.contains("cadastro-usuario.jsp") ||  // Adiciona página de cadastro
                uri.contains("resources") ||
                uri.contains("css") ||
                uri.contains("js") ||
                uri.contains("images") ||
                uri.contains("login") ||
                uri.contains("usuarios"); // Adiciona servlet de cadastro

        // Verifica se está logado ou é recurso público
        if(isRecursoPublico) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect("login.jsp");
        }


    }
}

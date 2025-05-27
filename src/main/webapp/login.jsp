<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title>Zenith</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.css">
</head>
<body style="background-color: rgba(211, 233, 255, 1);">
<div class="container">
    <img style="width: 20%; margin-left: 40%" class="logo-login" src="./resources/images/logo completa zenith.png" alt="Logo Zenith">
</div>

<div class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
        <div class="toast-body">
            Hello, world! This is a toast message.
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
</div>
<div class="container">
    <div class="mt-3 ms-5 me-5">
        <div style="box-shadow: 0 15px 10px rgba(0, 118, 129, 1);width: 40%; align-items: center; margin-left: 30%; background-color: rgba(0, 118, 129, 0.34); flex-direction: column; padding: 2.5%; border-radius: 15px;" class="card mb-3">
            <div class="card-body">
                <form action="login" method="post">
                    <c:if test="${not empty erro}">
                        <span>
                            ${erro}
                        </span>
                    </c:if>
                    <div class="form-group" style="width: 150%; margin-left: -25%">
                        <label for="id-login">Login</label>
                        <input style="background-color: rgba(0, 118, 129, 1); color: white; font-family: inria-serif; margin-top: 3px" type="text" name="email" id="id-login" class="form-control">
                    </div>

                    <div class="form-group mt-3" style="width: 150%; margin-left: -25%;">
                        <label for="id-senha">Senha</label>
                        <input style=" background-color: rgba(0, 118, 129, 1); color: white; font-family: inria-serif; margin-top: 1px;" type="password" name="senha" id="id-senha" class="form-control">
                    </div>

<%--                    <a style="margin-left: 25%; font-family: inria-serif; " href="">Recuperar Senha</a>--%>
                    <br>
<%--                    <div class="d-flex justify-content-center text-center mt-4 pt-1">--%>
<%--                        <svg class="facebook bi bi-facebook" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 -0.2 16 16" alt="Conta facebook">--%>
<%--                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.5C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>--%>
<%--                        </svg>--%>
<%--                        <svg class="google bi bi-google" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16" alt="Conta google">--%>
<%--                            <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z"/>--%>
<%--                        </svg>--%>
<%--                    </div>--%>
                    <input style="margin-left: 22%; width: 60%" type="submit" value="Login" class="btn btn-primary mt-5">

                </form>
                <div>
                    <p class="mb-0" style="color: rgba(16, 24, 32, 1); margin-top: 2%;">Não tem uma conta? <a href="usuarios?acao=abrir-form-cadastro">Criar conta</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<%@include file="footer.jsp"%>--%>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>

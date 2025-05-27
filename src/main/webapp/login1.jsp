<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">
    <title>Zenith</title>
</head>
<body>
<header>
    <div class="div-logo-login">
        <!-- logo inicial -->
        <img class="logo-login" src="./resources/images/logo completa zenith.png" alt="Logo Zenith">
    </div>
</header>

<!-- email e senha -->
<section class="login">
    <div class="div-login">
        <div class="campo-login" class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Login</label>
            <input style="background-color: rgba(0, 118, 129, 1); color: white; height: 65%; font-family: inria-serif; margin-top: -11px;" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text"></div>
        </div>
        <div class="campo-login" class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Senha</label>
            <input style="background-color: rgba(0, 118, 129, 1); color: white; height: 70%; font-family: inria-serif; margin-top: -11px;" type="password" class="form-control" id="exampleInputPassword1">
        </div>

        <a class="recuperar-senha" href="#recuperar-senha">Recuperar senha</a>

        <div class="d-flex justify-content-center text-center mt-4 pt-1">
            <svg class="facebook bi bi-facebook" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 -0.2 16 16" alt="Conta facebook">
                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.5C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
            </svg>
            <svg class="google bi bi-google" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16" alt="Conta google">
                <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z"/>
            </svg>
        </div>

        <a aria-label="Login" id="botao-login" href="#home" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary" role="button">Login</a>

        <div>
            <p class="mb-0" style="color: rgba(16, 24, 32, 1); margin-top: 2%;">Não tem uma conta? <a class="criar-conta" href="#criar-conta">Criar conta</a>
            </p>
        </div>
    </div>
</section>



<%@include file="footer.jsp"%>
</body>
</html>
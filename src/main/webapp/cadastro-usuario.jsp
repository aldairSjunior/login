<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title>Cadastro de usuário</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.css">
</head>
<body style="background-color: rgba(211, 233, 255, 1);">
<div class="container">
    <div class="mt-5 ms-5 me-5">
        <div class="card mb-3">
            <div class="card-header">
                CADASTRO DE USUARIO
            </div>

            <c:if test = "${not empty mensagem}">
                <div class="alert alert-success ms-2 me-2 mt-2">${mensagem}</div>
            </c:if>

            <c:if test = "${not empty erro}">
                <div class="alert alert-danger ms-2 me-2 mt-2">${erro}</div>
            </c:if>

            <div class="card-body">
                <form action="usuarios?acao=cadastrar" method="post">
                    <div class="form-group">
                        <label for="id-nome">Nome</label>
                        <input type="text" name="nome" id="id-nome" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="id-apelido">Apelido</label>
                        <input type="text" name="apelido" id="id-apelido" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="id-email">Email</label>
                        <input type="text" name="email" id="id-email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="id-celular">Celular</label>
                        <input type="text" name="celular" id="id-celular" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="id-cpf">CPF</label>
                        <input type="text" name="cpf" id="id-cpf" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="id-senha">Senha</label>
                        <input type="text" name="senha" id="id-senha" class="form-control">
                    </div>

                    <input type="submit" value="Salvar" class="btn btn-primary mt-3">
                    <a href="login.jsp" class="btn btn-warning mt-3">Voltar</a>
                </form>
            </div>
        </div>
    </div>
</div>

<%--<%@include file="footer.jsp"%>--%>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>

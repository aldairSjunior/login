<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.css">
</head>
<body style="background-color: rgba(0, 118, 129, 0.34)">

<%@include file="header.jsp"%>

<%--<div style="width: 30%; margin-left: 10%; margin-top: 10%" class="card">--%>
<%--    <div class="card-header">--%>
<%--        Saldo--%>
<%--    </div>--%>
<%--    <div class="card-body">--%>
<%--        <figure>--%>
<%--            <blockquote class="blockquote">--%>
<%--                <p>A well-known quote, contained in a blockquote element.</p>--%>
<%--            </blockquote>--%>
<%--            <figcaption class="blockquote-footer">--%>
<%--                Someone famous in <cite title="Source Title">Source Title</cite>--%>
<%--            </figcaption>--%>
<%--        </figure>--%>
<%--    </div>--%>
<%--</div>--%>

<div style="margin-top: 20%" class="container">
    <header>
        <c:if test="${not empty usuarioLogado}">
            <h1>Bem-vindo, ${usuarioLogado.nome}!</h1>
        </c:if>
    </header>

    <div style="background-color: #fff; border-radius: 8px; padding: 20px; margin: 20px 0; box-shadow: 0 2px 4px rgba(0,0,0,0.1);" class="saldo-card">
        <h2>Seu Saldo</h2>
        <div style="font-size: 2em; ont-weight: bold; color: #2ecc71; text-align: center; margin-top: 10px;" class="saldo-valor">
            <c:if test="${not empty saldoFormatado}">
                <span>${saldoFormatado}</span>
            </c:if>
            <c:if test="${empty saldoFormatado}">
                <span>R$ 0,00</span>
            </c:if>
        </div>
    </div>

    <c:if test="${not empty erro}">
        <div style="background-color: #ffebee; color: #c62828; padding: 10px; border-radius: 4px; margin: 10px 0;" class="erro-mensagem">
                ${erro}
        </div>
    </c:if>

    <!-- Resto do conteúdo da página -->
</div>

<script src="resources/js/bootstrap.min.js"></script>

<%--fazer o carregamento automático quando a página for aberta--%>
<%--<script>--%>
<%--    window.onload = function() {--%>
<%--        // Faz a requisição para carregar o saldo assim que a página carregar--%>
<%--        window.location.href = "usuarios?acao=home";--%>
<%--    }--%>
<%--</script>--%>

<%--implementar atualização automática do saldo--%>
<%--<script>--%>
<%--    // Atualiza o saldo a cada 60 segundos--%>
<%--    setInterval(function() {--%>
<%--        fetch('usuarios?acao=home')--%>
<%--            .then(response => response.text())--%>
<%--            .then(html => {--%>
<%--                // Atualiza apenas a div do saldo--%>
<%--                const parser = new DOMParser();--%>
<%--                const doc = parser.parseFromString(html, 'text/html');--%>
<%--                const newSaldo = doc.querySelector('.saldo-valor').innerHTML;--%>
<%--                document.querySelector('.saldo-valor').innerHTML = newSaldo;--%>
<%--            });--%>
<%--    }, 60000);--%>
<%--</script>--%>

</body>
</html>

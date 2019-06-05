<%-- 
    Document   : usuarioAdd
    Created on : 01/06/2019, 13:04:30
    Author     : Anesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Bases/materialize.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="grey lighten-1">
        <jsp:include page="Bases/nav.jsp" />
        <main>
            <div class="row">
                <div class="col s8 offset-l2">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Cadastrar Usuário</span>
                            <br>
                            <div class="divider orange"></div>
                            <p>
                            <div class="row">
                                <form action="Usuario?acao=cadastrar" method="post">
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="nome" name="nome" type="text" required>
                                            <label for="nome">Nome</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="nascimento" name="nascimento" type="text" required>
                                            <label for="nascimento">Nascimento</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="telefone" name="telefone" type="tel" required>
                                            <label for="telefone">Telefone</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="cpf" name="cpf" type="text" required>
                                            <label for="cpf">CPF</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="email" name="email" type="email" required>
                                            <label for="email">E-mail</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="senha" name="senha" type="password" required>
                                            <label for="senha">Senha</label>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <a href="login.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Cadastrar</button>
                                    </div>
                                </form>
                            </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

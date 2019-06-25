<%-- 
    Document   : recuperarSenha
    Created on : 09/06/2019, 20:40:03
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
    <body class="grey light-3">
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Recuperar Senha</span>
                            <br>
                            <div class="divider orange"></div>
                            <div class="row">
                                <%
                                    if (session.getAttribute("rs") != null) {
                                %>
                                <form action="Usuario?acao=novaSenha" method="post" >
                                    <div class="row">
                                        <div class="input-field col s6 offset-l3">
                                            <input id="senha1" type="password" name="senha1" class="validate" required>
                                            <label for="senha1">Nova senha</label>
                                        </div>
                                        <div class="input-field col s6 offset-l3">
                                            <input id="senha2" type="password" name="senha2" class="validate" required>
                                            <label for="senha2">Repita a senha</label>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <a href="login.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Continuar</button>
                                    </div>
                                </form>
                                <%
                                } else {
                                %>
                                <form action="Usuario?acao=rSenha" method="post" >
                                    <div class="row">
                                        <div class="input-field col s6 offset-l3">
                                            <input id="email" type="email" name="email" class="validate" required>
                                            <label for="email">Digite seu email para continuar</label>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Continuar</button>
                                    </div>
                                </form>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

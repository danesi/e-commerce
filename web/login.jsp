<%-- 
    Document   : login
    Created on : 01/06/2019, 13:27:53
    Author     : Anesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Bases/materialize.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="grey lighten-1">
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <%
                if (session.getAttribute("usuario") != null) {
                    response.sendRedirect("index.jsp");
                } else {
            %>
            <div class="row" style="margin-top: 7vh">
                <div class="col s6 offset-l3">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Login</span>
                            <p>
                            <div class="row center">
                                <form action="Usuario?acao=login" method="post">
                                    <div class="row">
                                        <div class="input-field col s8 offset-l2">
                                            <input id="last_name" name="email" type="email" class="validate" required>
                                            <label for="last_name">E-mail</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s8 offset-l2">
                                            <input id="last_name" name="senha" type="password" class="validate" required>
                                            <label for="last_name">Senha</label>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <a class="waves-effect waves-light btn grey darken-3" href="index.jsp">Entrar sem logar</a>
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Entrar</button>
                                        <div class="row center" >
                                            <br>
                                            <a href="usuarioAdd.jsp" class="orange-text">Cadastre-se</a>
                                        </div>
                                        <div class="row center" >
                                            <a href="recuperarSenha.jsp" class="orange-text">Esqueceu a senha?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>


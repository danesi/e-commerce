<%-- 
    Document   : enderecoAdd
    Created on : 05/06/2019, 14:01:30
    Author     : Anesi
--%>

<%@page import="Model.UsuarioBean"%>
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
            <%
                if (session.getAttribute("u_cadastrado") != null) {
                    UsuarioBean usuario = (UsuarioBean) session.getAttribute("u_cadastrado");
            %>
            <div class="row">
                <div class="col s8 offset-l2">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Cadastrar Endereço do <%= usuario.getNome() %></span
                            <br>
                            <div class="divider orange"></div>
                            <form method="post" action="Endereco?acao=cadastrar">
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="endereco" name="endereco" type="text" required>
                                        <label for="endereco">Endereco</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="cep" name="cep" type="text" required>
                                        <label for="cep">Cep</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="num_casa" name="num_casa" type="number" required>
                                        <label for="num_casa">Número da casa</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="complemento" name="complemento" type="text" required>
                                        <label for="complemento">Complemento</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="estado" name="estado" type="text" required>
                                        <label for="estado">Estado</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="cidade" name="cidade" type="text" required>
                                        <label for="cidade">Cidade</label>
                                    </div>
                                </div>
                                <div class="row center">
                                    <a href="login.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                    <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Cadastrar</button>
                                </div>
                            </form>
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

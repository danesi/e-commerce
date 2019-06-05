<%-- 
    Document   : usuarioEdit
    Created on : 03/06/2019, 19:46:29
    Author     : Anesi
--%>

<%@page import="Model.UsuarioBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("erro_atualizar_user") != null) {
        String a = (String) session.getAttribute("erro_atualizar_user");
        System.out.println(a);
%>
<script>
    alert(<%= a %>);
</script>
<%
    }
%>
<html>
    <head>
        <jsp:include page="Bases/materialize.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="grey lighten-1">
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <%
                if (session.getAttribute("usuario") != null) {
                    UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Editar usuário</span>
                            <br>
                            <p>
                            <div class="row">
                                <form action="Usuario?acao=editar" method="post">
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1 hide">
                                            <input id="id" name="id" type="text" required value="<%= usuario.getCodigo()%>">
                                            <label for="id">id</label>
                                        </div>
                                        <div class="input-field col s5 offset-l1">
                                            <input id="nome" name="nome" type="text" required value="<%= usuario.getNome()%>">
                                            <label for="nome">Nome</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="nascimento" name="nascimento" type="text" required value="<%= usuario.getNascimento()%>">
                                            <label for="nascimento">Nascimento</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="telefone" name="telefone" type="tel" required value="<%= usuario.getTelefone()%>">
                                            <label for="telefone">Telefone</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="cpf" name="cpf" type="text" required value="<%= usuario.getCpf()%>">
                                            <label for="cpf">CPF</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="email" name="email" type="email" required value="<%= usuario.getEmail()%>">
                                            <label for="email">E-mail</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="senha" name="senha" type="password" required>
                                            <label for="senha">Senha atual</label>
                                            <span class="helper-text">* Digite a senha atual para prosseguir</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="senha" name="senhaNova" type="password">
                                            <label for="senha">Nova senha</label>
                                        </div>
                                        <div class="right" style="margin-right: 15vh; margin-top: 5vh">
                                            <a href="usuarioView.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                            <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Alterar</button>
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


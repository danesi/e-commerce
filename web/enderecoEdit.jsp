<%-- 
    Document   : enderecoEdit
    Created on : 05/06/2019, 20:13:44
    Author     : Anesi
--%>

<%@page import="Model.EnderecoBean"%>
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
                if (session.getAttribute("usuario") != null) {

                    if (session.getAttribute("endereco") != null) {
                        EnderecoBean endereco = (EnderecoBean) session.getAttribute("endereco");
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Editar endereco</span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <form action="Endereco?acao=editarParaVenda" method="post">
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="endereco" name="endereco" type="text" required value="<%= endereco.getEndereco()%>">
                                            <label for="endereco">Endereco</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="cep" name="cep" type="text" required value="<%= endereco.getCep()%>">
                                            <label for="cep">Cep</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="num_casa" name="num_casa" type="number" required value="<%= endereco.getNum_casa()%>">
                                            <label for="num_casa">Número da casa</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="complemento" name="complemento" type="text" required  value="<%= endereco.getComplemento()%>">
                                            <label for="complemento">Complemento</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="estado" name="estado" type="text" required value="<%= endereco.getEstado()%>">
                                            <label for="estado">Estado</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="cidade" name="cidade" type="text" required value="<%= endereco.getCidade()%>">
                                            <label for="cidade">Cidade</label>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <%
                                            if (session.getAttribute("aux") != null) {
                                        %>
                                        <a href="Usuario?acao=verUsuario" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                        <%
                                        } else {
                                        %>
                                        <a href="vendaAdd.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                        <% } %>
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Confirmar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>

            <%
                }
            } else {
            %>
            <script>
                var toastHTML = '<span class="orange-text">Sessão expirada faça login novamente</span>';
                M.toast({html: toastHTML, classes: 'rounded'});
            </script>
            <div class="row center">
                <a href="login.jsp" class="waves-effect waves-light btn orange darken-3">Logar</a>
            </div>
            <%
                }
            %>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

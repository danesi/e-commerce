<%-- 
    Document   : vendaAdd
    Created on : 05/06/2019, 15:12:34
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
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Confirme o endereço para continuar</span>
                            <br>
                            <div class="divider orange"></div>
                            <div class="card-content white lighten-4 black-text">
                                <%
                                    if (session.getAttribute("usuario") != null) {

                                        if (session.getAttribute("endereco") != null) {
                                            EnderecoBean endereco = (EnderecoBean) session.getAttribute("endereco");
                                %>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="endereco" name="endereco" type="text" required value="<%= endereco.getEndereco()%>" disabled>
                                        <label for="endereco">Endereco</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="cep" name="cep" type="text" required value="<%= endereco.getCep()%>" disabled>
                                        <label for="cep">Cep</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="num_casa" name="num_casa" type="number" required value="<%= endereco.getNum_casa()%>" disabled>
                                        <label for="num_casa">Número da casa</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="complemento" name="complemento" type="text" required  value="<%= endereco.getComplemento()%>" disabled>
                                        <label for="complemento">Complemento</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="estado" name="estado" type="text" required value="<%= endereco.getEstado()%>" disabled>
                                        <label for="estado">Estado</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="cidade" name="cidade" type="text" required value="<%= endereco.getCidade()%>" disabled>
                                        <label for="cidade">Cidade</label>
                                    </div>
                                </div>
                                <div class="row center">
                                    <a href="Endereco?acao=editarDaVenda" class="waves-effect waves-light btn grey darken-3">Editar</a>
                                    <a href="Venda?acao=cadastrar" class="waves-effect waves-light btn orange darken-3">Confirmar esse</a>
                                </div>
                                <%
                                } else {
                                %>
                                <script>
                                    var toastHTML = '<span class="orange-text">Nenhum endereco encontrado para esse usuário</span>';
                                    M.toast({html: toastHTML, classes: 'rounded'});
                                </script>
                                <span class="card-title center black-text">Cadastre um endereco para continuar</span>
                                <form method="post" action="Endereco?acao=cadastrarDepois">
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
                                        <a href="carrinho.jsp" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                        <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Cadastrar</button>
                                    </div>
                                </form>
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
                            </div>
                            <div id="pagamento">Test 2</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="Bases/footer.jsp" />
</body>
</html>
<script>
    var tabs = document.querySelectorAll('.tabs')
    for (var i = 0; i < tabs.length; i++) {
        M.Tabs.init(tabs[i]);
    }
</script>
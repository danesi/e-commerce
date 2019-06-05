<%-- 
    Document   : produtoVerMais
    Created on : 01/06/2019, 14:30:59
    Author     : Anesi
--%>

<%@page import="Model.ProdutoBean"%>
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
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <%
                if (session.getAttribute("produto") != null) {
                    ProdutoBean produto = new ProdutoBean();
                    produto = (ProdutoBean) session.getAttribute("produto");
            %> 
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center"><h4>Continuar compra do produto</h4></span>
                            <div class="row" >
                                <div class="col s4">
                                    <img src="Imagens/<%= produto.getImagem()%>" height="300" width="320" />
                                </div>
                                <div class="row col s4 offset-l1">
                                    <h5 class="black-text"><%= produto.getNome()%></h5>
                                    <br>
                                    <h6 class="black-text">Preco unitario: <%= produto.getPreco()%> R$</h6>
                                    <br>
                                    <form action="Produto?acao=addCarrinho&id=<%= produto.getCodigo()%>" method="post" >
                                        <div class="row col s12">
                                            <div class="row input-field">
                                                <input id="quant" value="1" name="quant" type="number" min="1" max="<%= produto.getQuant_estoque()%>" required class="validate">
                                                <label for="quant">Quantidade</label>
                                                <small class="black-text">Quantidade de estoque: <%= produto.getQuant_estoque() %></small>
                                            </div>
                                        </div>
                                        <div class="row center">
                                            <a class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                            <%
                                                if (session.getAttribute("usuario") != null) {
                                            %>
                                            <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Adicionar ao carrinho</button>
                                            <%
                                            } else {
                                            %>
                                            <a href="login.jsp" class="waves-effect waves-light btn orange darken-3">Logar</a></div>                                            
                                            <%
                                                }
                                            %>

                                </div>
                                </form>
                            </div>
                        </div>
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

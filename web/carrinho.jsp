<%-- 
    Document   : carrinho
    Created on : 01/06/2019, 14:55:02
    Author     : Anesi
--%>

<%@page import="Model.ProdutoBean"%>
<%@page import="java.util.List"%>
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
            <%
                if (session.getAttribute("carrinho") != null) {
                    double precoUnitario = 0;
                    double precoFinal = 0;
                    List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Produtos no carrinho</span>
                            <div class="col s10 offset-l1">
                                <table class="black-text">
                                    <thead>
                                        <tr>
                                            <th>Produto</th>
                                            <th>Quantidade</th>
                                            <th>Preço unitario</th>
                                            <th>Preço total</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (ProdutoBean produto : produtos) {
                                                precoUnitario = produto.getPreco() * produto.getQuant();
                                        %>
                                        <tr>
                                            <td><%= produto.getNome()%></td>
                                            <td><%= produto.getQuant()%></td>
                                            <td><%= produto.getPreco()%> R$</td>
                                            <td><%= precoUnitario%> R$</td>
                                            <td><a href="Produto?acao=removeCarrinho&id=<%= produto.getCodigo()%>"<i class="material-icons black-text">delete</i></a></td>
                                        </tr>
                                        <%
                                                precoFinal += produto.getPreco() * produto.getQuant();
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row center">
                                
                            </div>
                            <br>
                            <div class="row center">
                                <h5 class="black-text">Preço total a pagar: <%= precoFinal%> R$</h5>
                                <br>
                                <a href="index.jsp" class="waves-effect waves-light btn grey darken-3">Voltar</a>
                                <a href="#" class="waves-effect waves-light btn orange darken-3">Concluir compra</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <%
            } else {
            %>
            <div class="row" style="margin-top: 20vh">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Nenhum produto no carrinho</span>
                            <br>
                            <div class="row center" >
                                <a href="index.jsp" class="waves-effect waves-light btn orange darken-3">Voltar às compras</a>
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
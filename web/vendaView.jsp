<%-- 
    Document   : vendaView
    Created on : 06/06/2019, 18:29:25
    Author     : Anesi
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Venda_ItemVendaBean"%>
<%@page import="Model.VendaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Bases/materialize.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <%
                List<Venda_ItemVendaBean> vendas = (List<Venda_ItemVendaBean>) session.getAttribute("vendaView");
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Resumo da compra</span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <table class="black-text col s10 offset-l1">
                                    <thead>
                                        <tr>
                                            <th>Imagem</th>
                                            <th>Nome produto</th>
                                            <th>Preço</th>
                                            <th>Quantidade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Venda_ItemVendaBean venda : vendas) {
                                        %>
                                        <tr>
                                            <td><img src="Imagens/<%= venda.getProduto().getImagem()%>" style="max-height: 50px" /></td>
                                            <td><%= venda.getProduto().getNome()%></td>
                                            <td><%= venda.getProduto().getPreco()%></td>
                                            <td><%= venda.getQuantidade()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <br>
                            <div class="row center">
                                <a href="Usuario?acao=verUsuario" class="waves-effect waves-light btn grey darken-3">Voltar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

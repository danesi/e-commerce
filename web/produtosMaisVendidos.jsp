<%-- 
    Document   : produtosMaisVendidos
    Created on : 09/06/2019, 19:41:50
    Author     : Anesi
--%>

<%@page import="Model.RelatorioBean"%>
<%@page import="java.util.List"%>
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
                            <span class="card-title black-text center">Produtos mais vendidos</span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <%
                                    if (session.getAttribute("produtoMaisVendido") != null) {
                                        List<RelatorioBean> relatorios = (List<RelatorioBean>) session.getAttribute("produtoMaisVendido");
                                %>
                                <table class="black-text col s10 offset-l1">
                                    <thead>
                                        <tr>
                                            <th>Imagem</th>
                                            <th>Nome do produto</th>
                                            <th>Quantidade vendida</th>
                                            <th>Preço total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (RelatorioBean relatorio : relatorios) {
                                        %>
                                        <tr>
                                            <td><img src="Imagens/<%= relatorio.getProduto().getImagem()%>" style="max-height: 50px" /></td>
                                            <td><%= relatorio.getProduto().getNome()%></td>
                                            <td><%= relatorio.getProduto().getQuant()%></td>
                                            <td><%= relatorio.getProduto().getQuant() * relatorio.getProduto().getPreco()%> R$</td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <%
                                } else {
                                %>
                                <br>
                                <span class="card-title">Nenhum dado no momento</span>
                                <%
                                    }
                                %>
                            </div>
                            <div class="row center">
                                <a href="administrativa.jsp" class="waves-effect waves-light btn grey darken-3">Voltar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

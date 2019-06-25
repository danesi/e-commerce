<%-- 
    Document   : clienteQueMaisCompra
    Created on : 13/06/2019, 20:30:41
    Author     : Anesi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.RelatorioBean"%>
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
                            <span class="card-title black-text center">Clientes que mais compraram</span>
                            <br>
                            <div class="divider orange"></div>
                            <%
                                if (session.getAttribute("clienteCompra") != null) {
                                    List<RelatorioBean> relatorios = (List<RelatorioBean>) session.getAttribute("clienteCompra");
                            %>
                            <div class="row">
                                <div class="col s10 offset-l1">
                                    <table class="black-text responsive-table">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Compras feitas</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                for (RelatorioBean relatorio : relatorios) {
                                            %>
                                            <tr>
                                                <td><%= relatorio.getVenda().getUsuario().getNome()%></td>
                                                <td><%= relatorio.getQuantidade()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row center">
                                <a href="administrativa.jsp" class="waves-effect waves-light btn grey darken-3">Voltar</a>
                            </div>
                            <%
                                }
                            %>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

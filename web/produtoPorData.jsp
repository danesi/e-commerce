<%-- 
    Document   : produtoPorData
    Created on : 10/06/2019, 15:22:57
    Author     : Anesi
--%>

<%@page import="Model.ItemVendaBean"%>
<%@page import="Model.RelatorioBean"%>
<%@page import="java.util.List"%>
<%@page import="Model.VendaBean"%>
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
                            <span class="card-title black-text center">Valor arrecadado entre <%= String.valueOf(session.getAttribute("datas"))%></span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <%
                                    double valor = 0;
                                    if (session.getAttribute("entreDatas") != null) {
                                        List<RelatorioBean> relatorios = (List<RelatorioBean>) session.getAttribute("entreDatas");
                                        if (relatorios.size() > 0) {
                                            for (RelatorioBean relatorio : relatorios) {
                                                valor += relatorio.getVenda().getPreco();
                                            }
                                %>
                                <ul class="collapsible black-text col s10 offset-l1">
                                    <li>
                                        <div class="collapsible-header"><i class="material-icons orange-text">attach_money</i>Valor total <%= valor%> R$</div>
                                        <div class="collapsible-body">
                                            <table class="striped">
                                                <thead>
                                                    <tr>
                                                        <th>Data</th>
                                                        <th>Valor total da venda</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (RelatorioBean relatorio : relatorios) {
                                                    %>
                                                    <tr>
                                                        <td><%= relatorio.getVenda().getData()%></td>
                                                        <td><%= relatorio.getVenda().getPreco()%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </ul>
                                <%
                                } else {
                                %>
                                <div class="row center">
                                    <h5 class="black-text">Nenhum registro encontrado nesta data</h5>
                                </div>
                                <%
                                        }
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
<script>
    var collapsibles = document.querySelectorAll('.collapsible')
    for (var i = 0; i < collapsibles.length; i++) {
        M.Collapsible.init(collapsibles[i]);
    }
</script>
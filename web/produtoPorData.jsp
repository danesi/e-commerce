<%-- 
    Document   : produtoPorData
    Created on : 10/06/2019, 15:22:57
    Author     : Anesi
--%>

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
                            <span class="card-title black-text center">Produtos mais vendidos</span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <%
                                    double valor = 0;
                                    System.out.println("Aquiaaaaa");
                                    if (session.getAttribute("entreDatas") != null) {
                                        System.out.println("Aqui");
                                        List<RelatorioBean> relatorios = (List<RelatorioBean>) session.getAttribute("entreDatas");
                                        if (relatorios.size() > 0) {
                                            System.out.println("aaaa");
                                            for (RelatorioBean relatorio : relatorios) {
                                                valor += relatorio.getVenda().getPreco();
                                            }
                                %>
                                <h2 class="black-text"><%= valor %></h2>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

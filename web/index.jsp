<%-- 
    Document   : index
    Created on : 01/06/2019, 13:42:49
    Author     : Anesi
--%>

<%@page import="java.util.List"%>
<%@page import="Model.ProdutoBean"%>
<%@page import="Dao.ProdutoDAO"%>
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
            <div class="container col s10 offset-l1">
                <div class="row">
                    <%
                        ProdutoDAO dao = new ProdutoDAO();
                        List<ProdutoBean> produtos = dao.selecionaTodos();
                        for (ProdutoBean produto : produtos) {%>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <a href="Produto?acao=verProduto&id=<%= produto.getCodigo()%>" >
                            <div class="card-image">
                                <img src="Imagens/<%= produto.getImagem()%>" height="220" width="150">
                            </div>
                            <div class="card-content">
                                <div class="divider"></div>
                                <h5 class="black-text"><%= produto.getNome()%></h5>
                                <h6 class="black-text"><%= String.format("R$ %,.2f", produto.getPreco()).replace(",", ".") %></h6>
                                <small class="black-text"><%= produto.getQuant_estoque() %> produtos no estoque</small>
                            </div>
                            </a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

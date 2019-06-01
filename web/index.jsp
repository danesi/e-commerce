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
        <main>
            <div class="row">
                <%
                    ProdutoDAO dao = new ProdutoDAO();
                    List<ProdutoBean> produtos = dao.selecionaTodos();
                    for (ProdutoBean produto : produtos) {%>
                <div class="col s2">
                    <div class="card">
                        <div class="card-image">
                            <img src="Imagens/<%= produto.getImagem()%>" style="max-height: 40vh; max-width: 32vh">
                            <a class="btn-floating halfway-fab waves-effect waves-light orange darken-3" href="Produto?acao=verProduto&id=<%= produto.getCodigo()%>"><i class="material-icons">add</i></a>
                        </div>
                        <div class="card-content">
                            <span class="card-title"><%= produto.getNome()%></span>
                            Preço: <%= produto.getPreco()%> R$
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>
<%
    if (session.getAttribute("erro") != null) {%>
<script>
    alert("<%= session.getAttribute("erro")%>");
</script>
<%
    }
%>


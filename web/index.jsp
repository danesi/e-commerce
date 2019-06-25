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
            <br>
            <div class="container col s10 offset-l1">
                <div class="row">
                    <div class="card z-depth-3">
                        <form action="Produto?acao=filtro" method="post">
                            <div class="row">
                                <div class="input-field col s8 offset-l1">
                                    <i class="material-icons prefix black-text">search</i>
                                    <input id="nome" name="nome" type="text" placeholder="Digite o nome do produto">
                                    <label for="nome">Buscar produto</label>
                                </div>
                                <br>                               
                                <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Buscar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row" id="atualiza">
                    <%
                        if (session.getAttribute("produtosIndex") != null) {
                            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("produtosIndex");
                            for (ProdutoBean produto : produtos) {%>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <a href="Produto?acao=verProduto&id=<%= produto.getCodigo()%>" >
                                <div class="card-image">
                                    <img src="Imagens/<%= produto.getImagem()%>" height="230" width="160">
                                </div>
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <h5 class="black-text"><%= produto.getNome()%></h5>
                                    <%
                                        if (produto.isPromocao()) {
                                    %>
                                    <strike><h6 class="black-text"><%= String.format("R$ %,.2f", produto.getPreco()).replace(",", ".")%></h6></strike>
                                    <span class="new badge orange darken-3 left" data-badge-caption="Promoção <%= String.format("R$ %,.2f", produto.getPrecoPro()).replace(",", ".")%>" style="margin-left: -1px"></span>
                                    <%
                                    } else {
                                    %>
                                    <h6 class="black-text"><%= String.format("R$ %,.2f", produto.getPreco()).replace(",", ".")%></h6>
                                    <span class= badge orange darken-3"></span>
                                    <%
                                        }
                                    %>
                                    <br>
                                    <small class="black-text"><%= produto.getQuant_estoque()%> produtos no estoque</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                            response.sendRedirect("Produto?acao=index");
                        }
                    %>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>


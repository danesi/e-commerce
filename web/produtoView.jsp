<%-- 
    Document   : produtoEdit
    Created on : 01/06/2019, 19:23:18
    Author     : Anesi
--%>

<%@page import="Model.UsuarioBean"%>
<%@page import="java.util.List"%>
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
        <main>
            <%
                if (session.getAttribute("usuario") != null) {
                    UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
                    if (usuario.isAdm()) {
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Todos os produtos</span>
                            <br>
                            <div class="divider orange"></div>
                            <%
                                if (session.getAttribute("produtos") != null) {
                                    List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("produtos");
                            %>
                            <table class="black-text centered">
                                <thead>
                                    <tr>
                                        <th>Imagem</th>
                                        <th>Nome</th>
                                        <th>Preço</th>                                                                                                                        
                                        <th>Preco promocional</th>                                                                                                                        
                                        <th>Quantidade no estoque</th>
                                        <th>Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (ProdutoBean produto : produtos) {
                                    %>
                                    <tr>
                                        <td><img src="Imagens/<%= produto.getImagem()%>" style="max-height: 50px" /></td>
                                        <td><%= produto.getNome()%></td>
                                        <td>R$ <%= produto.getPreco()%></td>
                                        <td>
                                            <%
                                                if (produto.isPromocao()) {
                                                    out.print("R$ "+ produto.getPrecoPro());
                                                } else {
                                                    out.print("-");
                                                }
                                            %>
                                        </td>
                                        <td><%= produto.getQuant_estoque()%></td>

                                        <td>
                                            <a href="Produto?acao=editarProduto&id=<%= produto.getCodigo()%>"><i class="material-icons black-text">edit</i></a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

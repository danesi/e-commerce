<%-- 
    Document   : produtoEdit
    Created on : 01/06/2019, 20:44:17
    Author     : Anesi
--%>

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
                ProdutoBean produto = (ProdutoBean) session.getAttribute("produtoEditar");
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Editar Produto <%= produto.getNome()%></span>
                            <div class="row">
                                <form action="Produto?acao=editar&id=<%= produto.getCodigo()%>" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="codigo" type="text" name="codigo" value="<%= produto.getCodigo()%>" disabled>
                                            <label for="codigo">Codigo</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="nome" type="text" name="nome" value="<%= produto.getNome()%>">
                                            <label for="nome">Nome</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s5 offset-l1">
                                            <input id="preco" name="preco" type="text" value="<%= produto.getPreco()%>">
                                            <label for="preco">Preco</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <input id="quant_estoque" type="text" name="quant_estoque" value="<%= produto.getQuant_estoque()%>">
                                            <label for="quant_estoque">Quantidade em estoque</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col s5 offset-l1">
                                            <div class="file-field input-field">
                                                <span class="grey-text">Imagem</span>
                                                <input type="file" id="file" name="file">
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate black-text" id="imagem" name="imagem" type="text">
                                                </div>
                                            </div>  
                                        </div>
                                        <div class="right" style="margin-right: 15vh; margin-top: 8vh">
                                            <a href="Produto?acao=verProdutos" class="waves-effect waves-light btn grey darken-3">Cancelar</a>
                                            <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Alterar</button>
                                        </div>
                                    </div>
                                </form>
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
    
</script>
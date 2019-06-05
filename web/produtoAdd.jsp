<%-- 
    Document   : produtoAdd
    Created on : 01/06/2019, 13:43:00
    Author     : Anesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Bases/materialize.jsp" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="grey lighten-1">
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <%
                if (session.getAttribute("usuario") == null) {
                    response.sendRedirect("index.jsp");
                }
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Cadastro de produtos</span>
                            <br>
                            <div class="divider orange"></div>
                            <form action="Produto?acao=cadastrar" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="nome" type="text" name="nome" class="validate" required>
                                        <label for="nome">Nome</label>
                                    </div>
                                    <div class="file-field input-field col s5">
                                        <input type="file" name="imagem" required>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text" placeholder="Selecione a imagem" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s5 offset-l1">
                                        <input id="preco" name="preco" type="number" class="validate" required step="0.01">
                                        <label for="preco">Preco</label>
                                        <span class="helper-text">* Utilize a virgula como separador</span>
                                    </div>
                                    <div class="input-field col s5">
                                        <input id="quant_estoque" name="quant_estoque" type="number" class="validate" required>
                                        <label for="quant_estoque">Quantidade no estoque</label>
                                    </div>
                                </div>
                                <div class="row center">
                                    <a class="waves-effect waves-light btn grey darken-3" href="administrativa.jsp">VOltar</a>
                                    <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Cadastrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

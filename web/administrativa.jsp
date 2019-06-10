<%-- 
    Document   : administracao
    Created on : 01/06/2019, 19:08:32
    Author     : Anesi
--%>

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
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Área administrativa</span>
                            <br>
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <div class="col s10 offset-l1">
                                    <ul class="collapsible black-text popout">
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">shopping_basket</i><b>Produtos</b></div>
                                            <div class="collapsible-body">
                                                <div class="row">
                                                    <div class="col offset-l2">
                                                        <a href="produtoAdd.jsp" class="waves-effect waves-light btn orange darken-3"><i class="material-icons left">add</i>Cadastrar produto</a>
                                                    </div>
                                                    <div class="col offset-l1">
                                                        <a href="Produto?acao=verProdutos" class="waves-effect waves-light btn orange darken-3"><i class="material-icons left">edit</i>Editar produtos</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">assignment</i><b>Relatórios</b></div>
                                            <div class="collapsible-body">
                                                <div class="row">
                                                    <div class="collection">
                                                        <a href="Relatorio?acao=produtoMaisVendido" class="collection-item center black-text">Produtos mais vendido</a>
                                                        <a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>
                                                        <a href="#!" class="collection-item">Alan</a>
                                                        <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
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
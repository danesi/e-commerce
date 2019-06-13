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
        <jsp:include page="Bases/msg.jsp" />
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
                                            <div class="collapsible-header"><i class="material-icons orange-text">local_atm</i><b>Vendas</b></div>
                                            <div class="collapsible-body"></div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">assignment</i><b>Relatórios</b></div>
                                            <div class="collapsible-body">
                                                <div class="row">
                                                    <div>
                                                        <ul class="collapsible black-text">
                                                            <li>
                                                                <a href="Relatorio?acao=produtoMaisVendido" class="black-text"><div class="collapsible-header disabled"><i class="material-icons orange-text">shopping_cart</i><b>Produtos mais vendidos</b></div></a>
                                                            </li>
                                                            <li>
                                                                <div class="collapsible-header"><i class="material-icons orange-text">monetization_on</i><b>Valor vendido entre datas</b></div>
                                                                <div class="collapsible-body">
                                                                    <form action="Relatorio?acao=entreDatas" method="post">
                                                                        <div class="row">
                                                                            <div class="input-field col s5 offset-l1">
                                                                                <input id="dataInicial" name="dataInicial" type="text" class="validate" required>
                                                                                <label for="dataInicial">Data Inicial</label>
                                                                            </div>
                                                                            <div class="input-field col s5">
                                                                                <input id="dataFinal" name="dataFinal" type="text" class="validate" required>
                                                                                <label for="dataFinal">Data Final</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row center">
                                                                            <button class="btn waves-effect waves-light orange darken-3" type="submit" name="action">Continuar</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <a href="Relatorio?acao=ClienteMaisComprou" class="black-text"><div class="collapsible-header"><i class="material-icons orange-text">person_outline</i><b>Clientes que mais compraram</b></div></a>
                                                            </li>
                                                        </ul>
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

    $(document).ready(function () {
        $('#dataInicial').mask('00/00/0000');
        $('#dataFinal').mask('00/00/0000');
    });

</script>
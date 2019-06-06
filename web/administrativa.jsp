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
                                <div class="col s3 offset-l1">
                                    <div class="card z-depth-3">
                                        <a href="#!" >
                                            <div class="card-image">
                                                <img class="center" src="Imagens/cheers.svg" height="220" width="150">
                                            </div>
                                            <div class="card-content">
                                                <div class="divider"></div>
                                                <h5 class="black-text center">Cadastrar produto</h5>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col s3">
                                    <div class="card z-depth-3">
                                        <a href="#!" >
                                            <div class="card-image">
                                                <img class="center" src="Imagens/edit (1).svg" height="220" width="150">
                                            </div>
                                            <div class="card-content">
                                                <div class="divider"></div>
                                                <h5 class="black-text center">Editar produto</h5>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="Produto?acao=verProdutos" class="waves-effect waves-light btn orange darken-3">Editar produtos</a>
                            <a href="produtoAdd.jsp" class="waves-effect waves-light btn orange darken-3">Cadastrar produtos</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>
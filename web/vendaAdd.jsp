<%-- 
    Document   : vendaAdd
    Created on : 05/06/2019, 15:12:34
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
    <body class="grey light-3">
        <jsp:include page="Bases/nav.jsp" />
        <jsp:include page="Bases/msg.jsp" />
        <main>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title center black-text">Concluindo a compra</span>
                            <div class="card-tabs">
                                <ul class="tabs tabs-fixed-width">
                                    <li class="tab"><a class="active orange-text" href="#test4"><b>Endereço</b></a></li>
                                    <li class="tab"><a  href="#test5" class="orange-text"><b>Pagamento</b></a></li>
                                </ul>
                            </div>
                            <div class="card-content grey lighten-4 black-text">
                                <div id="test4">Test 1</div>
                                <div id="test5">Test 2</div>
                                <div id="test6">Test 3</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>
<script src="js/jquery-3.3.1.js"></script>
<script>
    $(document).ready(function () {
        $('.tabs').tabs();
    });
</script>

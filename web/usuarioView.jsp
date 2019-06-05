<%-- 
    Document   : usuarioView
    Created on : 03/06/2019, 19:01:05
    Author     : Anesi
--%>

<%@page import="Model.UsuarioBean"%>
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
            %>
            <div class="row">
                <div class="col s10 offset-l1">
                    <div class="card white">
                        <div class="card-content white-text">
                            <span class="card-title black-text center">Olá <%= usuario.getNome()%></span>
                            <br>
                            <div class="row">
                                <div class="collection col s4 offset-l1 z-depth-4">
                                    <h6 class="center orange-text"><b>Infomações pessoais</b></h6>
                                    <a href="#!" class="collection-item black-text"><span class="badge black-text"><%= usuario.getNome()%></span><b>Nome</b>    </a>
                                    <a href="#!" class="collection-item black-text"><span class="badge black-text"><%= usuario.getNascimento()%></span><b>Nascimento</b></a>
                                    <a href="#!" class="collection-item black-text"><span class="badge black-text"><%= usuario.getTelefone()%></span><b>Telefone</b></a>
                                    <a href="#!" class="collection-item black-text"><span class="badge black-text"><%= usuario.getCpf()%></span><b>CPF</b></a>
                                    <a href="#!" class="collection-item black-text"><span class="badge black-text"><%= usuario.getEmail()%></span><b>Email</b></a>
                                    <br>
                                    <div class="row center">
                                        <a href="usuarioEdit.jsp" class="waves-effect waves-light btn orange darken-3">Editar</a>
                                    </div>
                                </div>
                                <div class="collection col s5 offset-l1  z-depth-4">
                                    <h6 class="center orange-text"><b>Ultimas compras</b></h6>
                                    <table class="black-text centered">
                                        <thead>
                                            <tr>
                                                <th>Data</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>03/06/2019</td>
                                                <td><a href="#!"><i class="material-icons black-text">zoom_in</i></a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>

        </main>
        <jsp:include page="Bases/footer.jsp" />
    </body>
</html>

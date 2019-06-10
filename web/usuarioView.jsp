<%-- 
    Document   : usuarioView
    Created on : 03/06/2019, 19:01:05
    Author     : Anesi
--%>

<%@page import="java.util.List"%>
<%@page import="Model.VendaBean"%>
<%@page import="Model.EnderecoBean"%>
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
                            <div class="divider orange"></div>
                            <br>
                            <div class="row">
                                <div class="col s10 offset-l1">
                                    <ul class="collapsible black-text popout">
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">person</i><b>Informações pessoais</b></div>
                                            <div class="collapsible-body">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>Nome</th>
                                                            <th>Nascimento</th>
                                                            <th>Telefone</th>
                                                            <th>CPF</th>
                                                            <th>E-mail</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <td><%= usuario.getNome()%></td>
                                                            <td><%= usuario.getNascimento()%></td>
                                                            <td><%= usuario.getTelefone()%></td>
                                                            <td><%= usuario.getCpf()%></td>
                                                            <td><%= usuario.getEmail()%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="row center">
                                                    <br>
                                                    <a href="usuarioEdit.jsp" class="waves-effect waves-light btn orange darken-3">Editar</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">room</i><b>Endereço</b></div>
                                            <div class="collapsible-body">
                                                <%
                                                    EnderecoBean endereco = (EnderecoBean) session.getAttribute("endereco");
                                                %>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>Endereco</th>
                                                            <th>CEP</th>
                                                            <th>Número casa</th>
                                                            <th>Complemento</th>
                                                            <th>Estado</th>
                                                            <th>Cidade</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <td><%= endereco.getEndereco()%></td>
                                                            <td><%= endereco.getCep()%></td>
                                                            <td><%= endereco.getNum_casa()%></td>
                                                            <td><%= endereco.getComplemento()%></td>
                                                            <td><%= endereco.getEstado()%></td>
                                                            <td><%= endereco.getCidade()%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="row center">
                                                    <br>
                                                    <a href="enderecoEdit.jsp" class="waves-effect waves-light btn orange darken-3">Editar</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons orange-text">local_grocery_store</i><b>Ultimas compras</b></div>
                                            <div class="collapsible-body">
                                                <%
                                                    List<VendaBean> vendas = (List<VendaBean>) session.getAttribute("vendas");
                                                %>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>Data</th>
                                                            <th>Preço</th>
                                                            <th>Ação</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <%
                                                            for (VendaBean venda : vendas) {
                                                        %>
                                                        <tr>
                                                            <td><%= venda.getData()%></td>
                                                            <td><%= venda.getPreco()%> R$</td>
                                                            <td><a href="Venda?acao=verVenda&id=<%= venda.getCodigo() %>" ><i class="material-icons black-text">zoom_in</i></a></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                    </ul>
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
<script>
    var collapsibles = document.querySelectorAll('.collapsible')
    for (var i = 0; i < collapsibles.length; i++) {
        M.Collapsible.init(collapsibles[i]);
    }
</script>
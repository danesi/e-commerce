<%@page import="Model.ProdutoBean"%>
<%@page import="java.util.List"%>
<%@page import="Model.UsuarioBean"%>
<nav>
    <div class="nav-wrapper grey darken-3">
        <a href="index.jsp" class="brand-logo">DrinksBars</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <%
                if (session.getAttribute("usuario") != null) {
                    UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario");
            %>
            <li><a href="Usuario?acao=verUsuario"><%= usuario.getNome()%></a></li>
                <%
                    if (usuario.isAdm()) {
                %>
            <li><a href="administrativa.jsp">Área administrativa</a></li>
                <%
                    }
                %>
            <li><a href="carrinho.jsp">Carrinho
                    <%
                        if (session.getAttribute("carrinho") != null) {
                            List<ProdutoBean>produtos  = (List<ProdutoBean>) session.getAttribute("carrinho");
                            if (produtos.size() > 0) {
                    %>
                    <span class="new badge orange darken-3" data-badge-caption="
                          <%
                              if (produtos.size() == 1) {
                                  out.print("item");
                              } else {
                                  out.print("itens");
                              }
                          %>
                          "><%= produtos.size() %></span>
                    <%
                            }
                        }
                    %>
                </a></li>
            <li><a href="Usuario?acao=sair">Sair</a></li>
                <%
                } else {
                %>
            <li><a href="login.jsp">Fazer login</a></li>
                <%
                    }
                %>
        </ul>
    </div>
</nav>

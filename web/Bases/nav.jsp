<%@page import="Model.UsuarioBean"%>
<nav>
    <div class="nav-wrapper grey darken-3">
        <a href="index.jsp" class="brand-logo">DrinksBars</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <%
                if (session.getAttribute("usuario") != null) {
                    UsuarioBean usuario = new UsuarioBean();
                    usuario = (UsuarioBean) session.getAttribute("usuario");
            %>
            <li><a href="usuarioView.jsp"><%= usuario.getNome()%></a></li>
                <%
                    if (usuario.isAdm()) {
                %>
            <li><a href="administrativa.jsp">Área administrativa</a></li>
                <%
                    }
                %>
            <li><a href="carrinho.jsp">Carrinho</a></li>
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

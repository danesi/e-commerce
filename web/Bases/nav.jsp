<nav>
    <div class="nav-wrapper grey darken-3">
        <a href="index.jsp" class="brand-logo">DrinksBars</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <%
                if (session.getAttribute("usuario") != null) {
            %>
            <li><a href="sass.html">Sass</a></li>
            <li><a href="badges.html">Components</a></li>
            <li><a href="collapsible.html">JavaScript</a></li>
            <%
                }
            %>
            <li><a href="collapsible.html">JavaScript</a></li>
        </ul>
    </div>
</nav>

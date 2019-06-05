<%
    if (session.getAttribute("erro") != null) {
        String erro = String.valueOf(session.getAttribute("erro"));
%>
<script>
    var toastHTML = '<span class="orange-text"><%= erro %></span>';
    M.toast({html: toastHTML, classes: 'rounded'});
</script>
<%
    }

    session.setAttribute("erro", null);
%>
<%
    if (session.getAttribute("msg") != null) {
        String erro = String.valueOf(session.getAttribute("msg"));
%>
<script>
    var toastHTML = '<span class="orange-text"><%= erro %></span>';
    M.toast({html: toastHTML, classes: 'rounded'});
</script>
<%
    }
    session.setAttribute("msg", null);
%>
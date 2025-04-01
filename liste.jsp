<%@ page import="java.util.*" %>
<%@ include file="task_class.jsp" %>

<%
    // Réinitialisation manuelle (via URL ?reset=true)
    if ("true".equals(request.getParameter("reset"))) {
        session.invalidate();
        response.sendRedirect("liste.jsp");
        return;
    }

    // Récupération brute
    List tasksRaw = (List) session.getAttribute("tasks");
    List<Task> tasks = new ArrayList<>();

    try {
        if (tasksRaw != null) {
            for (Object o : tasksRaw) {
                tasks.add((Task) o);
            }
        }
    } catch (Exception e) {
        session.invalidate();
        response.sendRedirect("liste.jsp");
        return;
    }

    // Stockage propre en session (corrigé)
    session.setAttribute("tasks", tasks);

    // Traitement des actions
    String action = request.getParameter("action");
    String indexStr = request.getParameter("index");

    if (action != null && indexStr != null) {
        try {
            int index = Integer.parseInt(indexStr);
            if (index >= 0 && index < tasks.size()) {
                if ("delete".equals(action)) {
                    tasks.remove(index);
                } else if ("done".equals(action)) {
                    tasks.get(index).setDone(true);
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Index invalide</p>");
        }
    }
%>

<h2>Liste des tâches</h2>

<%
if (tasks.isEmpty()) {
%>
    <p>Aucune tâche enregistrée.</p>
<%
} else {
    for (int i = 0; i < tasks.size(); i++) {
        Task t = tasks.get(i);
%>
    <div style="border:1px solid #ccc; margin:10px; padding:10px; border-radius:8px;">
        <strong><%= t.getTitle() %></strong> - 
        <%= t.isDone() ? "✔️ Terminée" : "⏳ En cours" %><br>
        <em>Description :</em> <%= t.getDescription() %><br>
        <em>Échéance :</em> <%= t.getDueDate() %><br><br>
        <a href="liste.jsp?action=done&index=<%= i %>">✅ Marquer comme terminée</a> |
        <a href="liste.jsp?action=delete&index=<%= i %>">🗑️ Supprimer</a>
    </div>
<%
    }
}
%>

<p><a href="ajout.jsp">➕ Ajouter une nouvelle tâche</a> | 
<a href="liste.jsp?reset=true">♻️ Réinitialiser toutes les tâches</a></p>

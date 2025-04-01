<%@ page import="java.util.*" %>
<%@ include file="task_class.jsp" %>

<%
    List<Task> tasks;

    // Sécurité : tenter de récupérer la liste, sinon reset session
    try {
        tasks = (List<Task>) session.getAttribute("tasks");
    } catch (Exception e) {
        session.invalidate();
        response.sendRedirect("liste.jsp");
        return;
    }

    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Traitement des actions : supprimer ou marquer comme terminée
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

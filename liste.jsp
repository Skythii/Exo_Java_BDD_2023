<%@ page import="java.util.*" %>

<%! 
    public class Task {
        private String title;
        private String description;
        private String dueDate;
        private boolean isDone;

        public Task(String title, String description, String dueDate) {
            this.title = title;
            this.description = description;
            this.dueDate = dueDate;
            this.isDone = false;
        }

        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public String getDueDate() { return dueDate; }
        public boolean isDone() { return isDone; }
        public void setDone(boolean done) { this.isDone = done; }
    }
%>

<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    String action = request.getParameter("action");
    String indexStr = request.getParameter("index");

    if (action != null && indexStr != null) {
        int index = Integer.parseInt(indexStr);
        if (index < tasks.size()) {
            if ("delete".equals(action)) {
                tasks.remove(index);
            } else if ("done".equals(action)) {
                tasks.get(index).setDone(true);
            }
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
    <div style="border:1px solid #ccc; margin:10px; padding:10px;">
        <strong><%= t.getTitle() %></strong> - <%= t.isDone() ? "✔️ Terminée" : "⏳ En cours" %><br>
        Description : <%= t.getDescription() %><br>
        Échéance : <%= t.getDueDate() %><br>
        <a href="list.jsp?action=done&index=<%= i %>">Marquer comme terminée</a> |
        <a href="list.jsp?action=delete&index=<%= i %>">Supprimer</a>
    </div>
<%
        }
    }
%>

<a href="ajout.jsp">Ajouter une nouvelle tâche</a>

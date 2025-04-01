<%@ page import="java.util.*" %>
<%@ include file="task_class.jsp" %>

<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    if (title != null && !title.isEmpty()) {
        Task t = new Task(title, description, dueDate);
        tasks.add(t);
%>
        <p style="color: green;">✅ Tâche "<strong><%= title %></strong>" ajoutée avec succès !</p>
<%
    }
%>

<h2>Ajouter une tâche</h2>
<form method="post">
    Titre : <input type="text" name="title" required><br><br>
    Description : <br>
    <textarea name="description" rows="4" cols="50"></textarea><br><br>
    Date d’échéance : <input type="date" name="dueDate"><br><br>
    <input type="submit" value="Ajouter">
</form>

<p><a href="liste.jsp">➡️ Voir la liste des tâches</a></p>


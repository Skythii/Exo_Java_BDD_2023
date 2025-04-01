<%@ page import="java.util.*" %>
<%@ include file="task_class.jsp" %>

<%
    // Récupération brute depuis session
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
        response.sendRedirect("ajout.jsp");
        return;
    }

    // Traitement de l'ajout de tâche
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    if (title != null && !title.isEmpty()) {
        Task t = new Task(title, description, dueDate);
        tasks.add(t);
        session.setAttribute("tasks", tasks);
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

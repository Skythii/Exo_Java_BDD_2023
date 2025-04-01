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

    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("dueDate");

    if (title != null && !title.isEmpty()) {
        Task t = new Task(title, description, dueDate);
        tasks.add(t);
    }
%>

<h2>Ajouter une tâche</h2>
<form method="post">
    Titre : <input type="text" name="title"><br>
    Description : <textarea name="description"></textarea><br>
    Date d’échéance : <input type="date" name="dueDate"><br>
    <input type="submit" value="Ajouter">
</form>
<a href="list.jsp">Voir les tâches</a>

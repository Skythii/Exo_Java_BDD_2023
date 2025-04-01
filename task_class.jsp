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

        public void setDone(boolean done) {
            this.isDone = done;
        }
    }
%>

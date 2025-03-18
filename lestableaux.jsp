<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<% String chaine = request.getParameter("chaine"); %>
    
<% if (chaine != null && !chaine.trim().isEmpty()) { %>
    <% String[] tableauDeChiffres = chaine.trim().split("\\s+");
       int[] nombres = new int[tableauDeChiffres.length];
       for (int i = 0; i < tableauDeChiffres.length; i++) {
           nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
       }
    %>
    
    <p>Le tableau contient <%= nombres.length %> valeurs</p>
    
    <%-- Exercice 1 : Carré de la première valeur --%>
    <p>Le carré de la première valeur est : <%= nombres[0] * nombres[0] %></p>

    <%-- Exercice 2 : Somme des deux premières valeurs --%>
    <p>La somme des deux premières valeurs est : <%= nombres[0] + nombres[1] %></p>
    
    <%-- Exercice 3 : Somme de toutes les valeurs --%>
    <% int somme = 0;
       for (int nombre : nombres) {
           somme += nombre;
       }
    %>
    <p>La somme de toutes les valeurs est : <%= somme %></p>
    
    <%-- Exercice 4 : Valeur maximale --%>
    <% int max = nombres[0];
       for (int nombre : nombres) {
           if (nombre > max) {
               max = nombre;
           }
       }
    %>
    <p>La valeur maximale est : <%= max %></p>
    
    <%-- Exercice 5 : Valeur minimale --%>
    <% int min = nombres[0];
       for (int nombre : nombres) {
           if (nombre < min) {
               min = nombre;
           }
       }
    %>
    <p>La valeur minimale est : <%= min %></p>
    
    <%-- Exercice 6 : Valeur la plus proche de 0 --%>
    <% int closestToZero = nombres[0];
       for (int nombre : nombres) {
           if (Math.abs(nombre) < Math.abs(closestToZero)) {
               closestToZero = nombre;
           }
       }
    %>
    <p>La valeur la plus proche de 0 est : <%= closestToZero %></p>
    
    <%-- Exercice 7 : Valeur la plus proche de 0 (version avec priorité au positif) --%>
    <% int closestToZeroPriorityPositive = nombres[0];
       for (int nombre : nombres) {
           if (Math.abs(nombre) < Math.abs(closestToZeroPriorityPositive) || 
              (Math.abs(nombre) == Math.abs(closestToZeroPriorityPositive) && nombre > 0)) {
               closestToZeroPriorityPositive = nombre;
           }
       }
    %>
    <p>La valeur la plus proche de 0 (priorité au positif) est : <%= closestToZeroPriorityPositive %></p>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

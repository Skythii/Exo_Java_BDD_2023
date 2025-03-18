<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de caractères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" name="chaine"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération de la valeur saisie --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null && chaine.length() >= 6) { %>
    <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères</p>
    <p>Le 3° caractère de votre chaine est la lettre <%= chaine.charAt(2) %></p>
    <p>Une sous chaine de votre texte : <%= chaine.substring(2, 6) %></p>
    <p>Votre premier "e" est en : <%= chaine.indexOf('e') %></p>

    <h2>Exercice 1 : Combien de 'e' dans notre chaine de caractères ?</h2>
    <% int countE = 0;
       for (char c : chaine.toCharArray()) {
           if (c == 'e') countE++;
       }
    %>
    <p>Nombre de 'e' dans la chaîne : <%= countE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <% for (char c : chaine.toCharArray()) { %>
        <p><%= c %></p>
    <% } %>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <% String[] mots = chaine.split(" "); %>
    <% for (String mot : mots) { %>
        <p><%= mot %></p>
    <% } %>

    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <% StringBuilder uneLettreSurDeux = new StringBuilder();
       for (int i = 0; i < chaine.length(); i += 2) {
           uneLettreSurDeux.append(chaine.charAt(i));
       }
    %>
    <p><%= uneLettreSurDeux.toString() %></p>

    <h2>Exercice 5 : La phrase en verlant</h2>
    <% StringBuilder verlant = new StringBuilder(chaine).reverse(); %>
    <p><%= verlant.toString() %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <% int voyelles = 0, consonnes = 0;
       String voyellesStr = "aeiouyAEIOUY";
       for (char c : chaine.toCharArray()) {
           if (Character.isLetter(c)) {
               if (voyellesStr.indexOf(c) != -1) {
                   voyelles++;
               } else {
                   consonnes++;
               }
           }
       }
    %>
    <p>Nombre de voyelles : <%= voyelles %></p>
    <p>Nombre de consonnes : <%= consonnes %></p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

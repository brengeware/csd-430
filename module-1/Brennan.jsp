<!DOCTYPE html>
<!-- Brennan Cheatwood - CSD430 Assignment 1.3 -->
<html>
<head>
    <meta charset="UTF-8">
    <title>Brennan JSP</title>
</head>

<body>
    <h1>Woah! This is a JSP file running through Tomcat.</h1>

    <%

        String name = "Bellevue";
        int year = java.time.Year.now().getValue();
    
    %>

    <p>Hey, <%= name %>!</p>
    <p>In case you didn't know somehow, we're in the year <%= year %>!</p>

    <%
        for (int i = 1; i <= 5; i++) {
            %>
            <p>Line number <%= i %></p>
            <%
        }
    %>


</body>
</html>
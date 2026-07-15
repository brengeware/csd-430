<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Record Here</title>
</head>
<body>

  <h1>crUd Update</h1>
  
    <jsp:useBean id='myDB' class='database.DbBean' />
    
    <br /> <a href="index_02.html">index 02.html</a> <br />
        
    <%
    if(request.getMethod().equals("GET")){
    	
    	String value = myDB.formGetCreateOrUpdate("CRUD_Update.jsp");
    	
    	out.print(value);
    }
    %>
    
    <%
    if(request.getMethod().equals("POST")){
    	
    	myDB.updateRecord(request.getParameter("winningTeams"),
    			request.getParameter("city"),
    			Integer.parseInt(request.getParameter("year")),
    			request.getParameter("loserTeam"),
    			request.getParameter("loserCity"));
    	
    	out.println("<br /><br />");

    	out.print(myDB.read(Integer.parseInt(request.getParameter("year"))));    	
    	
    	out.println("<br /><br />");
    	
    	out.print(myDB.readAll());
    }
    %>
    
</body>
</html>
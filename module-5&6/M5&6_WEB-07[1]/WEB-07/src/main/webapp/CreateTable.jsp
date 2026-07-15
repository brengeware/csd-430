<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
 Professor Darrell Payne
 Bellevue University
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Create Table 06-2</title>
    </head>
    <body>
        <h1>JSP Create Table MySQL 5</h1>
        
        <jsp:useBean id='setupDB' class='configBean.ConfigProject' />
        
  <br /> <a href="index.html">index.html</a> <br />   
  
  <%
	 
	  try{
		  
		  out.print(setupDB.createTable());
	  }
	  catch(Exception e){
		  out.print("here");
	  }
  	 
  %>     
    </body>
</html>

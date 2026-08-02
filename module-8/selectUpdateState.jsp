<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Load the list of state keys to populate the dropdown menu.
    // This runs before any HTML output so the list is ready when the page renders.
    List<beans.StateBean> stateKeys = null;
    try {
        stateKeys = stateBean.getAllStateKeys();
    } catch (Exception e) {
        // stateKeys stays null and is handled below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select a State to Update</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #2c3e50; }
        select, input[type=submit] { padding: 6px; font-size: 14px; }
    </style>
</head>
<body>

<h1>Update a State Record</h1>
<p>Select a state from the dropdown below to load its current data. On the next page you will be able to edit every field except the state ID, which stays fixed since it is the record's key.</p>

<form method="post" action="loadUpdateForm.jsp">
    <label for="stateId">Choose a state to update:</label>
    <select name="stateId" id="stateId">
<%
        // Build one dropdown option per state key
        if (stateKeys != null) {
            for (int i = 0; i < stateKeys.size(); i++) {
                beans.StateBean row = stateKeys.get(i);
%>
        <option value="<%= row.getStateId() %>"><%= row.getStateName() %></option>
<%
            }
        }
%>
    </select>
    <br><br>
    <input type="submit" value="Load Record">
</form>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Load the list of state keys to populate the dropdown menu.
    // This must run before any HTML is written so the list is ready to loop through below.
    List<beans.StateBean> stateKeys = null;
    try {
        stateKeys = stateBean.getAllStateKeys();
    } catch (Exception e) {
        // If the query fails, stateKeys stays null and is handled below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select a State</title>
</head>
<body>

<h1>CSD430 States Database</h1>
<p>This page pulls its list directly from the brennanstatesdata table. Pick a state from the dropdown below and submit to see the full record, including capital, population, region, and year admitted to the Union.</p>

<form method="post" action="displayState.jsp">
    <label for="stateId">Choose a state:</label>
    <select name="stateId" id="stateId">
<%
        // Loop through the list of states and build one option per record.
        // This is the only Java allowed inside the loop - all surrounding tags stay outside scriptlets.
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
    <input type="submit" value="View State Record">
</form>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
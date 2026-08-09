<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Read the submitted form fields
    String stateName = request.getParameter("stateName");
    String capital = request.getParameter("capital");
    int population = Integer.parseInt(request.getParameter("population"));
    String region = request.getParameter("region");
    int yearAdmitted = Integer.parseInt(request.getParameter("yearAdmitted"));

    // Insert the new record through the bean
    String errorMessage = null;
    try {
        stateBean.insertState(stateName, capital, population, region, yearAdmitted);
    } catch (Exception e) {
        errorMessage = e.getMessage();
    }

    // Retrieve the full updated list of records to display, regardless of insert outcome
    List<beans.StateBean> allStates = null;
    try {
        allStates = stateBean.getAllStates();
    } catch (Exception e) {
        // allStates stays null, handled in display section below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>All State Records</title>
</head>
<body>

<h1>All State Records</h1>
<p>This is the complete brennanstatesdata table, including the new record you just submitted. Every state is listed with its capital, population, region, and the year it was admitted to the Union.</p>

<%
    if (errorMessage != null) {
%>
<p>There was a problem adding your record: <%= errorMessage %></p>
<%
    }
%>

<%
    if (allStates != null) {
%>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>State ID</th>
            <th>State Name</th>
            <th>Capital</th>
            <th>Population</th>
            <th>Region</th>
            <th>Year Admitted</th>
        </tr>
    </thead>
    <tbody>
<%
        for (int i = 0; i < allStates.size(); i++) {
            beans.StateBean row = allStates.get(i);
%>
        <tr>
            <td><%= row.getStateId() %></td>
            <td><%= row.getStateName() %></td>
            <td><%= row.getCapital() %></td>
            <td><%= row.getPopulation() %></td>
            <td><%= row.getRegion() %></td>
            <td><%= row.getYearAdmitted() %></td>
        </tr>
<%
        }
%>
    </tbody>
</table>
<%
    } else {
%>
<p>Unable to retrieve records at this time.</p>
<%
    }
%>

<br><a href="addStateForm.jsp">Add Another State</a>
<br><a href="index.jsp">Back to Home</a>
</body>
</html>
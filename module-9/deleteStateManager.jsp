<%-- CSD430 Project part 4
Brennan Cheatwood
8/9/2026 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // If the form was submitted, a stateId parameter will be present.
    // Delete that record before loading the current list of remaining records.
    String deleteId = request.getParameter("stateId");
    String errorMessage = null;

    if (deleteId != null && !deleteId.isEmpty()) {
        try {
            stateBean.deleteState(Integer.parseInt(deleteId));
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
    }

    // Load the full list of remaining records, used both for the table
    // and to rebuild the dropdown of remaining keys.
    List<beans.StateBean> allStates = null;
    try {
        allStates = stateBean.getAllStates();
    } catch (Exception e) {
        errorMessage = e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete a State Record</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #2c3e50; }
        table { border-collapse: collapse; margin-top: 15px; width: 100%; }
        th, td { border: 1px solid #999; padding: 8px 12px; text-align: left; }
        th { background-color: #34495e; color: white; }
        form { margin-top: 20px; }
        select, input[type=submit] { padding: 6px; font-size: 14px; }
    </style>
</head>
<body>

<h1>Delete a State Record</h1>
<p>This page shows every record currently in the brennanstatesdata table, including state name, capital, population, region, and year admitted. Select a state from the dropdown below and submit to remove it. The table and dropdown will refresh to reflect only the records that remain.</p>

<%
    if (errorMessage != null) {
%>
<p>There was a problem processing your request: <%= errorMessage %></p>
<%
    }
%>

<table>
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
    // Loop through remaining records and build one row per state.
    // If the list is empty, the loop simply produces no rows, leaving
    // the thead visible with an empty table body, as required.
    if (allStates != null) {
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
    }
%>
    </tbody>
</table>

<%
    // Only show the delete form and dropdown if there are still records left to delete.
    if (allStates != null && allStates.size() > 0) {
%>
<form method="post" action="deleteStateManager.jsp">
    <label for="stateId">Select a state to delete:</label>
    <select name="stateId" id="stateId">
<%
        for (int i = 0; i < allStates.size(); i++) {
            beans.StateBean row = allStates.get(i);
%>
        <option value="<%= row.getStateId() %>"><%= row.getStateName() %></option>
<%
        }
%>
    </select>
    <input type="submit" value="Delete Selected State">
</form>
<%
    } else {
%>
<p>All records have been deleted. Run the populate script again to restore data if needed.</p>
<%
    }
%>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
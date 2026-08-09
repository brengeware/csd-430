<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Read the selected key from the submitted form and look up the full record.
    // All lookup logic happens here, before any HTML output begins.
    int selectedId = Integer.parseInt(request.getParameter("stateId"));
    beans.StateBean record = null;
    try {
        record = stateBean.getStateById(selectedId);
    } catch (Exception e) {
        // record stays null if the lookup fails, handled in the display section below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>State Record</title>
</head>
<body>

<h1>State Record Detail</h1>
<p>Below is the full record for the state you selected, pulled from the brennanstatesdata table using the state_id primary key.</p>

<%
    if (record != null) {
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
        <tr>
            <td><%= record.getStateId() %></td>
            <td><%= record.getStateName() %></td>
            <td><%= record.getCapital() %></td>
            <td><%= record.getPopulation() %></td>
            <td><%= record.getRegion() %></td>
            <td><%= record.getYearAdmitted() %></td>
        </tr>
    </tbody>
</table>
<%
    } else {
%>
<p>No record was found for the selected state.</p>
<%
    }
%>

<br><a href="selectState.jsp">Select Another State</a>
<br><a href="index.jsp">Back to Home</a>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Look up the full record for the selected key
    int selectedId = Integer.parseInt(request.getParameter("stateId"));
    beans.StateBean record = null;
    try {
        record = stateBean.getStateById(selectedId);
    } catch (Exception e) {
        // record stays null, handled in display section below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit State Record</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #2c3e50; }
        label { display: inline-block; width: 130px; }
        input[readonly] { background-color: #eeeeee; }
        input, td { padding: 6px; }
    </style>
</head>
<body>

<h1>Edit State Record</h1>
<p>Update the fields below as needed. The state ID is shown for reference only and cannot be changed since it is the table's primary key.</p>

<%
    if (record != null) {
%>
<form method="post" action="processUpdateState.jsp">
    <label for="stateId">State ID:</label>
    <input type="text" name="stateId" id="stateId" value="<%= record.getStateId() %>" readonly><br><br>

    <label for="stateName">State Name:</label>
    <input type="text" name="stateName" id="stateName" value="<%= record.getStateName() %>" required><br><br>

    <label for="capital">Capital:</label>
    <input type="text" name="capital" id="capital" value="<%= record.getCapital() %>" required><br><br>

    <label for="population">Population:</label>
    <input type="number" name="population" id="population" value="<%= record.getPopulation() %>" required><br><br>

    <label for="region">Region:</label>
    <input type="text" name="region" id="region" value="<%= record.getRegion() %>" required><br><br>

    <label for="yearAdmitted">Year Admitted:</label>
    <input type="number" name="yearAdmitted" id="yearAdmitted" value="<%= record.getYearAdmitted() %>" required><br><br>

    <input type="submit" value="Update Record">
</form>
<%
    } else {
%>
<p>No record was found for the selected state.</p>
<%
    }
%>

<br><a href="selectUpdateState.jsp">Choose a Different State</a>
<br><a href="index.jsp">Back to Home</a>
</body>
</html>
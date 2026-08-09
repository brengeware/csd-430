<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="stateBean" class="beans.StateBean" scope="page" />

<%
    // Read the submitted, edited field values
    int stateId = Integer.parseInt(request.getParameter("stateId"));
    String stateName = request.getParameter("stateName");
    String capital = request.getParameter("capital");
    int population = Integer.parseInt(request.getParameter("population"));
    String region = request.getParameter("region");
    int yearAdmitted = Integer.parseInt(request.getParameter("yearAdmitted"));

    // Apply the update through the bean
    String errorMessage = null;
    try {
        stateBean.updateStateRecord(stateId, stateName, capital, population, region, yearAdmitted);
    } catch (Exception e) {
        errorMessage = e.getMessage();
    }

    // Retrieve the freshly updated record to confirm the change was saved
    beans.StateBean updatedRecord = null;
    try {
        updatedRecord = stateBean.getStateById(stateId);
    } catch (Exception e) {
        // updatedRecord stays null, handled in display section below
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Updated State Record</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #2c3e50; }
        table { border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #999; padding: 8px 12px; text-align: left; }
        th { background-color: #34495e; color: white; }
        .field-type { font-size: 11px; font-weight: normal; display: block; color: #dddddd; }
    </style>
</head>
<body>

<h1>Record Updated</h1>
<p>The brennanstatesdata table has been updated with your changes. The confirmed values now stored in the database are shown below, along with each field's data type.</p>

<%
    if (errorMessage != null) {
%>
<p>There was a problem updating this record: <%= errorMessage %></p>
<%
    }
%>

<%
    if (updatedRecord != null) {
%>
<table>
    <thead>
        <tr>
            <th>State ID<span class="field-type">INT</span></th>
            <th>State Name<span class="field-type">VARCHAR</span></th>
            <th>Capital<span class="field-type">VARCHAR</span></th>
            <th>Population<span class="field-type">INT</span></th>
            <th>Region<span class="field-type">VARCHAR</span></th>
            <th>Year Admitted<span class="field-type">INT</span></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= updatedRecord.getStateId() %></td>
            <td><%= updatedRecord.getStateName() %></td>
            <td><%= updatedRecord.getCapital() %></td>
            <td><%= updatedRecord.getPopulation() %></td>
            <td><%= updatedRecord.getRegion() %></td>
            <td><%= updatedRecord.getYearAdmitted() %></td>
        </tr>
    </tbody>
</table>
<%
    } else {
%>
<p>Unable to retrieve the updated record.</p>
<%
    }
%>

<br><a href="selectUpdateState.jsp">Update Another Record</a>
<br><a href="index.jsp">Back to Home</a>
</body>
</html>
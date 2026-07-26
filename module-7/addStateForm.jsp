<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add a New State</title>
</head>
<body>

<h1>Add a New State Record</h1>
<p>Use the form below to add a new state to the brennanstatesdata table. The state_id key is generated automatically by the database, so you do not need to enter one. After submitting, you will see the full updated list of all states in the table.</p>

<form method="post" action="processAddState.jsp">
    <label for="stateName">State Name:</label>
    <input type="text" name="stateName" id="stateName" required><br><br>

    <label for="capital">Capital:</label>
    <input type="text" name="capital" id="capital" required><br><br>

    <label for="population">Population:</label>
    <input type="number" name="population" id="population" required><br><br>

    <label for="region">Region:</label>
    <input type="text" name="region" id="region" required><br><br>

    <label for="yearAdmitted">Year Admitted:</label>
    <input type="number" name="yearAdmitted" id="yearAdmitted" required><br><br>

    <input type="submit" value="Add State">
</form>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
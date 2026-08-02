<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>View States</title></head>
<body>
<h1>All State Records</h1>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>State Name</th>
        <th>Capital</th>
        <th>Population</th>
        <th>Region</th>
        <th>Year Admitted</th>
    </tr>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM brennanstatesdata");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("state_id") %></td>
        <td><%= rs.getString("state_name") %></td>
        <td><%= rs.getString("capital") %></td>
        <td><%= rs.getInt("population") %></td>
        <td><%= rs.getString("region") %></td>
        <td><%= rs.getInt("year_admitted") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
%>
    <tr><td colspan="6">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</table>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
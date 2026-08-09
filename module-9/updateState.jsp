<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Update State</title></head>
<body>
<h1>Update a State Record</h1>

<form method="post" action="updateState.jsp">
    State ID to Update: <input type="number" name="stateId" required><br><br>
    New State Name: <input type="text" name="stateName" required><br><br>
    New Capital: <input type="text" name="capital" required><br><br>
    New Population: <input type="number" name="population" required><br><br>
    New Region: <input type="text" name="region" required><br><br>
    New Year Admitted: <input type="number" name="yearAdmitted" required><br><br>
    <input type="submit" value="Update Record">
</form>

<%
    String stateIdParam = request.getParameter("stateId");
    if (stateIdParam != null && !stateIdParam.isEmpty()) {
        int stateId = Integer.parseInt(stateIdParam);
        String stateName = request.getParameter("stateName");
        String capital = request.getParameter("capital");
        int population = Integer.parseInt(request.getParameter("population"));
        String region = request.getParameter("region");
        int yearAdmitted = Integer.parseInt(request.getParameter("yearAdmitted"));

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            String sql = "UPDATE brennanstatesdata SET state_name = ?, capital = ?, population = ?, region = ?, year_admitted = ? WHERE state_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, stateName);
            ps.setString(2, capital);
            ps.setInt(3, population);
            ps.setString(4, region);
            ps.setInt(5, yearAdmitted);
            ps.setInt(6, stateId);
            int rows = ps.executeUpdate();
%>
            <p><%= rows %> record(s) updated successfully!</p>
<%
        } catch (Exception e) {
%>
            <p>Error: <%= e.getMessage() %></p>
<%
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>

<br><a href="index.jsp">Back to Home</a>
</body>
</html>
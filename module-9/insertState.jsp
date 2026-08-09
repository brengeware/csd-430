<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Insert State</title></head>
<body>
<h1>Insert a New State Record</h1>

<form method="post" action="insertState.jsp">
    State Name: <input type="text" name="stateName" required><br><br>
    Capital: <input type="text" name="capital" required><br><br>
    Population: <input type="number" name="population" required><br><br>
    Region: <input type="text" name="region" required><br><br>
    Year Admitted: <input type="number" name="yearAdmitted" required><br><br>
    <input type="submit" value="Insert Record">
</form>

<%
    String stateName = request.getParameter("stateName");
    if (stateName != null && !stateName.isEmpty()) {
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

            String sql = "INSERT INTO brennanstatesdata (state_name, capital, population, region, year_admitted) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, stateName);
            ps.setString(2, capital);
            ps.setInt(3, population);
            ps.setString(4, region);
            ps.setInt(5, yearAdmitted);
            ps.executeUpdate();
%>
            <p>Record inserted successfully!</p>
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
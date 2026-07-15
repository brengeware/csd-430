<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Delete State</title></head>
<body>
<h1>Delete a State Record</h1>

<form method="post" action="deleteState.jsp">
    State ID to Delete: <input type="number" name="stateId" required><br><br>
    <input type="submit" value="Delete Record">
</form>

<%
    String stateIdParam = request.getParameter("stateId");
    if (stateIdParam != null && !stateIdParam.isEmpty()) {
        int stateId = Integer.parseInt(stateIdParam);

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            String sql = "DELETE FROM brennanstatesdata WHERE state_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, stateId);
            int rows = ps.executeUpdate();
%>
            <p><%= rows %> record(s) deleted successfully!</p>
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
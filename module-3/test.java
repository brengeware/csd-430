public class test {
    public static void main(String [] args) {



        
String username = request.getParameter("username");

if (username == null || username.trim().isEmpty()) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Username is required.");
    return;
}

if (!username.matches("[a-zA-Z0-9]{3,20}")) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid username format.");
    return;
}



    }
}

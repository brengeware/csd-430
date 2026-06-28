<%--
    feedback_results.jsp
    Author: Brennan Cheatwood
    Date: 6/28/2026
    Class: CSD430
    Description: This page receives the form data from feedback_form.jsp
    and displays it back to the user in an HTML table. I'm using scriptlets
    to grab each field from the request and then print them out in the table.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- grab all the form values from the POST request --%>
<%
    // get the basic info fields
    String guestName   = request.getParameter("guestName");
    String guestEmail  = request.getParameter("guestEmail");
    String visitDate   = request.getParameter("visitDate");

    // get the meal info fields
    String mealType    = request.getParameter("mealType");
    String dishOrdered = request.getParameter("dishOrdered");

    // checkboxes come back as an array since multiple can be checked
    String[] dietaryArr = request.getParameterValues("dietary");

    // get the rating fields
    String foodRating    = request.getParameter("foodRating");
    String serviceRating = request.getParameter("serviceRating");
    String wouldReturn   = request.getParameter("wouldReturn");

    // get the comments
    String comments = request.getParameter("comments");
%>

<%-- now I need to do some cleanup before displaying the data --%>
<%
    // if email was left blank just show "Not provided" instead of null
    String safeEmail = (guestEmail != null && !guestEmail.trim().isEmpty())
                       ? guestEmail : "Not provided";

    // same thing for comments - show a message if they left it empty
    String safeComments = (comments != null && !comments.trim().isEmpty())
                          ? comments : "No comments left.";

    // build a string from the dietary checkbox array
    // I need to loop through it since it could have multiple values
    String dietaryDisplay = "None selected";
    if (dietaryArr != null && dietaryArr.length > 0) {
        String combined = "";
        for (int i = 0; i < dietaryArr.length; i++) {
            combined = combined + dietaryArr[i];
            // add a comma after each one except the last
            if (i < dietaryArr.length - 1) {
                combined = combined + ", ";
            }
        }
        dietaryDisplay = combined;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Submitted</title>
    <style>
        /* basic page styling */
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        /* center the content in a white box */
        .container {
            background-color: white;
            max-width: 650px;
            margin: 0 auto;
            padding: 30px;
            border: 1px solid #ccc;
        }

        /* page heading */
        h1 {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            text-align: center;
            color: #333;
            margin-bottom: 5px;
        }

        /* description paragraph under the title */
        .description {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
            text-align: center;
        }

        /* section heading above each table */
        h2 {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 15px;
            color: #555;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-top: 25px;
            margin-bottom: 10px;
        }

        /* the table that shows all the submitted data */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 14px;
        }

        /* style the header cells */
        th {
            background-color: #4a90d9;
            color: white;
            padding: 8px 12px;
            text-align: left;
        }

        /* style the data cells */
        td {
            padding: 8px 12px;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        /* zebra striping to make the rows easier to read */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* box for the comments section */
        .comments-box {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 14px;
            color: #444;
        }

        /* link back to the form */
        .back-link {
            text-align: center;
            margin-top: 25px;
        }

        .back-link a {
            color: #4a90d9;
            font-size: 14px;
        }

        /* footer note at the bottom */
        .footer-note {
            text-align: center;
            font-size: 12px;
            color: #aaa;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- page heading - I used the guests name from the form here -->
    <h1>Thanks for your feedback, <%= guestName %>!</h1>
    <p class="description">Here's a summary of everything you submitted. Each field from the form is shown below in the table.</p>

    <!-- first table shows their personal info and meal info -->
    <h2>Your Info &amp; Meal Details</h2>

    <table>
        <!-- column headers for the table -->
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>

        <!-- print out each field they submitted -->
        <tr>
            <td>Name</td>
            <%-- print the guest name from the form --%>
            <td><%= guestName %></td>
        </tr>
        <tr>
            <td>Email</td>
            <%-- using safeEmail so it doesnt show null if they left it blank --%>
            <td><%= safeEmail %></td>
        </tr>
        <tr>
            <td>Date of Visit</td>
            <%-- print the date they visited --%>
            <td><%= visitDate %></td>
        </tr>
        <tr>
            <td>Meal Type</td>
            <%-- print which meal service they picked from the dropdown --%>
            <td><%= mealType %></td>
        </tr>
        <tr>
            <td>Dish Ordered</td>
            <%-- print what they ordered --%>
            <td><%= dishOrdered %></td>
        </tr>
        <tr>
            <td>Dietary Options</td>
            <%-- print the dietary checkboxes they checked --%>
            <td><%= dietaryDisplay %></td>
        </tr>
    </table>

    <!-- second table shows their ratings -->
    <h2>Ratings</h2>

    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>

        <tr>
            <td>Food Quality</td>
            <%-- print their food rating out of 5 --%>
            <td><%= foodRating %> / 5</td>
        </tr>
        <tr>
            <td>Service Quality</td>
            <%-- print their service rating out of 5 --%>
            <td><%= serviceRating %> / 5</td>
        </tr>
        <tr>
            <td>Would Return?</td>
            <%-- print whether they said they would come back --%>
            <td><%= wouldReturn %></td>
        </tr>
    </table>

    <!-- comments section below the tables -->
    <h2>Additional Comments</h2>

    <%-- print their comments, or the fallback message if they left it blank --%>
    <div class="comments-box"><%= safeComments %></div>

    <!-- link back to the form in case they want to submit again -->
    <div class="back-link">
        <a href="feedback_form.jsp">&larr; Go back to the form</a>
    </div>

    <p class="footer-note">Restaurant Feedback Form - Server-Side Development</p>

</div>

</body>
</html>

<%-- ================================================
     roadtrip-bean.jsp
     Author: Brennan Cheatwood
     Date: 7/5/26
     CSD430 - ServerSide Development

     Description: This page uses a JavaBean called
     RoadTripStop to hold the data for my California
     road trip. The scriptlets create the bean objects
     and set their fields, then a loop pulls the data
     back out of each bean to build the table. All the
     HTML tags stay outside the scriptlet tags like the
     assignment asks for.
     ================================================ --%>

<%-- Page directive, sets the language and character encoding --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- Importing my JavaBean class and ArrayList so I can hold a list of beans --%>
<%@ page import="beans.RoadTripStop" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>California Road Trip - JavaBean Version</title>

    <%-- Reusing the same CSS file from Module 2 --%>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <%-- Page header, plain HTML --%>
    <header>
        <h1>California Road Trip</h1>
        <p class="subtitle">
            This page shows the same road trip data from my Module 2 assignment,
            but now the data is stored inside a JavaBean called RoadTripStop
            instead of just plain arrays.
        </p>
    </header>

    <main>

        <%-- ================================================
             SCRIPTLET #1: This is where I build the bean
             objects. Each RoadTripStop object holds all 5
             fields for one stop on the trip. I am using an
             ArrayList to hold all 5 bean objects so the
             loop later can go through each one.
             ================================================ --%>
        <%
            // This list will hold one JavaBean per stop
            ArrayList<RoadTripStop> stops = new ArrayList<RoadTripStop>();

            // Stop 1
            RoadTripStop stop1 = new RoadTripStop();
            stop1.setStopNumber(1);
            stop1.setLocation("Chilcoot-Vinton");
            stop1.setRegion("Northern CA, Plumas County, CA/NV Border");
            stop1.setExperience("Camped at a campground right on the California Nevada state border. Quiet, scenic, and a great way to start the trip.");
            stop1.setCategory("Camping");
            stops.add(stop1);

            // Stop 2
            RoadTripStop stop2 = new RoadTripStop();
            stop2.setStopNumber(2);
            stop2.setLocation("Gualala");
            stop2.setRegion("Northern California Coast, Mendocino County");
            stop2.setExperience("Drove out to the coast and really loved this small town. Great cliffs, ocean views, and a really chill atmosphere.");
            stop2.setCategory("Coastal Town");
            stops.add(stop2);

            // Stop 3
            RoadTripStop stop3 = new RoadTripStop();
            stop3.setStopNumber(3);
            stop3.setLocation("San Francisco to Monterey (CA-1 / PCH)");
            stop3.setRegion("Central California Coast, Highway 1");
            stop3.setExperience("Drove PCH south from San Francisco all the way down to Monterey. Saw a ton of sea lions along the way.");
            stop3.setCategory("Scenic Drive");
            stops.add(stop3);

            // Stop 4
            RoadTripStop stop4 = new RoadTripStop();
            stop4.setStopNumber(4);
            stop4.setLocation("Bakersfield");
            stop4.setRegion("Central Valley, Kern County");
            stop4.setExperience("Passed through on the drive south. Big agricultural and oil city in the middle of the San Joaquin Valley.");
            stop4.setCategory("City Pass Through");
            stops.add(stop4);

            // Stop 5
            RoadTripStop stop5 = new RoadTripStop();
            stop5.setStopNumber(5);
            stop5.setLocation("Needles");
            stop5.setRegion("Inland Desert, San Bernardino County");
            stop5.setExperience("Our van broke down here in the middle of summer heat. We ended up stuck for 4 days before renting a U-Haul and driving to Phoenix to fly home.");
            stop5.setCategory("Breakdown / Delay");
            stops.add(stop5);

            // Saving the total number of stops so I can use it later
            int totalRecords = stops.size();
        %>

        <%-- Table heading and overall description, plain HTML --%>
        <h2>Road Trip Stops: JavaBean Data Table</h2>
        <p class="section-desc">
            Each row below is one RoadTripStop bean. The table is built by
            a loop in a scriptlet that reads each field back out of the
            bean using its getter methods.
        </p>

        <%-- Table structure, tags stay outside the scriptlets --%>
        <table>
            <thead>
                <tr>
                    <th>Stop #</th>
                    <th>Location</th>
                    <th>Region / Type of Stop</th>
                    <th>Notable Experience</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>

                <%-- ================================================
                     SCRIPTLET #2: Loop through the ArrayList of
                     beans. The for loop is inside the scriptlet, but
                     the tr and td tags are outside it. Each getter
                     call pulls one field back out of the bean.
                     ================================================ --%>
                <%
                    for (int i = 0; i < totalRecords; i++) {
                        RoadTripStop currentStop = stops.get(i);
                %>
                        <tr>
                            <td><%= currentStop.getStopNumber() %></td>
                            <td><%= currentStop.getLocation() %></td>
                            <td><%= currentStop.getRegion() %></td>
                            <td><%= currentStop.getExperience() %></td>
                            <td><%= currentStop.getCategory() %></td>
                        </tr>
                <%
                    } // end for loop
                %>

            </tbody>
        </table>

        <%-- Field descriptions, explains what each column and the bean fields mean --%>
        <div class="legend">
            <strong>Field Descriptions:</strong>
            <ul>
                <li><strong>Stop Number:</strong> The order of the stop on the trip, first through fifth.</li>
                <li><strong>Location:</strong> The name of the city, town, or area I visited.</li>
                <li><strong>Region / Type of Stop:</strong> The broader area and county the location is in.</li>
                <li><strong>Notable Experience:</strong> A short note on what stood out or happened at that stop.</li>
                <li><strong>Category:</strong> A quick label for what kind of stop it was, like camping or a scenic drive.</li>
            </ul>
        </div>

        <%-- ================================================
             SCRIPTLET #3: Using a JSP expression to print the
             total record count inside the summary paragraph.
             ================================================ --%>
        <h2>Trip Summary</h2>
        <p class="section-desc">
            This table has <strong><%= totalRecords %> stops</strong> from my California road trip,
            now stored as RoadTripStop JavaBean objects instead of plain arrays. We started near
            the Nevada border, drove west to the coast, followed PCH down through San Francisco
            and Monterey, then cut inland through Bakersfield. The trip ended with our van breaking
            down in Needles before we took a U-Haul to Phoenix and flew back home to Knoxville.
        </p>

        <p class="section-desc">
            Overall Data Description: This data set is a personal travel log made up of 5 records,
            with each record represented by one RoadTripStop JavaBean. Every bean stores 5 fields
            of information about a single stop on the trip, and the JSP page above uses the bean
            getters and setters to move that data from Java code into an HTML table.
        </p>

    </main>

    <%-- Page footer --%>
    <footer>
        Created by Brennan Cheatwood for CSD430.
        California Road Trip Data displayed using a RoadTripStop JavaBean, scriptlets, and external CSS (styles.css).
    </footer>

</body>
</html>

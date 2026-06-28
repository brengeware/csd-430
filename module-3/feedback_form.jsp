<%--
    feedback_form.jsp
    Author: Brennan Cheatwood
    Date: 6/28/2026
    Class: CSD430
    Description: This is my restaurant feedback form. It collects info
    from the user like their name, email, visit date, what they ordered,
    dietary stuff, ratings, and any extra comments they want to leave.
    When they submit it goes to feedback_results.jsp.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Feedback</title>
    <style>
        /* just setting a basic font and background for the whole page */
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        /* center the form on the page */
        .container {
            background-color: white;
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            border: 1px solid #ccc;
        }

        /* page title */
        h1 {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            text-align: center;
            color: #333;
            margin-bottom: 5px;
        }

        /* little description under the title */
        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
            font-size: 14px;
        }

        /* section headers to break up the form */
        h2 {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 15px;
            color: #555;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-top: 25px;
            margin-bottom: 15px;
        }

        /* wrapper div for each input so theres spacing between them */
        .field {
            margin-bottom: 15px;
        }

        /* labels above each input */
        label {
            display: block;
            font-size: 14px;
            color: #444;
            margin-bottom: 4px;
        }

        /* asterisk to show required fields */
        .req {
            color: red;
        }

        /* style for text, email, and date inputs */
        input[type="text"],
        input[type="email"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* textarea for comments */
        textarea {
            height: 80px;
            resize: vertical;
        }

        /* small gray hint text under a field */
        .hint {
            font-size: 12px;
            color: #999;
            margin-top: 3px;
        }

        /* the checkboxes and radio buttons sit next to each other */
        .checkbox-group label,
        .radio-group label {
            display: inline-block;
            margin-right: 15px;
            font-size: 14px;
            color: #444;
        }

        /* submit button */
        input[type="submit"] {
            background-color: #4a90d9;
            color: white;
            border: none;
            padding: 10px 24px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            cursor: pointer;
            margin-top: 20px;
        }

        /* hover state for the button */
        input[type="submit"]:hover {
            background-color: #357ab8;
        }

        /* little note at the bottom */
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

    <!-- page heading and description -->
    <h1>Restaurant Feedback Form</h1>
    <p class="subtitle">Let us know how your experience was. We read every response!</p>

    <!-- the form posts to feedback_results.jsp -->
    <form action="feedback_results.jsp" method="post">

        <!-- section 1: basic info about the person filling it out -->
        <h2>Your Info</h2>

        <!-- text input for their name -->
        <div class="field">
            <label for="guestName">Name <span class="req">*</span></label>
            <input type="text" id="guestName" name="guestName" placeholder="Your full name" required />
        </div>

        <!-- email input - this one is optional -->
        <div class="field">
            <label for="guestEmail">Email</label>
            <input type="email" id="guestEmail" name="guestEmail" placeholder="yourname@email.com" />
            <p class="hint">Optional - only if you want us to follow up with you.</p>
        </div>

        <!-- date input for when they visited -->
        <div class="field">
            <label for="visitDate">Date of Visit <span class="req">*</span></label>
            <input type="date" id="visitDate" name="visitDate" required />
        </div>

        <!-- section 2: stuff about their meal -->
        <h2>About Your Meal</h2>

        <!-- dropdown to pick which meal they came in for -->
        <div class="field">
            <label for="mealType">Meal Type <span class="req">*</span></label>
            <select id="mealType" name="mealType" required>
                <option value="" disabled selected>-- Select one --</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
                <option value="Brunch">Brunch</option>
                <option value="Late Night">Late Night</option>
            </select>
        </div>

        <!-- text input for what they ordered -->
        <div class="field">
            <label for="dishOrdered">Main Dish Ordered <span class="req">*</span></label>
            <input type="text" id="dishOrdered" name="dishOrdered" placeholder="e.g. Burger, Pasta, etc." required />
        </div>

        <!-- checkboxes for dietary options - multiple can be selected -->
        <div class="field">
            <label>Dietary Options (check all that apply)</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="dietary" value="Vegetarian" /> Vegetarian</label>
                <label><input type="checkbox" name="dietary" value="Vegan" /> Vegan</label>
                <label><input type="checkbox" name="dietary" value="Gluten-Free" /> Gluten-Free</label>
                <label><input type="checkbox" name="dietary" value="Dairy-Free" /> Dairy-Free</label>
                <label><input type="checkbox" name="dietary" value="None" /> None</label>
            </div>
        </div>

        <!-- section 3: ratings using radio buttons -->
        <h2>Ratings</h2>

        <!-- radio buttons for food rating 1 through 5 -->
        <div class="field">
            <label>Food Quality (1-5) <span class="req">*</span></label>
            <div class="radio-group">
                <label><input type="radio" name="foodRating" value="1" required /> 1</label>
                <label><input type="radio" name="foodRating" value="2" /> 2</label>
                <label><input type="radio" name="foodRating" value="3" /> 3</label>
                <label><input type="radio" name="foodRating" value="4" /> 4</label>
                <label><input type="radio" name="foodRating" value="5" /> 5</label>
            </div>
        </div>

        <!-- radio buttons for service rating 1 through 5 -->
        <div class="field">
            <label>Service Quality (1-5) <span class="req">*</span></label>
            <div class="radio-group">
                <label><input type="radio" name="serviceRating" value="1" required /> 1</label>
                <label><input type="radio" name="serviceRating" value="2" /> 2</label>
                <label><input type="radio" name="serviceRating" value="3" /> 3</label>
                <label><input type="radio" name="serviceRating" value="4" /> 4</label>
                <label><input type="radio" name="serviceRating" value="5" /> 5</label>
            </div>
        </div>

        <!-- radio buttons asking if theyd come back -->
        <div class="field">
            <label>Would you return? <span class="req">*</span></label>
            <div class="radio-group">
                <label><input type="radio" name="wouldReturn" value="Definitely" required /> Definitely</label>
                <label><input type="radio" name="wouldReturn" value="Probably" /> Probably</label>
                <label><input type="radio" name="wouldReturn" value="Unsure" /> Unsure</label>
                <label><input type="radio" name="wouldReturn" value="Unlikely" /> Unlikely</label>
            </div>
        </div>

        <!-- section 4: open comments box -->
        <h2>Additional Comments</h2>

        <!-- textarea for anything else they want to say -->
        <div class="field">
            <label for="comments">Comments or Suggestions</label>
            <textarea id="comments" name="comments" placeholder="Anything else you want to share..."></textarea>
        </div>

        <!-- submit button -->
        <input type="submit" value="Submit Feedback" />

    </form>

    <p class="footer-note">Fields with <span style="color:red;">*</span> are required.</p>

</div>

</body>
</html>

package beans;

import java.io.Serializable;

/*
 * RoadTripStop.java
 * Author: Brennan Cheatwood
 * Date: 7/5/26
 * CSD430 - ServerSide Development
 *
 * This is my JavaBean for Module 4. It holds the data for one stop
 * on my California road trip. I reused the data from my Module 2
 * scriptlet assignment, but added two more fields (stopNumber and
 * category) since this assignment needs at least 5 fields.
 *
 * A JavaBean needs a few things to be a real bean:
 * 1. It has to implement Serializable so it can be saved or passed around.
 * 2. It needs a no argument constructor.
 * 3. All fields are private, and every field has a public getter and setter.
 */
public class RoadTripStop implements Serializable {

    // Field 1: the order of the stop on the trip
    private int stopNumber;

    // Field 2: the name of the place I stopped at
    private String location;

    // Field 3: the region and county the stop is in
    private String region;

    // Field 4: a short note about what happened at that stop
    private String experience;

    // Field 5: what kind of stop it was, like camping or a city
    private String category;

    // No argument constructor, this is required for a JavaBean
    public RoadTripStop() {
    }

    // Getter and setter for stopNumber
    public int getStopNumber() {
        return stopNumber;
    }

    public void setStopNumber(int stopNumber) {
        this.stopNumber = stopNumber;
    }

    // Getter and setter for location
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    // Getter and setter for region
    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    // Getter and setter for experience
    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    // Getter and setter for category
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}

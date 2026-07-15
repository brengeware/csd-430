package configBean;

/* ******************************************************************
*
* Professor Darrell Payne
* Bellevue University
*
* ******************************************************************
*/
public class ConfigProject implements java.io.Serializable {

    java.sql.Connection connection;
    java.sql.Statement statement;
    
    /*
     * The serialVersionUID attribute is used to remember versions of a Serializable 
     * class.  The purpose of this is to allow verification that a loaded class 
     * and the serialized object are compatible.
     */
    private static final long serialVersionUID = 111222333444L;
    
    // ***************************************************************
    // ***************************************************************
    // ------------------------ Constructor --------------------------
    // ***************************************************************
    // ***************************************************************
    
    public ConfigProject() {
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		String url = "jdbc:mysql://localhost:3306/baseball?";
    		connection = java.sql.DriverManager.getConnection(url + "user=student5&password=pass");
    		statement = connection.createStatement();
    	}
    	catch(ClassNotFoundException cnfe) {
    		System.out.print("SQL Exception" + cnfe);
    	}
    	catch(java.sql.SQLException sqle){
    		System.out.print("SQL Exception" + sqle);
    	}
    }
    
    // ***************************************************************
    // ***************************************************************
    // ------------------------ Create Table -------------------------
    // ***************************************************************
    // ***************************************************************

    public String createTable() {
 
    	StringBuilder dataStringBuilder = new StringBuilder();

    	try{
    		statement.executeUpdate("DROP TABLE World_Series");
    		dataStringBuilder.append("<b>Table World_Series Dropped.</b><br />");
    	}
    	catch(java.sql.SQLException e){
    		dataStringBuilder.append("<b>Table World_Series does not exist.</b><br />");
    	}
    	
    	try{
    		statement.executeUpdate("CREATE TABLE World_Series(Team CHAR(20) NOT NULL, City CHAR(20) NOT NULL, Year_T INT NOT NULL PRIMARY KEY, LoserTeam CHAR(20) NOT NULL, LoserCity CHAR(20) NOT NULL)");
    		dataStringBuilder.append("<b>Table World_Series Created.</b><br />");
    	}
    	catch(java.sql.SQLException e){
    		dataStringBuilder.append("<b>Table World_Series Creation failed.</b><br />");
    	}
    	
    	return dataStringBuilder.toString();
    }
    
    // ***************************************************************
    // ***************************************************************
    // ------------------------ Populate Table -----------------------
    // ***************************************************************
    // ***************************************************************

    public String populateTable() {
    	 
    	StringBuilder dataStringBuilder = new StringBuilder();

    	try{
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 1903, 'Pirates', 'Pittsburgh')");

    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'New York', 1905, 'Athletics', 'Philadelphia')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('White Sox', 'Chicago', 1906, 'Cubs', 'Chicago')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cubs', 'Chicago', 1907, 'Tigers', 'Detroit')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cubs', 'Chicago', 1908, 'Tigers', 'Detroit')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Pirates', 'Pittsburgh', 1909, 'Tigers', 'Detroit')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Philadelphia', 1910, 'Cubs', 'Chicago')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Philadelphia', 1911, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 1912, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Philadelphia', 1913, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Braves', 'Boston', 1914, 'Athletics', 'Philadelphia')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 1915, 'Phillies', 'Philadelphia')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 1916, 'Robins', 'Brooklyn')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('White Sox', 'Chicago', 1917, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 1918, 'Cubs', 'Chicago')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Reds', 'Cincinnati', 1919, 'White Sox', 'Chicago')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Indians', 'Cleveland', 1920, 'Robins', 'Brooklyn')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'New York', 1921, 'Yankees', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'New York', 1922, 'Yankees', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1923, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Senators', 'Washington', 1924, 'Giants', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Pirates', 'Pittsburgh', 1925, 'Nationals', 'Wasnington')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1926, 'Yankees', 'New York')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1927, 'Pirates', 'Pittsburgh')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1928, 'Cardinals', 'St. Louis')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Philadelphia', 1929, 'Cubs', 'Chicago')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Philadelphia', 1930, 'Cardinals', 'St. Louis')");
    		statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1931, 'Athletics', 'Philadelphia')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1932, 'Cubs', 'Chicago')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'New York', 1933, 'Nationals', 'Wasnington')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1934, 'Tigers', 'Detroit')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Tigers', 'Detroit', 1935, 'Cubs', 'Chicago')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1936, 'Giants', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1937, 'Giants', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1938, 'Cubs', 'Chicago')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1939, 'Reds', 'Cincinnati')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Reds', 'Cincinnati', 1940, 'Tigers', 'Detroit')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1941, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1942, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1943, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1944, 'Browns', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Tigers', 'Detroit', 1945, 'Cubs', 'Chicago')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1946, 'Red Sox', 'Boston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1947, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Indians', 'Cleveland', 1948, 'Braves', 'Boston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1949, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1950, 'Phillies', 'Philadelphia')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1951, 'Giants', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1952, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1953, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'New York', 1954, 'Indians', 'Cleveland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Brooklyn', 1955, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1956, 'Dodgers', 'Brooklyn')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Braves', 'Milwaukee', 1957, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1958, 'Braves', 'Milwaukee')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 1959, 'White Sox', 'Chicago')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Pirates', 'Pittsburgh', 1960, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1961, 'Reds', 'Cincinnati')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1962, 'Giants', 'San Francisco')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 1963, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1964, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 1965, 'Twins', 'Minnesota')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Orioles', 'Baltimore', 1966, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1967, 'Red Sox', 'Boston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Tigers', 'Detroit', 1968, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Mets', 'New York', 1969, 'Orioles', 'Baltimore')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Orioles', 'Baltimore', 1970, 'Reds', 'Cincinnati')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Pirates', 'Pittsburgh', 1971, 'Orioles', 'Baltimore')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Oakland', 1972, 'Reds', 'Cincinnati')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Oakland', 1973, 'Mets', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Oakland', 1974, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Reds', 'Cincinnati', 1975, 'Red Sox', 'Boston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Reds', 'Cincinnati', 1976, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1977, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1978, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Pirates', 'Pittsburgh', 1979, 'Orioles', 'Baltimore')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Phillies', 'Philadelphia', 1980, 'Royals', 'Kansas City')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 1981, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 1982, 'Brewers', 'Milwaukee')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Orioles', 'Baltimore', 1983, 'Phillies', 'Philadelphia')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Tigers', 'Detroit', 1984, 'Padres', 'San Diego')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Royals', 'Kansas City', 1985, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Mets', 'New York', 1986, 'Red Sox', 'Boston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Twins', 'Minnesota', 1987, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 1988, 'Athletics', 'Oakland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Athletics', 'Oakland', 1989, 'Giants', 'San Francisco')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Reds', 'Cincinnati', 1990, 'Athletics', 'Oakland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Twins', 'Minnesota', 1991, 'Braves', 'Atlanta')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Blue Jays', 'Toronto', 1992, 'Braves', 'Atlanta')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Blue Jays', 'Toronto', 1993, 'Phillies', 'Philadelphia')");

            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Braves', 'Atlanta', 1995, 'Indians', 'Cleveland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1996, 'Braves', 'Atlanta')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Marlins', 'Florida', 1997, 'Indians', 'Cleveland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1998, 'Padres', 'San Diego')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 1999, 'Braves', 'Atlanta')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 2000, 'Mets', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Diamondbacks', 'Arizona', 2001, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Angels', 'Anaheim', 2002, 'Giants', 'San Francisco')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Marlins', 'Florida', 2003, 'Yankees', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 2004, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('White Sox', 'Chicago', 2005, 'Astros', 'Houston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 2006, 'Tigers', 'Detroit')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 2007, 'Rockies', 'Colorado')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Phillies', 'Philadelphia', 2008, 'Rays', 'Tampa Bay')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Yankees', 'New York', 2009, 'Phillies', 'Philadelphia')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'San Francisco', 2010, 'Rangers', 'Texas')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cardinals', 'St. Louis', 2011, 'Rangers', 'Texas')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'San Francisco', 2012, 'Tigers', 'Detroit')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 2013, 'Cardinals', 'St. Louis')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Giants', 'San Francisco', 2014, 'Royals', 'Kansas City')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Royals', 'Kansas City', 2015, 'Mets', 'New York')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Cubs', 'Chicago', 2016, 'Indians', 'Cleveland')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Astros', 'Houston', 2017, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Red Sox', 'Boston', 2018, 'Dodgers', 'Los Angeles')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Nationals', 'Washington', 2019, 'Astros', 'Houston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Dodgers', 'Los Angeles', 2020, 'Rays', 'Tampa Bay')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Braves', 'Atlanta', 2021, 'Astros', 'Houston')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Astros', 'Houston', 2022, 'Phillies', 'Philadelphia')");
            statement.executeUpdate("INSERT INTO World_Series(Team, City, Year_T, LoserTeam, LoserCity)VALUES('Rangers', 'Texas', 2023, 'Diamondbacks', 'Arizona')");

            statement.executeUpdate("COMMIT");
            
            dataStringBuilder.append("Fill of table conpleted.");
            
    	}
    	catch(java.sql.SQLException e){
    		dataStringBuilder.append("<b>Error inserting data</b><br />");
    	}
    	
    	return dataStringBuilder.toString();
    }

    // ***************************************************************
    // ***************************************************************
    // ------------------------ Read Table ---------------------------
    // ***************************************************************
    // ***************************************************************
    
    public String read() {
    	
    	StringBuilder dataStringBuilder = new StringBuilder();    	
    	
    	java.sql.ResultSet resultSet = null;   	
    	
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/baseball?";
            connection = java.sql.DriverManager.getConnection(url + "user=student5&password=pass");
            statement = connection.createStatement();
        }
    	catch(ClassNotFoundException cnfe) {
    		
    	}
    	catch(java.sql.SQLException e){
        
    	}
        try{
        	resultSet = statement.executeQuery("SELECT * FROM World_Series");
        }
        catch(java.sql.SQLException e){
        }
        
        try{
            
        	dataStringBuilder.append("<table border='1' bgcolor='FA8072'>");
            
            while(resultSet.next()){
            	dataStringBuilder.append("<tr>");
                  
              for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
            	  dataStringBuilder.append("<td>");
            	  dataStringBuilder.append((resultSet.getString(i)).trim());
            	  dataStringBuilder.append("</td>");
              }
                  
              dataStringBuilder.append("</tr>");
            }
              
            dataStringBuilder.append("</table>");            
          }
          catch(Exception e){

        	System.out.print("<b>Exception.</b><br />");
        	System.out.print(e);
          }
    	
    	return dataStringBuilder.toString();
    }
  
    // ***************************************************************
    // ***************************************************************
    // ------------------------ Close Connection ---------------------
    // ***************************************************************
    // ***************************************************************
    
    public void closeConnection(){
    	
    	try {
    		
    		statement.close();
    		connection.close();
    	}
    	catch(java.sql.SQLException sqle){
    		
    		System.out.print("SQL Exception" + sqle);    		
    	}    	
    }
}

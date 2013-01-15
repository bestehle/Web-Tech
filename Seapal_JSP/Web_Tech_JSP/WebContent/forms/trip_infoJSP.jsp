<%@page import="java.io.FileWriter"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.json.simple.parser.JSONParser" %> 
<%@ page import="java.io.File" %>


<% 
String action = request.getParameter("action");

JSONArray jsonArray = new JSONArray();
JSONObject jsonObject = new JSONObject();

if(request.getParameter("action").equals("requestTrips")) {
	jsonArray = requestTrips(request.getParameter("message"));
	out.print(jsonArray);
} else if(request.getParameter("action").equals("requestTripInfo")) {
	jsonObject = requestTripInfo(request.getParameter("message"));
	out.print(jsonObject);	
} else {
	send(request.getParameter("message"));
	out.print(new JSONObject());
}


%>

<%!
JSONObject requestTripInfo(String name) {
	String select = "SELECT * FROM trip WHERE trip_title=" + "'" + name + "'";
	ResultSet rs = selectSQL(select);	    
	String[] keys = {"trip_title", "von", "nach", "skipper", "crew", "start", "ende", "tank", "motor"};
			
	JSONObject jsonObject = null;
	try {
		while(rs.next()) {
			jsonObject = new JSONObject();
			for(int i = 1; i < keys.length+1; i++) {
				jsonObject.put(keys[i-1], rs.getString(i));
			}
			
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	return jsonObject;
	
	
}
%>




<%!
void send(String message) {
	JSONObject json = new JSONObject();
	JSONParser jp = new JSONParser();
	String insertString = "";
	String bootsname = "";
	
	try{
	json = (JSONObject)jp.parse(message);
	
	insertString = "INSERT INTO trip (";
	
	for(Object entry : json.keySet()) {
		if(json.get(entry.toString()).equals("")) {
			continue;
		}
		insertString = insertString + entry.toString() + ", ";
	}
	insertString = insertString.substring(0, insertString.length()-2) + " ) VALUES (";
	
	for(Object entry : json.keySet()) {
		if(json.get(entry.toString()).equals("")) {
			continue;
		}
		insertString = insertString + "'" + json.get(entry.toString()) + "', ";
	}
	
	insertString = insertString.substring(0, insertString.length()-2) + ")";
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	insertSQL(insertString);
	
}
%>


<%! 
JSONArray requestTrips(String name) {
	String select = "SELECT trip_title, von, nach, skipper, start FROM trip WHERE bootsname=" +"'"+ name + "'";
	ResultSet rs = selectSQL(select);	    
	JSONArray json = new JSONArray();
	String[] keys = {"trip_title", "von", "nach", "skipper", "start"};
	JSONObject jsonObject;
	int arrayNumber = 0;
	try {
		while(rs.next()) {
			jsonObject = new JSONObject();
			for(int i = 1; i < 6; i++) {
				jsonObject.put(keys[i-1], rs.getString(i));
			}
			json.add(arrayNumber, jsonObject);
			++arrayNumber;
			
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	return json;
	
}
%>


<%!
ResultSet selectSQL(String select) {
	
	String connectionURL = "jdbc:mysql://localhost:3306/seapal_db?user=root;password=''";
   	Connection connection = null;
   	Statement statement = null;
   	ResultSet rs = null;

  try{ 

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "");
    statement = connection.createStatement();
	rs = statement.executeQuery(select);

	 } catch (Exception e) {
	  e.printStackTrace();
	 }
	
  return rs;	
	
}
%>

<%!
boolean insertSQL(String insert) {
	
	String connectionURL = "jdbc:mysql://localhost:3306/seapal_db?user=root;password=''";
   	Connection connection = null;
   	Statement statement = null;
   	ResultSet rs = null;

  try{ 
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "");
    statement = connection.createStatement();
	statement.executeUpdate(insert);
	
	
	 } catch (Exception e) {
		e.printStackTrace();
 	 	return false;
	 }
	
	return true;
}
%>


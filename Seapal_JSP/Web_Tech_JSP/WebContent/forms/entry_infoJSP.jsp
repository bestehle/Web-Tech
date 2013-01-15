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

if(request.getParameter("action").equals("requestEntryInfo")) {
	jsonArray = requestEntryInfo(request.getParameter("message"));
	out.print(jsonArray);
} else if(request.getParameter("action").equals("request")) {
	jsonObject = request(request.getParameter("message"));
	out.print(jsonObject);
} else {
	send(request.getParameter("message"), request.getParameter("name"));
	out.print(new JSONObject());
}

%>


<%!
void send(String message, String name) {
	
	JSONObject json = new JSONObject();
	JSONObject entryName = new JSONObject();
	JSONParser jp = new JSONParser();
	String insertString = "";
	String bootsname = "";
	
	try{
	json = (JSONObject)jp.parse(message);
	entryName = (JSONObject)jp.parse(name);
	
	insertString = "UPDATE entry SET ";
	
	for(Object entry : entryName.keySet()) {
		name = entryName.get(entry.toString()).toString();
	}
	
	for(Object entry : json.keySet()) {
		if(json.get(entry.toString()).equals("")) {
			continue;
		}
		insertString = insertString + entry.toString() + "=" + "'" + json.get(entry.toString()) + "'" + ", " ;
	}
	insertString = insertString.substring(0, insertString.length()-2) + " WHERE name=" + "'" + name + "'";
	
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	insertSQL(insertString);
	
}
%>


<%!
JSONObject request(String name) {
	
	String select = "SELECT name, latitude, longitude, cog, sog, btm, dtm, manoever, vorsegel, fahrt_nach, grosssegel  FROM entry, position WHERE name=" 
						+ "'" + name + "'" + "AND entry.position=position.id";
	ResultSet rs = selectSQL(select);	    
	String[] keys = {"name", "latitude", "longitude", "cog", "sog", "btm", "dtm", "manoever", "vorsegel", "fahrt_nach", "grosssegel"};
			
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
JSONArray requestEntryInfo(String name) {
	
	
	String select = "SELECT name, zeitpunkt, latitude, longitude, cog, sog FROM entry, position WHERE trip=" 
						+ "'" + name + "'" + "AND entry.position=position.id";
	ResultSet rs = selectSQL(select);	    
	JSONArray json = new JSONArray();
	String[] keys = {"name", "zeitpunkt", "latitude", "longitude", "cog", "sog"};
	JSONObject jsonObject;
	int arrayNumber = 0;
	try {
		while(rs.next()) {
			jsonObject = new JSONObject();
			for(int i = 1; i < 7; i++) {
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
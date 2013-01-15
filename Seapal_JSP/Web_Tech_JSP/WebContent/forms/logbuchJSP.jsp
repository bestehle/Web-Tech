<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.json.simple.parser.JSONParser" %> 


<%
String action = request.getParameter("action");

JSONArray jsonArray = new JSONArray();
JSONObject jsonObject = new JSONObject();

if(request.getParameter("action").equals("request")) {
	jsonArray = request();
	out.print(jsonArray);
} else if(request.getParameter("action").equals("send")) {
	send(request.getParameter("message"));
	out.print(new JSONObject());
} else if(request.getParameter("action").equals("delete")) {
	delete(request.getParameter("message"));
	out.print(new JSONObject());
} else {
	jsonObject = loadData(request.getParameter("message"));
	out.print(jsonObject);
}


%>


<%!
JSONObject loadData(String name) {
	String select = "SELECT * FROM boot WHERE bootsname=" + "'" + name + "'";
	ResultSet rs = selectSQL(select);	    
	String[] keys = {"bootsname", "registernr", "segelzeichen", "heimathafen", "yachtclub", "eigner", "versicherung", "rufzeichen", "typ", "konstrukteur",
			"laenge", "breite", "tiefgang", "masthoehe", "verdraengung", "rigart", "baujahr", "motor", "tankgroesse", "wassertankgroesse",
			"abwassertankgroesse", "grosssegelgroesse", "genuagroesse", "spigroesse"};
			
	JSONObject jsonObject = null;
	try {
		while(rs.next()) {
			jsonObject = new JSONObject();
			for(int i = 1; i < keys.length; i++) {
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
void delete(String name) {
	String delete = "DELETE FROM boot where bootsname=" + "'" + name + "'";
	insertSQL(delete);
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
	
	insertString = "INSERT INTO boot (";
	
	for(Object entry : json.keySet()) {
		if(entry.toString().equals("bootsname")) {
			bootsname = json.get(entry.toString()).toString();
		}
		
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
	
	if(!insertSQL(insertString)) {
		delete(bootsname);
		insertSQL(insertString);
	} 
}
%>



<%! 
JSONArray request() {
	
	String select = "SELECT bootsname, typ, konstrukteur, laenge, eigner FROM boot";
	ResultSet rs = selectSQL(select);	    
	JSONArray json = new JSONArray();
	String[] keys = {"bootsname", "typ", "konstrukteur", "laenge", "eigner"};
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
	  	return false;
	 }
	
	return true;
}
%>




 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3307/";
String database = "electionmachine";
String userid = "testuser";
String password = "password";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>
<!DOCTYPE html>
<html>
<head>
<title>Candidates List Page</title>
</head>
<body>
    <div align="center">
    <style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
</style>

<center><h1>Candidate Lists</h1></center>
<table border="1">
<tr>
                <th>ID</th>
                <th>FULL NAME</th>
                <th>EMAIL</th>
                <th>AGE</th>
                <th>MINISTRY</th>
                <th>PROFESSION</th>
                <th>SCORE</th>
            </tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT candidates.*, scores.score from scores INNER JOIN candidates on scores.email = candidates.email ORDER BY candidates.id";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("fullname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("party") %></td>
<td><%=resultSet.getString("proffesion") %></td>
<td><%=resultSet.getString("score") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

    </div>  
        <center>
         <h2>
            <a href="/index.html">Home</a>
                &nbsp;&nbsp;&nbsp;
        </h2>
    </center> 
    
</body>
</html>
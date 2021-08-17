

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>

<html>
<head>
    <title>Candidates List Admin</title>
    
    <link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
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
        <table class="styled-table">
    <thead>
    	<h2> Welcome to the Admin page <br><br> <%=session.getAttribute("login")%> </h2>
	<br>
            <caption><h2>Candidate's Information</h2></caption>
            <tr>
                <th>ID</th>
                <th>FULL NAME</th>
                <th>EMAIL</th>
                <th>AGE</th>
                <th>MINISTRY</th>
                <th>PROFESSION</th>
                <th>UPDATE</th>
                <th>DELETE</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="candidates" items="${candidateslist}">
                <tr>
                    <td><c:out value="${candidates.id}" /></td>
                    <td><c:out value="${candidates.fullname}" /></td>
                    <td><c:out value="${candidates.email}" /></td>
                    <td><c:out value="${candidates.age}" /></td>
                    <td><c:out value="${candidates.party}" /></td>
                    <td><c:out value="${candidates.proffesion}" /></td>
                    <td>
                        <a href='/readtoupdate?id=${candidates.id}'>Update</a>
                    </td>
                    <td>
                        <a href='/delete?id=${candidates.id}'>Delete</a>                   
                    </td>
                </tr>
            </c:forEach>
           </tbody>
        </table>
    </div>  
        <center>
         <h2>
            <a href="/jsp/welcomeAdmin.jsp">Home</a>
                &nbsp;&nbsp;&nbsp;
        </h2>
    </center> 
</body>
</html>

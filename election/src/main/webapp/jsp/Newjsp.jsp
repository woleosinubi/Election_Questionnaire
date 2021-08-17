<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Candidates</title>
</head>
<body>
    <center><h1>Candidate's Page</h1></center>
    <div align="center">
 
        <c:if test="${candidates == null}">
            <form action="/insert" method="post" >
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${candidates != null}">
                        Edit Candidate's Information
                    </c:if>
                    <c:if test="${candidates == null}">
                        Enter Candidate's Information
                    </c:if>
                </h2>
            </caption>
                <c:if test="${candidates != null}">
                    <input type="hidden" name="id" value="<c:out value='${candidates.id}' />" />
                </c:if>           
            <tr>
                <th>FULL NAME</th>
                <td>
                    <input type="text" name="fullname" size="45"
                            value="<c:out value='${candidates.fullname}' />"
                        />
                </td>
            </tr>
            <tr>
                <th>EMAIL</th>
                <td>
                <input type="text" name="email" size="45"
                       value="<c:out value='${candidates.email}' />"
                />
                </td>
            </tr>
            <tr>
                <th>AGE </th>
                <td>
                <select name="age">
                <option value=""> Select Age</option> 
    			<option value="18"> 18 </option>
   				<option value="19"> 19 </option>
    			<option value="20"> 20 </option>
    			<option value="21"> 21 </option>
    			<option value="22"> 22 </option>
    			<option value="23"> 23 </option>
    			<option value="24"> 24 </option>
    			<option value="25"> 25 </option>
    			<option value="26"> 26 </option>
    			<option value="27"> 27 </option>
    			<option value="28"> 28 </option>
    			<option value="29"> 29 </option>
    			<option value="30"> 30 </option>
    			<option value="31"> 31 </option>
    			<option value="32"> 32 </option>
    			<option value="33"> 33 </option>
    			<option value="34"> 34 </option>
    			<option value="35"> 35 </option>
    			<option value="36"> 36 </option>
    			<option value="37"> 37 </option>
    			<option value="38"> 38 </option>
    			<option value="39"> 39 </option>
    			<option value="40"> 40 </option>
    			<option value="41"> 41 </option>
    			<option value="42"> 42 </option>
    			<option value="43"> 43 </option>
    			<option value="44"> 44 </option>
    			<option value="45"> 45 </option>
    			<option value="46"> 46 </option>
    			<option value="47"> 47 </option>
    			<option value="48"> 48 </option>
    			<option value="49"> 49 </option>
    			<option value="50"> 50 </option>
    			<option value="51"> 51 </option>
    			<option value="52"> 52 </option>
    			<option value="53"> 53 </option>
    			<option value="54"> 54 </option>
    			<option value="55"> 55 </option>
    			<option value="56"> 56 </option>
    			<option value="57"> 57 </option>
    			<option value="58"> 58 </option>
    			<option value="59"> 59 </option>
    			<option value="60"> 60 </option>
				</select>
				<input type="hidden" value="<c:out value='${candidates.age}' />">

                </td>
            </tr>
                   <tr>
                <th>MINISTRY</th>
                <td>
                    <select name="party">
                <option value="">Select Ministry</option> 
    			<option value="Prime Minister's Office">Prime Minister's Office</option>
   				<option value="Ministry for Foreign Affairs">Ministry for Foreign Affairs</option>
    			<option value="Ministry of Justice">Ministry of Justice</option>
    			<option value="Ministry of the Interior">Ministry of the Interior</option>
    			<option value="Ministry of Defence">Ministry of Defence</option>
    			<option value="Ministry of Finance">Ministry of Finance</option>
    			<option value="Ministry of Education and Culture">Ministry of Education and Culture</option>
    			<option value="Ministry of Agriculture and Forestry">Ministry of Agriculture and Forestry</option>
    			<option value="Ministry of Transport and Communications">Ministry of Transport and Communications</option>
    			<option value="Ministry of Economic Affairs and Employment">Ministry of Economic Affairs and Employment</option>
    			<option value="Ministry of Social Affairs and Health">Ministry of Social Affairs and Health</option>
    			<option value="Ministry of the Environment">Ministry of the Environment</option>
				</select>
				<input type="hidden" value="<c:out value='${candidates.party}' />">
                </td>
            </tr>
                   <tr>
                <th>PROFESSION</th>
                <td>
                    <input type="text" name="proffesion" size="5"
                            value="<c:out value='${candidates.proffesion}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                    <input type="button" value="Cancel" onclick="javascript:history.go(-1);">
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>
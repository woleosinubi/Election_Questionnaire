<%@page contentType="text/html" language="java" import="java.sql.*"%>

<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Result : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="Quiz Grade/css/style.css">

</head>
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("welcome.jsp"); 
	}
	%>
<br><br>	
<center><h2> CANDIDATE: <%=session.getAttribute("login")%> </h2></center>
<body>
<h2 style="text-align:center">YOUR ELECTION QUESTIONNAIRE RESULT</h2>
<p>
<center><a href="/jsp/welcome.jsp">Back To Main Page</a></center>
</p>
<hr/>
<br><br><br>
<center>
<%
String str1=request.getParameter("ans1");
String str2=request.getParameter("ans2");
String str3=request.getParameter("ans3");
String str4=request.getParameter("ans4");
String str5=request.getParameter("ans5");
String str6=request.getParameter("ans6");
String str7=request.getParameter("ans7");
String str8=request.getParameter("ans8");
String str9=request.getParameter("ans9");
String str10=request.getParameter("ans10");

int mark=0;

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/electionmachine","testuser","password");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM answers");


int i=1;
while(rs.next())
{
 if(i==1)
 {
  String dbans1=rs.getString(1);
  if(str1.equals(dbans1))
  {
   mark=mark+1;
  }
 }
 if(i==2)
 {
  String dbans2=rs.getString(1);
  if(str2.equals(dbans2))
  {
   mark=mark+1;
  }
 }
 if(i==3)
 {
  String dbans3=rs.getString(1);
  if(str3.equals(dbans3))
  {
   mark=mark+1;
  }
 }
 if(i==4)
 {
  String dbans4=rs.getString(1);
  if(str4.equals(dbans4))
  {
   mark=mark+1;
  }
 }
 if(i==5)
 {
  String dbans5=rs.getString(1);
  if(str5.equals(dbans5))
  {
   mark=mark+1;
  }
 }
 if(i==6)
 {
  String dbans6=rs.getString(1);
  if(str6.equals(dbans6))
  {
   mark=mark+1;
  }
 }
 if(i==7)
 {
  String dbans7=rs.getString(1);
  if(str7.equals(dbans7))
  {
   mark=mark+1;
  }
 }
 if(i==8)
 {
  String dbans8=rs.getString(1);
  if(str8.equals(dbans8))
  {
   mark=mark+1;
  }
 }
 if(i==9)
 {
  String dbans9=rs.getString(1);
  if(str9.equals(dbans9))
  {
   mark=mark+1;
  }
 }
 if(i==10)
 {
  String dbans10=rs.getString(1);
  if(str10.equals(dbans10))
  {
   mark=mark+1;
  }
 }
 i++;
}
if(mark>=7)
{
 out.println("<h1>Your Score Is : "+mark+"</h1>");
 out.println("<h2>Congratulations....! You Are Eligible as a Good Candidate...</h2>");
}
else
{
 out.println("<h1>Your Score is : "+mark+"</h1>");
 out.println("<h2>Sorry....!! You Are Not Eligible as a Good Candidate...</h2>");
}
%>

<%
PreparedStatement pstmt=null; //create statement
pstmt=con.prepareStatement("UPDATE SCORES SET SCORE = "+mark+" WHERE email = '"+session.getAttribute("login")+"'");
pstmt.executeUpdate();

request.setAttribute("successMsg","Score Successfully updated to Database"); //register success messeage
con.close(); //close connection
%>

</center>
</form>
</body>

</html>

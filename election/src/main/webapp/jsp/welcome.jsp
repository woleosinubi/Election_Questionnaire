<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">

</head>

<body>

    <ul>
        <li><a href="/index.html">Back to Home Page</a></li>
    </ul>

    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<h1> Welcome to the Electoral Question page <br><br> <%=session.getAttribute("login")%> </h1>
	<br><br>
	<h1>Kindly click on the Questionnaire link to begin your question session</h1>
	<br><br>
	<h1>
	<a href='/jsp/ShowCandidatesSingle.jsp'>Candidates Profile</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href='/jsp/Quiz Grade/Question.html'>Questionnaire</a>
	</h1>
	<br><br>
	<h2><a href="logout.jsp">Logout</a></h2>
    
	</center>
		
    </div>

</body>

</html>

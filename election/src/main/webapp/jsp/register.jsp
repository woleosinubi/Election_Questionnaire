<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/electionmachine","testuser","password"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String firstname,lastname,email,password,fullname, age,party, proffesion;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		fullname=request.getParameter("txt_fullname"); //txt_fullname
		age=request.getParameter("txt_age"); //txt_age
		party=request.getParameter("txt_party"); //txt_party
		proffesion=request.getParameter("txt_proffesion"); //txt_proffesion
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(firstname,lastname,email,password) values(?,?,?,?)");//sql insert query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
		
		PreparedStatement pstmt1=null; //create statement
		pstmt1=con.prepareStatement("insert into candidates(fullname,age,email,party,proffesion) values(?,?,?,?,?)");//sql insert query
		pstmt1.setString(1,fullname);
		pstmt1.setString(2,age);
		pstmt1.setString(3,email);
		pstmt1.setString(4,party);
		pstmt1.setString(5,proffesion);
		
		PreparedStatement pstmt2=null; //create statement
		pstmt2=con.prepareStatement("insert into scores(email) values(?)");//sql insert query
		pstmt2.setString(1,email);
		
		
		
		pstmt.executeUpdate(); //execute query
		pstmt1.executeUpdate(); //execute query
		pstmt2.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Registration Page</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert("Enter Lastname Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <ul>
        <li><a href="/index.html">Back to Home Page</a></li>
    </ul>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register New Candidate</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>Firstname</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="enter firstname">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Lastname</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="enter lastname">
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Fullname</span>
                            <input type="text" name="txt_fullname" id="fullname" placeholder="enter fullname">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="enter password">
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Age</span>
                <select name="txt_age">
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
				<input type=hidden name="txt_age" id="age">
                        </label>
                    </div>
                    
                 <div class="form-row">
                        <label>
                            <span>Ministry</span>
                <select name="txt_party" id="party">
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
				<input type=hidden name="txt_party" id="party">      
                    </label>
                    </div>  
               
                <div class="form-row">
                <label>
                <span>Profession</span>
                <input type="text" name="txt_proffesion" id="proffesion" placeholder="enter profession">
                </label>
                </div>             
                               

					<input type="submit" name="btn_register" value="Register">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>

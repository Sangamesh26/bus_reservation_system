<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/bus_reservation_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%!Connection con = null;%>
   
<%
	Statement st = null;
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("sex");
	String mobile = request.getParameter("phone_no");
	String password = request.getParameter("password");
	String email = request.getParameter("email_id");
	
	int a = Integer.parseInt(age);
	
	try
	{
		 Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   st=con.createStatement();
		   
		   String sql="Insert into user(name,age,sex,phone_no,password,email_id) Values('"+name+"','"+a+"','"+gender+"','"+mobile+"','"+password+"','"+email+"')";
		  st.execute(sql);
		  response.sendRedirect("trial.html");
	}
	catch(Exception e)
	{
		out.println(e);
	}
	finally
	{
		try
		{
		
		st.close();
		con.close();
		}
		catch(Exception e){}
		
	}
	
%>
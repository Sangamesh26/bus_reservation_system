<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/bus_reservation_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%!Connection con = null;%>
   
<%

	Statement st = null;
	ResultSet rs = null;
	
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String email_id = request.getParameter("email_id");
	try
	{
		   Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   st=con.createStatement();
		  
		   if(role.equalsIgnoreCase("admin"))
		   {
			   String sql = "select * from admin where name='"+name+"' and password='"+password+"'";
			   
			   rs=st.executeQuery(sql);
			   if(rs.next())
			   {
				   response.sendRedirect("AdminFront_copy.html");
			   }
			   else
			   { %>
				   <script>
					alert(" Wrong name or password ....!!!");
				   </script>
				   
					
				<%
					response.sendRedirect("login.html");
			   } 
		   }
		   else if(role.equalsIgnoreCase("user"))
		   {
			   session.setAttribute("user_email",email_id);
			   String sql = "select * from user where name='"+name+"' and password='"+password+"'";
			   rs=st.executeQuery(sql);
			   if(rs.next())
			   {
				   response.sendRedirect("UserFront.html");
			   }
			   else
			   {%>
				    <script>
				    alert(" Wrong name or password ....!!!");
					</script>
					
				<%
					response.sendRedirect("login.html");
			   }			   
			   
		   }
	}
	catch(Exception e)
	{
		out.println(e);
	}
	finally
	{
		try
		{
		rs.close();
		st.close();
		con.close();
		}
		catch(Exception e){}
		
	}
		

%>
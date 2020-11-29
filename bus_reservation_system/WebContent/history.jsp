<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Title Page-->
    <title>BOOKED TICKETS</title>



    <!-- Main CSS-->
    <link href="assests/css/register_css.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title" style="color:red;">&emsp;&emsp;&nbsp;&nbsp;BOOKED - TICKETS</h2>
					<br></br>
					
					<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
					<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
					   <%!String DB_URL = "jdbc:mysql://localhost/bus_reservation_system";%>
					   <%!String USER = "root";%>
					   <%!String PASS = "root";%>
					   <%!Connection con = null;%>
						
					   <%
							
							
							Statement stmt=null;
							ResultSet rs=null;
							try
							{
								
								Class.forName(JDBC_DRIVER);
								con=DriverManager.getConnection(DB_URL,USER,PASS);
								stmt=con.createStatement();
								
								String sql="Select * from booked_details where email_id='"+session.getAttribute("user_email")+"'";
								rs=stmt.executeQuery(sql);
								int flag=0;
								
								
								
									if(rs.next())
									{
										rs.previous();
										out.println("<pre>No of Tickets           Total price              Source           Destination           Bus no           Email-Id</pre>");
										while(rs.next())
										{	
											flag=1;
											int n=rs.getInt("no_tickets");
											int m=rs.getInt("total_price");
											String source = rs.getString("source");
											String destination = rs.getString("destination");
											String bus_no = rs.getString("bus_no");
											String email=rs.getString("email_id");
					
											
											out.println("<pre> "+n+"          "+m+"            "+source+"                 "+destination+"                 "+bus_no+"                 "+email+" </pre>");
										
										}	
									}
									if(flag==0)
									{
										out.println("<br><br><br><br><br><center>You dont have any previous bookings</center><br>");
									}
				
								
								
								
							}
							catch(Exception e){}
							
							finally
							{
								try
								{
									stmt.close();
									rs.close();
								    con.close();
								}catch(Exception e){}
							}
							
					   
					   %>
					
                </div>
            </div>
			<a href="UserFront.html" style="text-decoration:none;"><button class="button">USER HOME</button></a>
        </div>
    </div>



</body>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Title Page-->
    <title>TICKET STATUS</title>



    <!-- Main CSS-->
    <link href="css/register_css.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title" style="color:red;">&emsp;&emsp;&nbsp;&nbsp;BOOK STATUS</h2>
					<br></br>
					
					<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
					<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
					
						<%!String DB_URL = "jdbc:mysql://localhost/bus_reservation_system";%>
						<%!String USER = "root";%>
						<%!String PASS = "root";%>
						<%!Connection con = null;%>
						
						
						
						<%
								
								Statement st = null;
								ResultSet rs = null;
								ResultSet rs1 = null;
								Statement stmt = null;
								
								 String source = request.getParameter("source");
								 String destination = request.getParameter("destination");
								 String day = request.getParameter("day");
								 String month = request.getParameter("month");
								 String year = request.getParameter("year");
								 String email = request.getParameter("email_id");
								 String no_tickets = request.getParameter("no_tickets");
								 
								 
								 int d = Integer.parseInt(day);
								 int m = Integer.parseInt(month);
								 int y = Integer.parseInt(year);
								 int n = Integer.parseInt(no_tickets);
								 int mn = n;
								 
								 
								 try
								 {
								   Class.forName(JDBC_DRIVER);
								   con=DriverManager.getConnection(DB_URL,USER,PASS);
								   st=con.createStatement();
								   
								   
								   String sql = "insert into user_journey_details(source,destination,day,month,year,email_id,no_tickets) values('"+source+"','"+destination+"','"+d+"','"+m+"','"+y+"','"+email+"','"+n+"')";
								   st.executeUpdate(sql); 
								 }
								   	catch(Exception e)
									{
										out.println(e);
									}
									
									
								try
								{
									Class.forName(JDBC_DRIVER);
									con=DriverManager.getConnection(DB_URL,USER,PASS);
									stmt=con.createStatement();
									
									//String sql0 ="RENAME TABLE (select * from bus,seat_details where bus.bus_no=seat_details.bus_no) AS fare_table";
									//stmt.executeQuery(sql0);
									
									//String sql = "update fare_table set remaining_seats = remaining_seats - "+n+" where source='"+source+"' and destination='"+destination+"' and day='"+d+"' and month='"+m+"' and year='"+y+"' ";
									//stmt.executeUpdate(sql);
									
									String sql0 = "UPDATE seat_details JOIN bus ON seat_details.bus_no = bus.bus_no SET remaining_seats = remaining_seats - "+n+" where source='"+source+"' and destination='"+destination+"' and day='"+d+"' and month='"+m+"' and year='"+y+"' ";
									stmt.executeUpdate(sql0);
									
									String sql = "select remaining_seats from seat_details inner join bus ON seat_details.bus_no = bus.bus_no where source='"+source+"' and destination='"+destination+"' and day='"+d+"' and month='"+m+"' and year='"+y+"' ";
									rs = stmt.executeQuery(sql);
									
												int x=0;
												while(rs.next())
												{
													x=rs.getInt("remaining_seats");
													
												}
												
												if(x<0)
												{
													out.println("<br><pre>Sorry!! number of seats remaining are lesser.");
													sql="UPDATE seat_details JOIN bus ON seat_details.bus_no = bus.bus_no SET remaining_seats = remaining_seats + "+n+" where source='"+source+"' and destination='"+destination+"' and day='"+d+"' and month='"+m+"' and year='"+y+"' ";
													stmt.executeUpdate(sql);
													
													
												}
												else
												{
													sql="Select fare_price,seat_details.bus_no from seat_details inner join bus ON seat_details.bus_no = bus.bus_no where source='"+source+"' and destination='"+destination+"' and day='"+d+"' and month='"+m+"' and year='"+y+"' ";
												
													rs1=stmt.executeQuery(sql);
													int s=0;
													int flag=0;
													String bus_no="";
													while(rs1.next())
													{
														
														mn=n*rs1.getInt("fare_price");
														bus_no = rs1.getString("bus_no");
														flag=1;
													}
													if(flag==1)
													{
													 out.println("<br>Tickets Booked");
													 out.println("<br><br><br><br>From : "+source);
													 out.println("<br><br>To : "+destination);
													 out.println("<br><br>Date : "+d+"-"+m+"-"+y);
													 out.println("<br><br>Number of Tickets : "+n);
													 out.println("<br><br>Total Cost: "+mn);
													 sql="Insert Into booked_details (no_tickets,total_price,source,destination,bus_no,email_id) Values ('"+n+"','"+mn+"','"+source+"','"+destination+"','"+bus_no+"','"+session.getAttribute("user_email")+"')";
													 stmt.executeUpdate(sql);
													}
													else out.println("<br><pre>Sorry! No buses are there.</pre>");
												
												
												
												}
												
											 }
											 catch(Exception e){}
											 finally
											 {
												 try
												 {
												 stmt.close();
												 rs.close();
												 rs1.close();
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
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Title Page-->
    <title>BUSES</title>



    <!-- Main CSS-->
    <link href="assests/css/register_css.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title" style="color:red;">&emsp;&emsp;&nbsp;&nbsp;AVAILABLE&nbsp; BUSES</h2>
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
						try
						{
							Class.forName(JDBC_DRIVER);
							con=DriverManager.getConnection(DB_URL,USER,PASS);
							st=con.createStatement();
							
							String sql = "select * from bus,seat_details where bus.bus_no=seat_details.bus_no";
							 rs=st.executeQuery(sql);
							%>
					  <div>
					  <table cellpadding="10px" cellspacing="5" border="2" height="20px">
						<thead>
							<tr>
							<th>Source</th>
							<th>Destination</th>
							<th>Bus No</th>
							<th>Bus category</th>
							<th>Date</th>
							<th>Time</th>
							<th>Total seats</th>
							<th>Remaining seats</th>
							<th>Price</th>
							
							</tr>
						</thead>
					  </table>
					  </div>
					
					<%
					
						while(rs.next())
						{
							%>
							
								<div class="tbl-content">
									<table cellpadding="10" cellspacing="5" border="2" height="10px">
									<tbody>
										<tr>
										      <td><%=rs.getString("source") %></td>
											  <td><%=rs.getString("destination") %></td>
											  <td><%=rs.getString("bus_no") %></td>
											  <td><%=rs.getString("category") %></td>
											  <td><%=rs.getString("day") %> - <%=rs.getString("month")%> - <%=rs.getString("year")%></td>
											  <td><%=rs.getString("departure_time") %></td>
											  <td><%=rs.getInt("total_seats") %></td>
											  <td><%=rs.getInt("remaining_seats") %></td>
											  <td><%=rs.getInt("fare_price") %></td>
										
										</tr>
									</tbody>
									</table>
								</div>
							
							
							
							
							
							
							
							
							
							
							
							<%
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
		
							st.close();
							con.close();
							rs.close();
							}
							catch(Exception e){}
							
						}
   %>
									
							
                </div>
            </div>
			<a href="AdminFront_copy.html" style="text-decoration:none;"><button class="button">ADMIN HOME</button></a>
        </div>
    </div>



</body>

</html>
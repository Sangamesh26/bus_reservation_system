<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Title Page-->
    <title>BUS ADD DETAILS</title>



    <!-- Main CSS-->
    <link href="assests/css/register_css.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title" style="color:red;">&emsp;&emsp;&nbsp;&nbsp; ADMIN</h2>
					<br></br>
					<h3>New bus added</h3>
                </div>
            </div>
			
			
			<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/bus_reservation_system";%>
   <%!String USER = "root";%>
   <%!String PASS = "root";%>
   <%!Connection con = null;%>
<%
	
	Statement st=null;
	String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	String bus_no = request.getParameter("bus_no");
	String category = request.getParameter("category");
	String day = request.getParameter("day");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String departure_time = request.getParameter("departure_time");
	
	String total_seats = request.getParameter("total_seats");
	String remaining_seats = request.getParameter("remaining_seats");
	String fare_price = request.getParameter("fare_price"); 
	
	int ts,rs,fp,d,m,y;
	ts=Integer.parseInt(total_seats);
	rs=Integer.parseInt(remaining_seats);
	fp=Integer.parseInt(fare_price);
	d = Integer.parseInt(day);
	m = Integer.parseInt(month);
	y = Integer.parseInt(year);
	try
	{
		 Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   st=con.createStatement();
		   
		   String sql="Insert into bus(source,destination,bus_no,category,day,month,year,departure_time) Values('"+source+"','"+destination+"','"+bus_no+"','"+category+"','"+d+"','"+m+"','"+y+"','"+departure_time+"')";
		  st.execute(sql);
		  
		  String sql1 = "Insert into seat_details(bus_no,total_seats,remaining_seats,fare_price) values('"+bus_no+"','"+ts+"','"+rs+"','"+fp+"')";
		  st.execute(sql1);
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
		}catch(Exception e){}
		
	}
%>
			
			
			
			
			
			
			
			
			<a href="admin.html" style="text-decoration:none;"><button class="button">Back to add bus</button></a>
        </div>
    </div>



</body>

</html>
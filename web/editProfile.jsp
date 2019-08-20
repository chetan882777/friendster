
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="css/navigationBar.css">
	<link rel="stylesheet" type="text/css" href="css/logIn.css">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/editProfile.css">
	<meta charset="utf-8">
</head>
<style id="sizeLoader">
</style><%session.setAttribute("emailId", session.getAttribute("emailId"));
 
%>
<style>
    .sidebar-right
    {
    width: 0px;       
    }
    </style>
<body style="background:#f1f1f1" onload="positionSizer()">
	<div class="topnav1">
		<img src="images/index2.png" class="logo">
		<div >
			<ul class="topnav-ul" style="float: left;">
				<li class="topnav-li" >
					<a href="#" class="nav-page-text">
						<i class="fas fa-bars" onclick="sideBarActive()"></i>
					</a>
				</li>
				<li class="topnav-li" >
					<a href="home.jsp" class="nav-page-text">Home</a>
				</li>
				<li class="topnav-li" style="position: relative;">
					<a href="#" class="nav-page-text">
						<i class="fas fa-caret-down"></i>
					</a>
					<div class="dropdown">
						<a href="findFriend.jsp" class="nav-page-text" style="font-size: 16px; color: gray"><i class="fas fa-user-plus"></i><span style="padding: 10px">Find Friends</span></a>
						<a href="profilePage.jsp" class="nav-page-text" style="font-size: 16px;  color: gray"><i class="fas fa-user"></i>
					<span style="padding: 10px">Profile</span></a>
					</div>
				</li>
				 <form action="search.jsp" method="post" name="searcher" style="display: inline-block" onsubmit="return EmailValidatorM()">
                                <li class="topnav-li" >
					<input type="text" name="email" class="text-search" placeholder="Search here by email...">
				</li>
				<li class="topnav-li">
                                    <button style="border:none; background: none" type="submit">
                                        <a class="text-search-icon">
						<i class="fas fa-search"></i>
                                        </a>
                                    </button>
				</li>
                                </form>
				<li class="topnav-li" >
					<a href="findFriend.jsp" class="nav-page-text" style="font-size: 16px"><i class="fas fa-user-plus"></i><span style="padding: 10px">Find Friends</span></a>
				</li>
				<li class="topnav-li" >
					<a href="profilePage.jsp" class="nav-page-text" style="font-size: 16px"><i class="fas fa-user"></i>
					<span style="padding: 10px">Profile</span></a>
				</li>
			</ul>
			<ul class="topnav-ul"  style="float: right;">
				<li class="topnav-li-r" >
					<a href="#" class="text-search-icon">
						<i class="fas fa-search"></i></a>
				</li>
				<li class="topnav-li">
					<a href="#" class="nav-page-text">
						<i class="fas fa-bars"
						onclick="sideBarActiveR()"></i>
					</a>
				</li>
			</ul>
		</div>
</div><!--topnav-->
<div>
    <% int UID = 0;
     String a[][] = new String[1000][2];
     int index[] = new int[1000];
     int count = -1;
     try{
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+session.getAttribute("emailId")+"'");
            rs.next();
            UID = Integer.parseInt(rs.getString("id"));
            rs = stmt.executeQuery("select * from chartroom");
            while(rs.next())
            {
                int CrID = Integer.parseInt(rs.getString("CrID"));
                int LID = CrID/1000;
                int RID = CrID%1000;
                if(LID == UID)
                {
                    count = count+1;
                    a[RID][0] = rs.getString("message");
                    String mTime = rs.getString("time");
                    Date d = new Date();//date object
                    SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");//date formatting object
                    String date = formatter.format(d);//get current date
                
                    String date1 = mTime;
                    String date2 = date;
                    String t="";   
                    int f = date1.indexOf("/");
                    if(f==2)
                    {
                    String d1 = date1.substring(0,10);
                    String x1 = date2.substring(0,10);
                    String d2 = date1.substring(11,19);
                    String x2 = date2.substring(11,19);
                    if(x1.equalsIgnoreCase(d1))
                    {
                        int hour1 = Integer.parseInt(x2.substring(0,2));
                        int hour2 = Integer.parseInt(d2.substring(0,2));
                         if(hour1==hour2)
                        {
                            int min1 = Integer.parseInt(x2.substring(3,5));

                            int min2 = Integer.parseInt(d2.substring(3,5));
                            if(min1==min2)
                            {
                                int sec1 = Integer.parseInt(x2.substring(6,8));
                                int sec2 = Integer.parseInt(d2.substring(6,8));
                                int sec = 0;
                                if(sec1>sec2)
                                {
                                    sec = sec1-sec2;
                                }
                                else
                                {
                                    sec = sec2-sec1;
                                }
                                t = "" + sec + " sec";
                            }
                            else
                            {
                                int min=0;
                                if(min1>min2)
                                {
                                    min = min1-min2;
                                }
                                else
                                {
                                       min = min2-min1;
                                }
                                t = "" + min + " min";
                            }
                        }
                        else
                        {
                                int hour=0;
                                if(hour1>hour2)
                                {
                                    hour = hour1-hour2;
                                }
                                else
                                {
                                       hour = hour2-hour1;
                                }
                                t = "" + hour + " hour";
                        }
                    }
                    else
                    {
                        int year1 = Integer.parseInt(x1.substring(6,10));
                        int year2 = Integer.parseInt(d1.substring(6,10));
                        if(year1==year2)
                        {
                            int month1 = Integer.parseInt(x1.substring(3,5));
                            int month2 = Integer.parseInt(d1.substring(3,5));
                            if(month1==month2)
                            {
                                int day1 = Integer.parseInt(x1.substring(0,2));
                                int day2 = Integer.parseInt(d1.substring(0,2));
                                int day = 0;
                                if(day1>day2)
                                {
                                    day = day1-day2;
                                }
                                else
                                {
                                    day = day2-day1;
                                }
                                t = "" + day + " day";
                            }
                            else
                            {
                                int month=0;
                                if(month1>month2)
                                {
                                    month = month1-month2;
                                }
                                else
                                {
                                       month = month2-month1;
                                }
                                t = "" + month + " month";
                            }
                        }
                        else
                        {
                                int year=0;
                                if(year1>year2)
                                {
                                    year = year1-year2;
                                }
                                else
                                {
                                       year = year2-year1;
                                }
                                t = "" + year + " year";
                        }
                    }

                    }
                    else if(f==3)
                    {
                        String d1 = date1.substring(0,11);
                        String x1 = date2.substring(0,11);
                        String d2 = date1.substring(12,20);
                        String x2 = date2.substring(12,20);
                        if(x1.equalsIgnoreCase(d1))
                        {
                            int hour1 = Integer.parseInt(x2.substring(0,2));
                            int hour2 = Integer.parseInt(d2.substring(0,2));
                            if(hour1==hour2)
                            {
                                int min1 = Integer.parseInt(x2.substring(3,5));
                                int min2 = Integer.parseInt(d2.substring(3,5));
                                if(min1==min2)
                                {
                                    int sec1 = Integer.parseInt(x2.substring(6,8));
                                    int sec2 = Integer.parseInt(d2.substring(6,8));
                                    int sec = 0;
                                    if(sec1>sec2)
                                    {
                                        sec = sec1-sec2;
                                    }
                                    else
                                    {
                                        sec = sec2-sec1;
                                    }
                                    t = "" + sec + " sec";
                                }
                                else
                                {
                                    int min=0;
                                    if(min1>min2)
                                    {
                                        min = min1-min2;
                                    }
                                    else
                                    {
                                           min = min2-min1;
                                    }
                                     t = "" + min + " min";
                                }
                            }
                            else
                            {
                                    int hour=0;
                                    if(hour1>hour2)
                                    {
                                        hour = hour1-hour2;
                                    }
                                    else
                                    {
                                           hour = hour2-hour1;
                                    }
                                    t = "" + hour + " hour";
                            }
                        }
                        else
                        {
                            int year1 = Integer.parseInt(x1.substring(7,11));
                            int year2 = Integer.parseInt(d1.substring(7,11));
                            if(year1==year2)
                            {
                                int month1 = Integer.parseInt(x1.substring(4,6));
                                int month2 = Integer.parseInt(d1.substring(4,6));
                                if(month1==month2)
                                {
                                    int day1 = Integer.parseInt(x1.substring(0,3));
                                    int day2 = Integer.parseInt(d1.substring(0,3));
                                    int day = 0;
                                    if(day1>day2)
                                    {
                                        day = day1-day2;
                                    }
                                    else
                                    {
                                        day = day2-day1;
                                    }
                                    t = "" + day + " day";

                                }
                                else
                                {
                                    int month=0;
                                    if(month1>month2)
                                    {
                                        month = month1-month2;
                                    }
                                    else
                                    {
                                           month = month2-month1;
                                    }
                                    t = "" + month + " month";
                                }
                            }
                            else
                            {
                                    int year=0;
                                    if(year1>year2)
                                    {
                                        year = year1-year2;
                                    }
                                    else
                                    {
                                           year = year2-year1;
                                    }
                                    t = "" + year + " year";
                            }
                        }

                    }
                    a[RID][1] = t;
                    /////==============================time-calc-over=============================////
                    
                    
                   int flag = 0;
                    int i;
                    for( i=0;i<count;i++)
                    {
                        if(index[i]==LID)
                        {
                           flag=1;
                        }
                    }
                     if(flag==1)
                        {
                            index[i]= LID;
                            count = count-1;
                        }
                        else
                        {
                            index[count] = LID;
                        }
                }
                else if(RID == UID)
                {
                     count = count+1;
                    a[LID][0] = rs.getString("message");
                    String mTime = rs.getString("time");
                    Date d = new Date();//date object
                    SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");//date formatting object
                    String date = formatter.format(d);//get current date
                
                    String date1 = mTime;
                    String date2 = date;
                    String t="";   
                    int f = date1.indexOf("/");
                    if(f==2)
                    {
                    String d1 = date1.substring(0,10);
                    String x1 = date2.substring(0,10);
                    String d2 = date1.substring(11,19);
                    String x2 = date2.substring(11,19);
                    if(x1.equalsIgnoreCase(d1))
                    {
                        int hour1 = Integer.parseInt(x2.substring(0,2));
                        int hour2 = Integer.parseInt(d2.substring(0,2));
                         if(hour1==hour2)
                        {
                            int min1 = Integer.parseInt(x2.substring(3,5));

                            int min2 = Integer.parseInt(d2.substring(3,5));
                            if(min1==min2)
                            {
                                int sec1 = Integer.parseInt(x2.substring(6,8));
                                int sec2 = Integer.parseInt(d2.substring(6,8));
                                int sec = 0;
                                if(sec1>sec2)
                                {
                                    sec = sec1-sec2;
                                }
                                else
                                {
                                    sec = sec2-sec1;
                                }
                                t = "" + sec + " sec";
                            }
                            else
                            {
                                int min=0;
                                if(min1>min2)
                                {
                                    min = min1-min2;
                                }
                                else
                                {
                                       min = min2-min1;
                                }
                                t = "" + min + " min";
                            }
                        }
                        else
                        {
                                int hour=0;
                                if(hour1>hour2)
                                {
                                    hour = hour1-hour2;
                                }
                                else
                                {
                                       hour = hour2-hour1;
                                }
                                t = "" + hour + " hour";
                        }
                    }
                    else
                    {
                        int year1 = Integer.parseInt(x1.substring(6,10));
                        int year2 = Integer.parseInt(d1.substring(6,10));
                        if(year1==year2)
                        {
                            int month1 = Integer.parseInt(x1.substring(3,5));
                            int month2 = Integer.parseInt(d1.substring(3,5));
                            if(month1==month2)
                            {
                                int day1 = Integer.parseInt(x1.substring(0,2));
                                int day2 = Integer.parseInt(d1.substring(0,2));
                                int day = 0;
                                if(day1>day2)
                                {
                                    day = day1-day2;
                                }
                                else
                                {
                                    day = day2-day1;
                                }
                                t = "" + day + " day";
                            }
                            else
                            {
                                int month=0;
                                if(month1>month2)
                                {
                                    month = month1-month2;
                                }
                                else
                                {
                                       month = month2-month1;
                                }
                                t = "" + month + " month";
                            }
                        }
                        else
                        {
                                int year=0;
                                if(year1>year2)
                                {
                                    year = year1-year2;
                                }
                                else
                                {
                                       year = year2-year1;
                                }
                                t = "" + year + " year";
                        }
                    }

                    }
                    else if(f==3)
                    {
                        String d1 = date1.substring(0,11);
                        String x1 = date2.substring(0,11);
                        String d2 = date1.substring(12,20);
                        String x2 = date2.substring(12,20);
                        if(x1.equalsIgnoreCase(d1))
                        {
                            int hour1 = Integer.parseInt(x2.substring(0,2));
                            int hour2 = Integer.parseInt(d2.substring(0,2));
                            if(hour1==hour2)
                            {
                                int min1 = Integer.parseInt(x2.substring(3,5));
                                int min2 = Integer.parseInt(d2.substring(3,5));
                                if(min1==min2)
                                {
                                    int sec1 = Integer.parseInt(x2.substring(6,8));
                                    int sec2 = Integer.parseInt(d2.substring(6,8));
                                    int sec = 0;
                                    if(sec1>sec2)
                                    {
                                        sec = sec1-sec2;
                                    }
                                    else
                                    {
                                        sec = sec2-sec1;
                                    }
                                    t = "" + sec + " sec";
                                }
                                else
                                {
                                    int min=0;
                                    if(min1>min2)
                                    {
                                        min = min1-min2;
                                    }
                                    else
                                    {
                                           min = min2-min1;
                                    }
                                     t = "" + min + " min";
                                }
                            }
                            else
                            {
                                    int hour=0;
                                    if(hour1>hour2)
                                    {
                                        hour = hour1-hour2;
                                    }
                                    else
                                    {
                                           hour = hour2-hour1;
                                    }
                                    t = "" + hour + " hour";
                            }
                        }
                        else
                        {
                            int year1 = Integer.parseInt(x1.substring(7,11));
                            int year2 = Integer.parseInt(d1.substring(7,11));
                            if(year1==year2)
                            {
                                int month1 = Integer.parseInt(x1.substring(4,6));
                                int month2 = Integer.parseInt(d1.substring(4,6));
                                if(month1==month2)
                                {
                                    int day1 = Integer.parseInt(x1.substring(0,3));
                                    int day2 = Integer.parseInt(d1.substring(0,3));
                                    int day = 0;
                                    if(day1>day2)
                                    {
                                        day = day1-day2;
                                    }
                                    else
                                    {
                                        day = day2-day1;
                                    }
                                    t = "" + day + " day";

                                }
                                else
                                {
                                    int month=0;
                                    if(month1>month2)
                                    {
                                        month = month1-month2;
                                    }
                                    else
                                    {
                                           month = month2-month1;
                                    }
                                    t = "" + month + " month";
                                }
                            }
                            else
                            {
                                    int year=0;
                                    if(year1>year2)
                                    {
                                        year = year1-year2;
                                    }
                                    else
                                    {
                                           year = year2-year1;
                                    }
                                    t = "" + year + " year";
                            }
                        }

                    }
                    a[LID][1] = t;
                    /////==============================time-calc-over=============================////
                    
                    int flag = 0;
                    int i;
                    for( i=0;i<count;i++)
                    {
                        if(index[i]==LID)
                        {
                           flag=1;
                        }
                    }
                     if(flag==1)
                        {
                            index[i]= LID;
                            count = count-1;
                        }
                        else
                        {
                            index[count] = LID;
                        }
                }
            }
 }catch(Exception y){}
 %>  
</div>
<div class="sidebar-left" id="side_bar_l"> 
	<div class="sidebar-name-holder">
		
		<p class="sidebar-name">Recent Chats 
			<i class="fas fa-times" 
			style="float: right;margin-right: 20px; cursor: pointer;" 
			onclick="sideBarDeactive()"
			id="sidebarclosebtn" 
			class="side-close-btn"></i></p>
	
	</div>
<%
    for(int i=count;i>=0;i--)
    {
        int RID = index[i];
        try{
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info where id like '"+RID+"'");
            rs.next();
            String icon = rs.getString("icon");
            String fName = rs.getString("firstName");
            String lName = rs.getString("lastName");
    %>
	 <a href="home.jsp?rUID=<%out.print(RID);%>"> 
            <div class="person-holder">
		<div class="person-icon-holder">
			<div class="icon-hold">
                            <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
			</div>
		</div>
		<div class="person-text-holder">
			<div class="person-name-holder">
				<p class="person-name">
					<%out.print(fName+" "+lName);%>
				</p>
			</div>
			<div class="person-name-holder" style="height: 45px;">
				<p class="person-name" style="font-weight: 100; font-size: 16px; text-indent: 15px;">
					<%out.print(a[RID][0]);%>
				</p>
			</div>
		</div><!--person-text-holder-->
		<div class="person-indicator-holder">
			
			<p class="person-time"><i class="far fa-clock"></i> <%out.print(a[RID][1]);%> </p>
		
		</div><!--person-indicator-holder-->
	</div><!--person-holder-->
        </a>
<%
        
        }catch(Exception io){}
    %>
<%
    
    }

%>

	
	<div class="bottom-marginer-l">
		<p class="person-time" style="text-align: center;"> <%out.print(count+1);%> chats</p>
	</div>
 <div class="sidebar-name-holder"
	style="top: auto;bottom: 0px;
	background-color: #ff5e3a;
	 "> 
            <a href="clearLog.jsp?logOut=<%out.print(UID);%>"><p class="sidebar-name"
	style="text-align: center;
	color: white;
        font-size: 20px">Log Out</p></a>
	</div>

</div><!--sidebar-left-->


<!--__________________________________________________________-->
<!--__________________________________________________________-->

<!--__________________________________________________________-->

<!--__________________________________________________________-->


<div class="sidebar-right" id="side_bar_r">
	<div class=" sidebar-name-r">
		
		<p class="sidebar-name" style="">Active Friends
			<i class="fas fa-times" 
			style="float: right;margin-right: 20px; cursor: pointer;" 
			onclick="sideBarDeactiveR()"
			id="sidebarclosebtnR" 
			class="side-close-btn"></i></p>
	
	</div>


<% count = 1;
int i=0,j=0,k=0,active=0;
   try  {
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from friends where iUID like '"+UID+"' and sender like 1 and accepter like 1");
            while(rs.next())
            {
                j=j+1;
            }
           
            for(i=0;i<j;i++)
            {
            rs = stmt.executeQuery("select * from friends where iUID like '"+UID+"' and sender like 1 and accepter like 1");
            for(k=0;k<count;k++)
            {
                rs.next();
            }
            int rUID = Integer.parseInt(rs.getString("rUID"));
            count = count + 1;
            try {
                    rs = stmt.executeQuery("select * from logged where UID like '"+rUID+"' and status like 1");
                    rs.next();
                    String date = rs.getString("timeIn");
                    rs = stmt.executeQuery("select * from user_info where id like "+rUID);
                    rs.next();
                    String fName = rs.getString("firstName");
                    String lName = rs.getString("lastName");
                    String icon = rs.getString("icon");
                    String email = rs.getString("email");
                     active = active + 1;
                    %>
                    <a href="home.jsp?rUID=<%out.print(rUID);%>"> 
                        <div class="person-holder">
                                    <div class="person-icon-holder">
                                            <div class="icon-hold">
                                                <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
                                            </div>
                                    </div>
                                    <div class="person-text-holder">
                                            <div class="person-name-holder">
                                                    <p class="person-name">
                                                            <%out.print(fName+" "+lName);%>
                                                    </p>
                                            </div>
                                            <div class="person-name-holder" style="height: 45px;">
                                                    <p class="person-name" style="font-weight: 100; font-size: 16px; text-indent: 15px;">
                                                             <%out.print(email);%>
                                                    </p>
                                            </div>
                                    </div><!--person-text-holder-->
                                    <div class="person-indicator-holder">
                                            <p class="person-time person-m" >on</p>
                                    </div><!--person-indicator-holder-->
                            </div><!--person-holder-->
                    </a>
    
    <%
                }
            catch(Exception e){}
            }
        }
   catch(Exception t){
//out.print("outer fail");
} 
%>


	

	

	<div  class="bottom-marginer">
		<p class="person-time" style="text-align: center;"> <%out.print(active);%> active of <%out.print(j);%> friends</p>
	</div>
	
	
</div><!--sidebar-right-->

<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<!--________________________________________________________-->
<style type="text/css">
	.sizer
{
	width:100%-330px;
	margin-left: 330px;
	margin-right: 0px;
	min-height: 150px;
	height: 100%;	
}
@media screen and (max-width:1240px){
	.sidebar-left{width: 0px;}
	.sizer{margin-left: 0px;
			margin: auto;
			width: 1000px;}
}
@media screen and (max-width: 1057px){
	li.topnav-li:nth-child(6)
	{display: none;}
}
@media screen and (max-width: 1000px){
	.sizer{width: 100%;}
}
@media screen and (max-width: 950px){
	.text-search{
		width: 150px;
	}
}
@media screen and (max-width:750px){
	li.topnav-li:nth-child(4)
	{display: none;}
	li.topnav-li:nth-child(5)
	{display: none;}
	li.topnav-li-r
	{display: inline-block;
		}
	.text-search-icon
	{background-color: transparent;
	color: white;
	font-size: 18px;}
	
	
}
@media screen and (max-width:644px){
	li.topnav-li:nth-child(4)
	{display: none;}
	li.topnav-li:nth-child(5)
	{display: none;}
	li.topnav-li-r
	{display: inline-block;
		}
	.text-search-icon
	{background-color: transparent;
	color: white;
	font-size: 18px;}
	
}
</style>
<div style="width: 100%; height:70px;">
</div>
<div class="sizer">

	<div class="top-image-holder">
		<div class="top-image-text-holder">
			<p class="top-image-text">
				 Manage your Profile are here
			</p>
			<p class="top-image-text-bottom">
				Manage and Find your Friends here Manage and Find your Friends here Manage and Find your Friends here Manage and Find your Friends here Manage and Find your Friends here Manage and Find your Friends here
			</p>
		</div>
		<div class="top-image">
			<img src="images/account-bottom.png" class="welcome-image">
		</div>
	</div><!--top-image-holder-->
	
<style type="text/css">
.col-5
{
	width:100%;
	
}
.registor-pad{
	width: 800px;
	margin: auto;
	background-color:white;
	border-radius:5px;
	margin-bottom: 20px;
	transition: all 0.5s;
	}
.text
{
	width: 700px;
}
	
</style>
<%  int friends= 0;
 UID = 0;
 try{
            String email = "" + session.getAttribute("emailId");
            
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+email+"'");
            
            rs.next();
            String fname = rs.getString("firstName");
            String lname = rs.getString("lastName");
            String pass = rs.getString("password");
            String icon = rs.getString("icon");
            UID = Integer.parseInt(rs.getString("id"));
            String gender = rs.getString("gender");
            String contact = rs.getString("contact");
            String caste = rs.getString("caste");
            String religion = rs.getString("religion");
            String dosh = rs.getString("dosh");
            String maritalStatus = rs.getString("maritalStatus");
            String subcaste = rs.getString("subcaste");
            String height = rs.getString("height");
            String familyStatus = rs.getString("familyStatus");
            String familyType = rs.getString("familyType");
            String state = rs.getString("state");
            String age = rs.getString("age");
            String weight = rs.getString("weight");
            String city = rs.getString("city");
            
            
            int iUID = UID + 1234;
            try{
            rs = stmt.executeQuery("select * from friends where iUID like '"+UID+"' and sender like 1 and accepter like 1");
            while(rs.next())
            {
                friends = friends +1;
            }
            }catch(Exception e){}
%>
	<div class="col-5 reg-pad">
 	<div class="registor-pad">
            <form name="Registration" onsubmit="return regBtn()" method="post" action="createChange.jsp">
    	<div class="registor-text">
        	<p>Edit Profile
        		<span 
        		style="float: right; margin-right: 15px; font-weight: normal;font-size: 12px">
        		Fields you want unchanged left them as they are!
        		</span>
        	</p>
        </div><!--registor-text-->
        <div class="row" style="padding: 27px; padding-bottom: 13px">
            <input type="text" class="text" value="<%out.print(fname);%>" onkeyup="FirstNameValidator()" name="Fname" id="FnameId">
            	<p id="Fname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
       	</div>
          	<div class="row"  style="padding: 27px; padding-bottom: 13px;">
          		 	<input type="text" style="width: 700px;" class="text" value="<%out.print(lname);%>" onkeyup="LastNameValidator()" name="lname" id="LnameId">
          		 	<p id="Lname-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(email);%>" style="width: 700px;"  onblur="EmailValidator()" name="email" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        <div class="row" 
        style="padding:13px 27px;">
            	<input type="Password" 
            	class="text" value="<%out.print(pass);%>" style="width: 415px;"  onblur="PassValidator()" 
            	name="pass" id="passId">
            	
            	<p id="pass-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Gender</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="gender">
                    <option value="<%out.print(gender);%>" selected><%out.print(gender.toUpperCase());%></option>
            		<option value="male">Male</option>
            		<option value="female">Female</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
        
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Caste</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="caste">
                    <option value="<%out.print(caste);%>" selected><%out.print(caste.toUpperCase());%></option>
            		<option value="general">General</option>
                    <option value="obc">OBC</option>
                    <option value="st">ST</option>
                    <option value="sc">SC</option>
                    <option value="other">Other</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
        
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Religion</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="religion">
                    <option value="<%out.print(religion);%>" selected><%out.print(religion.toUpperCase());%></option>
            		<option value="hindu">Hindu</option>
                    <option value="muslim">Muslim</option>
                    <option value="sikh">Sikh</option>
                    <option value="christian">Christian</option>                    
                    <option value="jain">Jain</option>
                    <option value="other">Other</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
        
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Dosh</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="dosh">
                    <option value="<%out.print(dosh);%>" selected><%out.print(dosh.toUpperCase());%></option>
            		 <option value="no">No</option>
                    <option value="yes">Yes</option>
                    <option value="don't know">Don't know</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Marital status</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="maritalStatus">
                    <option value="<%out.print(maritalStatus);%>" selected><%out.print(maritalStatus.toUpperCase());%></option>
            		 <option value="never married">Never Married</option>
                    <option value="widow">widow</option>
                    <option value="divorced">divorced</option>
                    <option value="awaiting divorce">Awaiting divorce</option>     
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Family status</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="familyStatus">
                    <option value="<%out.print(familyStatus);%>" selected><%out.print(familyStatus.toUpperCase());%></option>
            		 <option value="middle class">Middle class</option>
                    <option value="upper middle class">Upper middle class</option>
                    <option value="rich">Rich</option>
                    <option value="affluent">Affluent</option>   
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Family type</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="familyType">
                    <option value="<%out.print(familyType);%>" selected><%out.print(familyType.toUpperCase());%></option>
            		<option value="joint">Joint</option>
                    <option value="nuclear">Nuclear</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        

         <div class="row" style="padding:13px 27px;margin-bottom: 10px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">State</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
     
                <select class="text" style="width: 200px;height: 50px" name="state">
                    <option value="<%out.print(state);%>" selected><%out.print(state.toUpperCase());%></option>
            		<option value="madhya pradesh">Madhya Pradesh</option>
                    <option value="uttar pradesh">Uttar Pradesh</option>
                    <option value="gujrat">Gujrat</option>
                    <option value="maharastra">Maharastra</option>
                    <option value="chattisgrah">Chattisgrah</option>
                    <option value="rajasthan">Rajasthan</option>
                    <option value="haryana">Haryana</option>
                    <option value="jammu and kashmir">Jammu and Kashmir</option>
            	</select>
              
            </div>
        	</div>
        </div><!--row-->
        
        
         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(contact);%>" style="width: 700px;" name="contact" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        
        
       
        
         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(subcaste);%>" style="width: 700px;" name="subcaste" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        
         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(height);%>" style="width: 700px;" name="height" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        
         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(weight);%>" style="width: 700px;" name="weight" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->

         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(age);%>" style="width: 700px;" name="age" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        
        
         <div class="row" style="padding: 27px; padding-bottom: 13px">
            	<input type="text" class="text" value="<%out.print(city);%>" style="width: 700px;" name="city" id="emailId" >
            	<p id="email-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
        </div><!--row-->
        
        <div class="row" style="padding:13px 27px;margin-bottom: 10px; ">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri; padding-bottom: 0px">Current-icon:<%out.print(icon);%></p>
         		<p style="padding: 0px; margin: 0px; color: gray; font-size: 16px; font-family: calibri">Use selector to change image</p>
         	</div>
         	<div  style="float: left; width: 70%;margin-bottom: 20px">
            	
                <select class="text" style="width: 200px;height: 50px" name="iconSelector">
                    <% 
                         i=0;
                        for(i=1;i<140;i++)
                        {%>
                        <option value="<%out.print("icons/i"+i+".png");%>"><%out.print("i"+i);%></option>
                    <%
                    }
                    %>
            	</select>
               
            </div>
        	</div>
        </div><!--row-->
        <%
}catch(Exception ex){}
 %>

        <div class="row" style="padding:13px 27px;margin-bottom: 60px">
         	<div>
         	<div style="float: left; width: 30%;">
         		<p style="padding: 10px; margin: 0px; color: gray; font-size: 20px; font-family: calibri">Profile Icon Names<i class="fas fa-caret-down" onclick="iconDrop()"></i> 
                            
                        </p>
         	</div>
         	
        	</div>
        </div><!--row-->
        <div class="row" style="padding:8px 49px;">
        	<div class="icon-group-hold">
   <%     	 try{
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from icons");
            for( i=1;i<140;i++)
            {
         %>
        		<div class="icon-grid">
        			<div class="icon-block">
                                    <img src="icons/i<%out.print(i);%>.png" class="full">
        			</div>
        			<div class="icon-text-block">
        				<p class="icon-name-text">i<%out.print(i);%></p>
        			</div>
        		</div><!--icongrid-->
<%   }}catch(Exception e){}
   %>
			</div><!--icon-group-hold-->
        </div><!--row-->
       
        <div class="row" style="padding:30px 35px;margin-top: 0px">
        	<p id="regBtn-text-print" style="padding: 0px; margin: 0px; color:red; font-size: 20px; font-family: calibri"></p>
                <input type="submit" class="regComplete"  id="reg-a" value="Change!">

         </div><!--/row-->
     </form>
    </div><!--registor-pad-->
  </div><!--/col-5-->


</div><!--sizer-->
<script type="text/javascript">
   function EmailValidatorM()
{
	var val = document.searcher.email.value;
	var atposition = val.indexOf("@");
	var dotposition = val.lastIndexOf(".");
	if(atposition<1 || dotposition<atposition+2 || dotposition+2>=val.length)
	{
		alert("Enter a valid email");
                return false;
	}	
}
</script>
<script defer src="js/fontawesome-all.js"></script>
<script type="text/javascript" src="js/editProfile.js"></script>
<script type="text/javascript" src="js/home.js"></script>
</body>
</html>
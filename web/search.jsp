<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
	<title>Find Friends</title>
	<link rel="stylesheet" type="text/css" href="css/navigationBar.css">
	<link rel="stylesheet" type="text/css" href="css/logIn.css">
	<link rel="stylesheet" type="text/css" href="css/findFriend.css">
	<meta charset="utf-8">
</head>

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
@media screen and (max-width: 1095px){
	li.topnav-li:nth-child(6)
	{display: none;}
}
@media screen and (max-width: 1025px){
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
<style id="sizeLoader">
</style><%  session.setAttribute("emailId", session.getAttribute("emailId"));
 
%>
<body style="background:none" onload="positionSizer()">
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
					<a href="#" class="nav-page-text">Find Friends</a>
				</li>
				<li class="topnav-li" style="position: relative;">
					<a href="#" class="nav-page-text">
						<i class="fas fa-caret-down"></i>
					</a>
					<div class="dropdown">
						<a href="#" class="nav-page-text" style="font-size: 16px; color: gray"><i class="fas fa-user-plus"></i><span style="padding: 10px">Home
						<span class="person-time person-m" 
						style="background-color: mediumseagreen">&nbsp;1&nbsp;</span>

						</span></a>
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
					<a href="home.jsp" class="nav-page-text" style="font-size: 16px"><i class="fas fa-home"></i><span style="padding: 10px">Home
						<span class="person-time person-m" 
						style="background-color: mediumseagreen">&nbsp;1&nbsp;</span></span></a>
				</li>
				<li class="topnav-li" >
					<a href="profilePage.jsp" class="nav-page-text" style="font-size: 16px"><i class="fas fa-user"></i>
					<span style="padding: 10px"> Profile</span></a>
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
<div style="width: 100%; height: 70px">
</div>
<div class="sizer" style="background-color: #f1f1f1">
	<div class="top-image-holder">
		<div class="top-image-text-holder">
			<p class="top-image-text">
				Search results here
			</p>
			<p class="top-image-text-bottom">
				Easily find new and old friends from here via email
			</p>
		</div>
		<div class="top-image">
			<img src="images/group-bottom.png" class="welcome-image">
		</div>
	</div><!--top-image-holder-->
        <%
      //      if((session.getAttribute("actionBtnClick")).equals(null)){out.print("worked");}
        %>
	
        <div class="friend-zone">
		<div class="grid-hold">
                <%
                     try 
                        {    //-----try-1  
                        Class .forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
                        Statement stmt=(Statement) con.createStatement();
                        String email = request.getParameter("email");
                        String iEmail = session.getAttribute("emailId").toString();
                        ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+iEmail+"'");
                        rs.next();
                        UID = Integer.parseInt(rs.getString("id"));
                        rs = stmt.executeQuery("select * from user_info where email like '"+email+"'");
                        rs.next();
                        int rUID = Integer.parseInt(rs.getString("id"));
                        String fName = rs.getString("firstName");
                        String lName = rs.getString("lastName");
                        String icon = rs.getString("icon");
                        try{
                            rs = stmt.executeQuery("select * from friends where iUID like '"+UID+"' and rUID like '"+rUID+"'");
                            rs.next();
                            int sender = Integer.parseInt(rs.getString("sender"));
                            int accepter = Integer.parseInt(rs.getString("accepter"));
                            if(sender==0 && accepter == 0)
                            { 
                                int requestBtn = rUID * 10 +1;
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer;" title="send Request">	
					<div class="action-btn" style="margin-left: 40px;">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                            else if(sender==0 && accepter == 1)
                            { int requestBtn = rUID * 10 +4;
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer;" title="accept Request">	
					<div class="action-btn" style="margin-left: 40px;background: mediumseagreen">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                            else if(sender==1 && accepter == 0)
                            { 
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="#" style="cursor:not-allowed;" title="Already sent Request">	
					<div class="action-btn" style="margin-left: 40px;">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                             else  if(sender==1 && accepter == 1)
                            { int requestBtn = rUID * 10 +5;
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px " title="unfriend">	
					<div class="action-btn" style="background:tomato;margin-left: 25px ; margin-right:5px">
						<i class="fas fa-user-times action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px" title="View Profile">	
					<div class="action-btn" style=" margin-left: 5px ; margin-right:5px">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
                                        
                                         <a href="home.jsp?rUID=<%out.print(rUID);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px" title="chatRoom">	
					<div class="action-btn" style=" margin-left: 5px ; margin-right:10px">
						<i class="far fa-comments action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                        }catch(Exception qw){
                         try{
                            rs = stmt.executeQuery("select * from friends where rUID like '"+UID+"' and iUID like '"+rUID+"'");
                            rs.next();
                            int sender = Integer.parseInt(rs.getString("sender"));
                            int accepter = Integer.parseInt(rs.getString("accepter"));
                             if(sender==0 && accepter == 0)
                            { 
                                int requestBtn = rUID * 10 +1;
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer;" title="send Request">	
					<div class="action-btn" style="margin-left: 40px;">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                            else if(sender==0 && accepter == 1)
                            { int requestBtn = rUID * 10 +4;
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer;" title="accept Request">	
					<div class="action-btn" style="margin-left: 40px;background: mediumseagreen">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                            else if(sender==1 && accepter == 0)
                            { 
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="#" style="cursor:not-allowed;" title="Already sent Request">	
					<div class="action-btn" style="margin-left: 40px;">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                             else  if(sender==1 && accepter == 1)
                            { int requestBtn = rUID * 10 +5;
                                
                                %>
                
                     <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px " title="unfriend">	
					<div class="action-btn" style="background:tomato;margin-left: 25px ; margin-right:5px">
						<i class="fas fa-user-times action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px" title="View Profile">	
					<div class="action-btn" style=" margin-left: 5px ; margin-right:5px">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
                                        
                                         <a href="home.jsp?rUID=<%out.print(rUID);%>" style="cursor:pointer; margin-left: 0px ; margin-right:0px" title="chatRoom">	
					<div class="action-btn" style=" margin-left: 5px ; margin-right:10px">
						<i class="far fa-comments action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                            }
                        }
                        catch(Exception to){
                            int requestBtn = rUID * 10 + 1;
                        %>
                
                        <div class="grid">
				<div class="friend-icon-hold">
                                    <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
				</div>
				<div class="friend-name-hold">
					<p class="friend-name">
                                            <%out.print(fName+" "+lName);%>
                                        </p>
					<p class="friend-name-mutual"><%out.print(email);%></p>
				</div>
				<div class="friend-action-btn-holder">
					<a  href="userInterface.jsp?actionBtn=<%out.print(requestBtn);%>" style="cursor:pointer;" title="send Request">	
					<div class="action-btn" style="margin-left: 40px;">
						<i class="fas fa-user-plus action-icon"></i>
					</div>
                                        </a>
                                       
                                        <a href="profilePage2.jsp?action1Btn=<%out.print(rUID);%>" style="cursor:pointer" title="View Profile">	
					<div class="action-btn">
						<i class="fas fa-eye action-icon"></i>
					</div>
                                        </a>
				</div>
			</div><!--grid-->
                    
                    <%
                        }}
                        %>
                
                    
                    
                    <%
                        }catch(Exception io){out.print("---catch----");}
                %>
                   

		</div><!--grid-hold-->
	</div><!--friend-zone-->

	
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
<script type="text/javascript" src="js/home.js"></script>
</body>
</html>
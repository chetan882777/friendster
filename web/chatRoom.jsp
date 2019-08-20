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
	<title></title>
	
</head>
	

<link rel="stylesheet" type="text/css" href="css/chatRoom.css">	
<meta charset="utf-8">
<%
    try{
    session.setAttribute("emailId", session.getAttribute("emailId"));
    }catch(Exception t){out.print("/-/-/-/-/-/-/-/-/-/-/");}
   int rUID=0;
    try{
    rUID = Integer.parseInt(request.getParameter("rUID"));
    session.setAttribute("rUID", rUID);
    }catch(Exception t){
        try{
        rUID = Integer.parseInt(session.getAttribute("rUID").toString());
        try{
            String msg = request.getParameter("inputField");
            int CrID = Integer.parseInt(request.getParameter("hidden"));
            Date d = new Date();//date object
            SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");//date formatting object
            String date = formatter.format(d);//get current date
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+session.getAttribute("emailId")+"'");
            rs.next();
            int UID = Integer.parseInt(rs.getString("id"));
            stmt.executeUpdate("INSERT INTO `chartroom` (`sno`, `CrID`, `sUID`, `time`, `message`, `status`) VALUES (NULL, '"+CrID+"', '"+UID+"', '"+date+"', '"+msg+"', '1');");
        }catch(Exception et){
           // out.print("--in-inner-catch");
        }
        }catch(Exception ty){} 
    }
    try{
    String iEmail = (session.getAttribute("emailId").toString());
    int UID=0;
    int CrID;
    try{
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+iEmail+"'");
            rs.next();
            UID = Integer.parseInt(rs.getString("id"));
            rs = stmt.executeQuery("select * from user_info where id like '"+rUID+"'");
            if(UID>rUID)
            {
                CrID = UID * 1000 + rUID;
            }
            else
            {
                CrID = rUID * 1000 + UID;
            }
            rs.next();
            String fname = rs.getString("firstName");
            String lname = rs.getString("lastName");
            String email = rs.getString("email");
            String icon = rs.getString("icon");
            int visit = UID*1000 + rUID;
            
       %>
<body style="background: #e6ecf5">
<div  class="message-block" onload="positionSizer()">
<div class="person-id">
	<div class="icon-hold">
            <img src="<%out.print(icon);%>" style="width: 100%; height: 100%;">
	</div>
            <a href="profilePage2.jsp?action1Btn=<%out.print(visit);%>" target="_parent">
	<div class="person-text">
		<div class="person-top-text">
			<p class="top-text">
				<%
                                out.print(fname+" "+lname);
                                %>
			</p>
		</div>
		<div class="person-bottom-text">
			<p class="bottom-text">
				<%out.print(email);%> 
			</p>
		</div>
	</div>
        </a>
	<div class="ellpsis-v-btn">
            <a href="chatRoom.jsp"><p class="top-text ellepsis-text" style="width:25px;margin-right: 25px">
		<i class="fas fa-undo"></i>
                </p></a>
	</div>
</div><!--person-id-->
<div id="messages" class="messagesC">
<% 
    try{
       rs = stmt.executeQuery("select * from chartroom where CrID like '"+CrID+"'");
       int ID=0;
       while(rs.next())
       {
           ID = Integer.parseInt(rs.getString("sUID"));
           String msg = rs.getString("message");
           String time = rs.getString("time");
           int l = time.length();
           String t = "";
           if(l>0)
           {
            Date d = new Date();//date object
                    SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");//date formatting object
                    String date = formatter.format(d);//get current date
                
                    String date1 = time;
                    String date2 = date;
                     t="";   
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
           }
           if(ID==rUID)
           {
               %>

               <div class="message-row">
			<div class="transfer-message-block-r">
				<p class="transfer-message-r">
					<%out.print(msg);%>
					<span class="text-time-r"><br><%out.print(t);%></span>
				</p>
			</div>
		</div><!--message-row-->
            
                <%
           }
           else
            {
            %>
                
                <div class="message-row">
			<div class="transfer-message-block-s">
				<p class="transfer-message-s">
					<%out.print(msg);%>
					<span class="text-time-r"><br><%out.print(t);%></span>
				</p>
			</div>
		</div><!--message-row-->
                
                <%
            }
       }
       
       %>
	
		

		<div class="message-row">
                    <p class="transfer-message-s" style="padding: 0px;box-shadow: none;">
					
				</p>
		
		</div><!--message-row-->

        <%
    }catch(Exception ex){
    %>
        
                <div class="message-row">
			<div class="transfer-message-block-r">
				<p class="transfer-message-r">
					Hi
					<span class="text-time-r"><br>10:26 P.M.</span>
				</p>
			</div>
		</div><!--message-row-->

		<div class="message-row">
			<div class="transfer-message-block-s">
				<p class="transfer-message-s">
					Say hi to him!
					<span class="text-time-r"><br>10:28 P.M.</span>
				</p>
			</div>
		</div><!--message-row-->


		<div class="message-row">
                    <p class="transfer-message-s" style="padding: 0px;box-shadow: none;">
					
				</p>
		
		</div><!--message-row-->
                
                <%

}
%>
</div>
</div><!--message-block-->	
<div class="typer-hold">
    <form name="typer" method="post" action="chatRoom.jsp">
			<div class="text-field-hold">
				<input type="text" 
				class="input-text-field text-style" 
				placeholder="Type a message"
				name="inputField" 
				>
			</div>
	
	<div class="text-icon ">
            <input type="hidden" name="hidden" value="<%out.print(CrID);%>">
            <button type="submit" style="border: none; background: none">
                <p class="text-style send-icon" onclick="sendMessage()">
                    <i class="fas fa-paper-plane">
                    </i>
                </p>
            </button>
	</div>
    </form>    
</div>
<%     
    }catch(Exception tt){}
}catch(Exception io){
%>
<h1>select a chat</h1> 
<%
}
%>
<script defer src="js/fontawesome-all.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
</body>
</html>
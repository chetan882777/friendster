<%-- 
    Document   : process.jsp
    Created on : Mar 22, 2018, 10:35:29 PM
    Author     : hp
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><%session.setAttribute("emailId", session.getAttribute("emailId"));%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing..</title>
    </head>
    <body>
     
      %>
        <%
                
                String fName = request.getParameter("Fname");
                out.print(fName);
                String lName = request.getParameter("lname");
                String eMail = request.getParameter("email");
                String pass = request.getParameter("pass");
                String gender =request.getParameter("gender");
                String caste =request.getParameter("caste");
                String religion =request.getParameter("religion");
                String dosh =request.getParameter("dosh");
                String maritalStatus =request.getParameter("maritalStatus");
                String familyStatus =request.getParameter("familyStatus");
                String familyType =request.getParameter("familyType");
                String state =request.getParameter("state");
                String contact =request.getParameter("contact");
                String subcaste =request.getParameter("subcaste");
                String height =request.getParameter("height");
                String weight =request.getParameter("weight");
                String age = request.getParameter("age");
                String city = request.getParameter("city");
                try {    //-----try-1                                                                                      
                    Class .forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
                    Statement stmt=(Statement) con.createStatement();
                    String iEmail = session.getAttribute("emailId").toString();
                    out.print(iEmail);
                    ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+iEmail+"'");
                    rs.next();
                    int UID = Integer.parseInt(rs.getString("id"));
                    stmt.executeUpdate("UPDATE `user_info` SET `firstName` = '"+fName+"',"
                            + " `lastName` = '"+lName+"', `email` = '"+eMail+"', "
                                    + "`password` = '"+pass+"', `gender` = '"+gender+"',"
                                            + " `caste` = '"+caste+"', `religion` = '"+religion+"',"
                                                    + " `dosh` = '"+dosh+"', `maritalStatus` = '"+maritalStatus+"',"
                                                            + " `familyStatus` = '"+familyStatus+"', `familyType` = '"+familyType+"',"
                                                                    + " `state` = '"+state+"', `contact` = '"+contact+"',"
                                                                            + " `subcaste` = '"+subcaste+"', `height` = '"+height+"',"
                                                                                    + " `weight` = '"+weight+"', `age` = '"+age+"',"
                                                                                            + " `city` = '"+city+"' WHERE `user_info`.`id` = "+UID);
                    out.print("done");
                    response.sendRedirect("profilePage.jsp");
                    }//-----/try-1
                catch(Exception ex)//catch-1
                   {                                                                      
                    out.print("\n\n\tFailed");
             
            %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Failed");%></h1><%
  
                   }//--/catch-1                                                                     
          
%>
    </body>
</html>

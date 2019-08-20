<%-- 
    Document   : process.jsp
    Created on : Mar 22, 2018, 10:35:29 PM
    Author     : hp
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing..</title>
    </head>
    <body>
     
      
        <%
            session.setAttribute("emailId", session.getAttribute("emailId"));
            String emailId = ("" + session.getAttribute("emailId"));
            String hidden = request.getParameter("signType");
            if(hidden.equalsIgnoreCase("signUp"))
            {
            
                String age1 = request.getParameter("fromAge");
                String age2 = request.getParameter("toAge");
                String gender =request.getParameter("gender");
                String caste =request.getParameter("caste");
                String religion =request.getParameter("religion");
                String dosh =request.getParameter("dosh");
                String maritalStatus =request.getParameter("maritalStatus");
                String familyStatus =request.getParameter("familyStatus");
                String familyType =request.getParameter("familyType");
                String state =request.getParameter("state");
                int x=0;
            
                try {    //-----try-1                                                                                      
                    Class .forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
                    Statement stmt=(Statement) con.createStatement();
                    out.print("connection");
                    try{
                        
                    out.print("connection----");
                    ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+emailId+"'");
                    
                    out.print("connection----");
                    rs.next();
                    String z = rs.getString("email");
                    x=1;
                    }catch(Exception to){}
                    
                  
                    stmt.executeUpdate("INSERT INTO `look_for` (`email`, `gender`, `caste` , `religion`, `dosh` , `maritalStatus`,`ageFrom`,`ageTo`, `familyStatus`, `familyType` , `state`)"
                           + " VALUES ('"+emailId+"', '"+gender+"', '"+caste + "', '"+religion + "', '"+dosh+ "', '"+maritalStatus + "', '"+age1 + "', '"+age2 + "', '"+familyStatus + "', '"+familyType + "', '"+state + "')");
              //     stmt.executeUpdate("INSERT INTO `sys_info` (`sno`, `UID`, `userAgent`, `browser`, `OS`) VALUES (NULL, '"+UID+"', '"+userAgent1+"', '"+browser+"', '"+os+"');");
                   session.setAttribute("emailId", emailId);
              //     stmt.executeUpdate("INSERT INTO `logged` (`email`, `password`, `UID`, `IP`, `hostName`, `status`, `timeIn`, `timeOut`, `acess`) VALUES ('"+eMail+"', '"+pass+"', '"+UID+"', '"+ipAddress+"', '"+hostName+"', '1', '"+date+"', NULL, 'denied');");
                
                   response.sendRedirect("home.jsp");//send to grab some friends
                   
                }//-----/try-1
                catch(Exception ex)//catch-1
                    {                                                                      
                    out.print("\n\n\tFailed");
             
            %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Failed");%></h1><%
  
                   // response.sendRedirect("logIn.html");   //send back to login page                                                          
                    }//--/catch-1                                                                     
            }//if(hidden)
             
        %>
    </body>
</html>

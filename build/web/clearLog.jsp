<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<% int UID = Integer.parseInt(request.getParameter("logOut"));
    try {    //-----try-1                                                                                      
                        
            Class .forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
            Statement stmt=(Statement) con.createStatement();
            Date d = new Date();//date object
            SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/YYYY HH:mm:ss");//date formatting object
            String date = formatter.format(d);//get current date
            out.print(date);
            stmt.executeUpdate("UPDATE `logged` SET `timeOut` = '"+date+"', `status` = 0  WHERE `logged`.`UID` = "+UID+" and `status` = 1");
            response.sendRedirect("logIn.jsp");//send to back to logIn page
                   
                 }//-----/try-1
                catch(Exception ex)
                    {                                                                      
        %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Failed");%></h1><%

              %>
              
        <%
                  // response.sendRedirect("logIn.html");   //send back to login page                                                          
                    }//catch-try-1   %>
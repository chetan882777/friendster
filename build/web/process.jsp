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
            String hidden = request.getParameter("signType");
            if(hidden.equalsIgnoreCase("signUp"))
            {
                String fName = request.getParameter("Fname");
                String lName = request.getParameter("lname");
                String eMail = request.getParameter("email");
                String pass = request.getParameter("pass");
                String contact = request.getParameter("contact");
                String subCaste = request.getParameter("subCaste");
                String height = request.getParameter("height");
                String weight = request.getParameter("weight");
                String city = request.getParameter("city");
                String gender =request.getParameter("gender");
                String caste =request.getParameter("caste");
                String religion =request.getParameter("religion");
                String dosh =request.getParameter("dosh");
                String maritalStatus =request.getParameter("maritalStatus");
                String familyStatus =request.getParameter("familyStatus");
                String familyType =request.getParameter("familyType");
                String state =request.getParameter("state");
                String age = request.getParameter("age");
                int x=0;
            
                try {    //-----try-1                                                                                      
                    Class .forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
                    Statement stmt=(Statement) con.createStatement();
                    out.print("connection");
                    try{
                        
                    out.print("connection----");
                    ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+eMail+"'");
                    
                    out.print("connection----");
                    rs.next();
                    String z = rs.getString("email");
                    x=1;
                    }catch(Exception to){}
                    if(x==0)
                    {
                  
                    stmt.executeUpdate("INSERT INTO `user_info` (`firstName`, `lastName`, `email`, `password`, `gender`, `contact`, `caste` , `religion`, `dosh` , `maritalStatus`, `subCaste`, `height`, `familyStatus`, `familyType` , `state`, `weight`, `city`, `age`)"
                           + " VALUES ('"+fName+"', '"+lName+"', '"+eMail+"', '"+pass+"', '"+gender+"', '"+""+contact + "', '"+caste + "', '"+religion + "', '"+dosh+ "', '"+maritalStatus + "', '"+subCaste + "', '"+height + "', '"+familyStatus + "', '"+familyType + "', '"+state + "', '"+weight + "', '"+city + "', '"+age + "')");
              //     stmt.executeUpdate("INSERT INTO `sys_info` (`sno`, `UID`, `userAgent`, `browser`, `OS`) VALUES (NULL, '"+UID+"', '"+userAgent1+"', '"+browser+"', '"+os+"');");
                   session.setAttribute("emailId", eMail);
              //     stmt.executeUpdate("INSERT INTO `logged` (`email`, `password`, `UID`, `IP`, `hostName`, `status`, `timeIn`, `timeOut`, `acess`) VALUES ('"+eMail+"', '"+pass+"', '"+UID+"', '"+ipAddress+"', '"+hostName+"', '1', '"+date+"', NULL, 'denied');");
                
                   response.sendRedirect("lookFor.jsp");//send to grab some friends
                    }
                    else
                    {
                    %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri">Email is already in use, get back n try another</h1><%
  
                    }
                }//-----/try-1
                catch(Exception ex)//catch-1
                    {                                                                      
                    out.print("\n\n\tFailed");
             
            %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Failed");%></h1><%
  
                   // response.sendRedirect("logIn.html");   //send back to login page                                                          
                    }//--/catch-1                                                                     
            }//if(hidden)
             else
                {
                    String iEmail = "";
                    String eMail1 = request.getParameter("email1");
                    String pass1 = request.getParameter("pass1");
                     try {    //-----try-1                                                                                      
                        Class .forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
                        Statement stmt=(Statement) con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from user_info where email like '"+eMail1+"'");
                        rs.next();
                        try{//try-2
                        iEmail = rs.getString("email");
                        }catch(Exception ex){ //---/try-2 , catch-2

%><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Invalid email ,get back and try again");%></h1><%
                            
                                   } //---/catch-2
                        String iPass = rs.getString("password");
                        if(iPass.equalsIgnoreCase(pass1))
                            {
                
                   %>
                   
                   
        <form action="home.jsp" method="post">
            <input type="hidden" value="<%=iEmail%>" name="emailId">
        </form>
        
        <% 
                session.setAttribute("emailId", iEmail);

                    response.sendRedirect("home.jsp");//send to home page
                 }
                 
               
                    else
                    {
                   %>  <%
            %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Invalid Password ,get back and try again");%></h1><%

                     //   response.sendRedirect("home.jsp");//send to back to logIn page
                    }
                 }//-----/try-1
                catch(Exception ex)
                    {                                                                      
        %><h1 style=" text-align: center;color: gray; margin-top: 20px;font-family: calibri"><% out.print("Failed");%></h1><%

              %>
              
        <%
                  // response.sendRedirect("logIn.html");   //send back to login page                                                          
                    }//catch-try-1                                                                     
            }//if(hidden)
                
        %>
    </body>
</html>

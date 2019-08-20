<%-- 
    Document   : userInterface.jsp
    Created on : Mar 24, 2018, 12:32:50 PM
    Author     : hp
--%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
     try 
       {    //-----try-1   
          Class .forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/matchmaker","root","");  //databse connectivity                                                                                               
          Statement stmt=(Statement) con.createStatement();
            ResultSet  rs = stmt.executeQuery("select * from user_info where email like '"+session.getAttribute("emailId")+"'");
              rs.next();
              int iUID = Integer.parseInt(rs.getString("id"));
              int action = Integer.parseInt(request.getParameter("actionBtn"));
              int btn = action%10;
              int UID = action/10;
              session.setAttribute("action", action);
              switch(btn)
              {
                case 1:
                       out.print("case 1");
                       stmt.executeUpdate("INSERT INTO `friends` (`sno`, `iUID`, `rUID`, `accepter`, `sender`, `block`) VALUES (NULL, '"+iUID+"', '"+UID+"', '0', '1', '0');");
                       stmt.executeUpdate("INSERT INTO `friends` (`sno`, `iUID`, `rUID`, `accepter`, `sender`, `block`) VALUES (NULL, '"+UID+"', '"+iUID+"', '1', '0', '0');");
                       response.sendRedirect("findFriend3.jsp");
                        break;
                case 2:
                    
                       out.print("case 2");
                    stmt.executeUpdate("INSERT INTO `friends` (`sno`, `iUID`, `rUID`, `accepter`, `sender`, `block`) VALUES (NULL, '"+iUID+"', '"+UID+"', '0', '0', '1');");
                           response.sendRedirect("findFriend3.jsp");
                        break;
                case 4:out.print("in case-4");
                        stmt.executeUpdate("UPDATE `friends` SET `accepter` = '1' WHERE `friends`.`iUID` = "+UID);
                        out.print("-----query-1-----");
                        stmt.executeUpdate("UPDATE `friends` SET `sender` = '1' WHERE `friends`.`iUID` = "+UID);
                        out.print("-----query-2-----");
                        stmt.executeUpdate("UPDATE `friends` SET `accepter` = '1' WHERE `friends`.`iUID` = "+iUID);
                        out.print("-----query-3-----");
                        stmt.executeUpdate("UPDATE `friends` SET `sender` = '1' WHERE `friends`.`iUID` = "+iUID);
                        out.print("-----query-4-----");
                        response.sendRedirect("findFriend3.jsp");
                        break;
                
                case 5:out.print("in case-");
                        stmt.executeUpdate("DELETE FROM `friends` WHERE `friends`.`iUID` = "+UID);
                        out.print("-----query-1-----");
                        stmt.executeUpdate("DELETE FROM `friends` WHERE `friends`.`iUID` = "+iUID);
                        out.print("-----query-4-----");
                        response.sendRedirect("findFriend3.jsp");
                        break;  
              }
         
        }                 
     catch(Exception ex){
         out.print("failed");
    }
%>



    </head>
    <body>
    </body>
</html>

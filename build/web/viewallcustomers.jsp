<%@page import="Model.DAO"%>
<%@page import="Model.DAOFactory"%>
<%@page import="Model.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Trainees</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark adminheader">
            <a class="navbar-brand" href="adminhome.jsp"><img class="adminheaderimg" src="Assets/Images/fitlogo2.png"></a>
            <a class="adminlogout adminmngphome" href="adminhome.jsp"><img height="33px" src="Assets/Images/home.png">&nbsp; Home</a>
            <a class="adminlogout adminmngplogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
        </nav>
        
        <div class="mid viewusersmid">
            <div class="adminusersdiv">
                <table class="table">
                    <thead class="thead-dark">
                      <tr>
                        <th scope="col">E-mail Address</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Contact Number</th>
                        <th scope="col">Password</th>
                        <th scope="col">Date of Birth</th>
                        <th scope="col">Age</th>
                        <th scope="col">Height</th>
                        <th scope="col">Weight</th>
                        <th scope="col">BMI</th>
                        <th scope="col">Addresses</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            String address;
                            DAO dao = DAOFactory.createRole("admin");
                            ResultSet rs = dao.getAllCustomers();
                            while(rs.next()){
                                if (rs.getString("address")==null)  
                                {
                                    address = "No address saved";
                                }
                                else
                                {
                                    address = rs.getString("address");
                                }
                        %>
                      <tr>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("firstname")%></td>
                        <td><%=rs.getString("lastname")%></td>
                        <td><%=rs.getString("gender")%></td>
                        <td><%=rs.getString("contactnumber")%></td>
                        <td><%=rs.getString("password")%></td>
                        <td><%=rs.getString("dob")%></td>
                        <td><%=rs.getString("age")%></td>
                        <td><%=rs.getString("height")%></td>
                        <td><%=rs.getString("weight")%></td>
                        <td><%=rs.getString("bmi")%></td>
                        <td><%=address%></td>
                        
                      </tr>
                      <%
                        }
                      %>
                    </tbody>
                  </table>
            </div>
        </div>
    </body>
</html>

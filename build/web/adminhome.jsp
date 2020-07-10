<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <div class="adminmid">
            <% session.setAttribute("mail", session.getAttribute("email"));%>
            <label class="welcomeadmintxt">Welcome <%= session.getAttribute("fullname")%>!</label>
            <a class="adminlogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
            <img class="adminhomeimg" src="Assets/Images/fitlogo2.png">
            <table class="adminhomemenu">
                <tr>
                    <td>
                        <a class="adminhomemenuitem" href="viewallcustomers.jsp">View Users</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="adminhomemenuitem" href="AdminProduct">Manage Products</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="adminhomemenuitem" href="AdminOrders">Manage Orders</a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

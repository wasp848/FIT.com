<%-- 
    Document   : delivery
    Created on : Jul 13, 2020, 11:16:05 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - Login</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <div style="background-color: #333333;text-align: center;">
            <c:if test="${empty requestScope.registermessage}">
                <label style="color: #ff0b0b;font-weight: bold;">${requestScope.loginmessage}</label>
            </c:if>
            <c:if test="${not empty requestScope.registermessage}">
                <label style="color: #ff0b0b;font-weight: bold;">${requestScope.registermessage}</label>
            </c:if>
        </div>
        
         <nav class="navbar navbar-dark bg-dark custoomnav">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             
             <div>
                 <table style="right: 2%;" class="navbar-nav mr-auto navnormal">
                    <tr>
                        <td>
                            <a href="login.jsp"><button style="margin-right: 10px;" class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                        </td>
                        <td>
                             <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                        </td>
                    </tr>
                </table>
             </div>
        </nav>
        
        
        <c:if test="${empty sessionScope.email}">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mobilenav">
                 <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
                 <table class="navtable">
                     <tr>
                         <td>
                            <a href="login.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                         </td>
                         <td>
                            <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                         </td>
                     </tr>
                 </table>
            </nav>
        </c:if>
        
        <div class="loginmid">
             <div class="registerbgform loginbgform">
                <form id="registertraineeform" class="registerform" action="Login" method="POST">
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>
                                <label class="registerformlbl loginrfl" for="exampleInputEmail1">Email address</label>
                                <br><input type="email" name="mail" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                <label class="errorlbl">${requestScope.emailmessage}</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="registerformlbl loginrfl" for="exampleInputEmail1">Password</label>
                                <input type="password" name="pwd" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                <label class="errorlbl">${requestScope.pwdmessage}</label>
                            </td>
                        </tr>
                    </table>
                            
                    <br><button type="submit" class="btn registerbtn">Login</button>
                    
                    <div class="submit-legalese">
                        <br>Don't have an account?<br><a href="register.jsp">Sign up here</a>
                    </div>
                </form>
             </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

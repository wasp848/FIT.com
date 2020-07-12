<%-- 
    Document   : register
    Created on : May 6, 2020, 11:38:22 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIT.com - Register</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="routines.jsp">Routines <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="CustomerProduct">Shop</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="contact.jsp">Contact Us</a>
                    </li>
                </ul>
                 <div class="headeraccount">
                      <c:if test="${not empty email}">
                        <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu loggedindmenu" aria-labelledby="dLabel">
                            <button class="viewprof"><a href="profile.jsp">Go to Profile</a></button>
                            <div class="dropdown-divider"></div>
                            <button class="dropdown-item logsignup"><a href="Logout">Logout</a></button>   
                        </div>
                     </c:if>
                     <c:if test="${empty email}">
                        <a id="accountd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu reglogdmenu" aria-labelledby="accountd">
                            <form class="px-4 py-3" action="Login" method="POST">
                             <div class="form-group">
                                 <label class="accmodallbl" for="exampleDropdownFormEmail1">Email address</label>
                               <input type="email" name="mail" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                             </div>
                             <div class="form-group">
                               <label class="accmodallbl" for="exampleDropdownFormPassword1">Password</label>
                               <input type="password" name="pwd" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                             </div>
                             <button type="submit" class="btn btn-primary">Sign in</button>
                           </form>
                           <div class="dropdown-divider"></div>
                           <button class="dropdown-item logsignup"><a href="register.jsp">New around here? Sign up</a></button>   
                         </div>
                     </c:if>
                 </div>
                 <div class="headercart">
                     <c:if test="${empty email}">
                        <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu emptycartdmenu" aria-labelledby="emptycartd">
                            <p class="cartisempty">Log in to shop</p>  
                        </div>
                     </c:if>
                      <c:if test="${not empty email}">
                          <c:if test="${not empty cart}">
                                <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               </a>
                               <div class="dropdown-menu cartdmenu" aria-labelledby="emptycartd">
                                   <c:set var="total" value="0"></c:set>
                                   <c:set var="totalqty" value="0"></c:set>
                                    <c:forEach var="item" items="${sessionScope.cart}">
                                        <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                                        <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                                        <form class="checkoutcartform" method="GET" action="CustomerCart">
                                            <input name="itemID" type="hidden" value="${item.getProduct().getProductID()}">
                                            <input name="command" type="hidden" value="REMOVEC">
                                            <input name="url" type="hidden" value="index.jsp">
                                            <table class="eachitemtable">
                                                <tr>
                                                    <td>
                                                        ${item.getProduct().getProductName()}
                                                        <button type="submit" class="btn nav-link removeitembtn">X</button>
                                                        <p class="itemqty">Quantity: ${item.getQuantity()}</p>
                                                    </td>
                                                    <td>
                                                        <p class="itemprice">${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>
                                    </c:forEach><br>
                                    <p class="carttotal">Total: ${total}</p>
                                   <form class="checkoutcartform" method="GET" action="CustomerCart">
                                       <input name="total" type="hidden" value="${total}">
                                       <input name="command" type="hidden" value="CHECKOUT">
                                       <button type="submit" class="checkoutcartbtn">Checkout</button>
                                   </form>
                               </div>
                               <label class="cartqty">${totalqty}</label>
                          </c:if>
                          <c:if test="${empty cart}">
                              <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             </a>
                             <div class="dropdown-menu emptycartdmenu" aria-labelledby="emptycartd">
                                 <p>&nbsp;&nbsp;&nbsp;Cart is empty</p>
                                 <button disabled type="submit" class="discheckoutcartbtn">Checkout</button>
                             </div>
                           <label class="cartqty">0</label>
                          </c:if>
                     </c:if>
                 </div>
             </div>
        </nav>
        
        <div class="registermid">
             <div class="registerbg"></div>
             <div class="registerbgcontent">
                <h1 class="pagetitle">Register</h1>
                <h5 class="pageslogan">IT'S AS SIMPLE AS IT CAN GET</h5><br><br>
             </div>
             <div class="registerbgform">
                <form id="registertraineeform" class="registerform" action="Register" method="GET">
                     <br><br>
                    <table class="names">
                        <tr>
                            <td>
                                <label for="exampleInputEmail1">First Name</label>
                                <input type="text" name="fname" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <label for="exampleInputEmail1">Last Name</label>
                                <input type="text" name="lname" class="form-control2 inp2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                        </tr> 
                    </table>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" name="mail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                      <label class="errorlbl">${requestScope.emailmessage}</label>
                    </div>
                    <table>
                        <tr>
                            <td>
                                <label for="exampleInputEmail1">Contact number</label>
                                <input type="text" name="phone" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="+94767682073" maxlength="12" required> 
                            </td>
                            <td>
                                <fieldset class="form-group" name="gender">
                                    <div class="row">
                                        <label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender: </label>
                                      <div class="col-sm-10">
                                        <div class="form-check gendercheck">
                                          <label class="form-check-label" for="gridRadios1">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked required>
                                            Male
                                          </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <label class="form-check-label" for="gridRadios2">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                            Female
                                          </label>
                                        </div>
                                      </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr> 
                    </table>
                    <table>
                        <tr>
                            <td>
                                <label for="exampleInputEmail1">Password</label>
                                <input type="password" name="pwd" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                <label class="errorlbl">${requestScope.pwdmessage}</label>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <label for="exampleInputEmail1">Confirm Password</label>
                                <input type="password" name="cpwd" class="form-control2 inp2" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                <label class="text-muted" value=""></label>
                            </td>
                        </tr> 
                    </table><br>
                    <div id="datebmi" class="datebmi">
                    <table>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="exampleInputEmail1">Date of Birth</label>
                            </td>
                            <td>
                                <input type="date" name="dob" class="form-control3 fc3dob" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                        </tr> 
                    </table><br>
                    <!--<table>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="exampleInputEmail1">Height&nbsp;&nbsp;&nbsp;<label class="text-muted">In cm</label></label>  
                                <input type="text" name="height" class="form-control3" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="exampleInputEmail1">Weight&nbsp;&nbsp;&nbsp;<label class="text-muted">In kg</label></label>  
                                <input type="text" name="weight" class="form-control3 fc3weight" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                        </tr> 
                    </table><br>-->
                    </div>
                    <button type="submit" class="btn registerbtn">Submit</button>
                </form>
             </div>
        </div><br><br><br><br><br>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

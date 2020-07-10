<%-- 
    Document   : Login
    Created on : Mar 22, 2020, 1:10:45 PM
    Author     : Khalid Fazal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIT.com - Contact Us</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a class="navbar-brand" href="index.jsp"><img height="100" src="Assets/Images/fitlogo2.png"></a>
             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
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
                    <li class="nav-item active">
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
                                            <input name="url" type="hidden" value="contact.jsp">
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
                                   <a href="checkout.jsp" class="checkoutcartbtn">Checkout</a>
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
        
        <div class="contactmid">
            <div class="contactbg"></div>
            <div class="contactbgcontent">
                <h1 class="pagetitle contacttitle">Get In Touch With Us</h1>
            </div>
            <div class="contactcontent">
                <table class="contacttable">
                    <tr>
                        <td>
                            <div class="contacts contactsphone">
                                <p class="phonetitle">CALL US</p>
                                <img height="200px" class="contact phone" src="Assets/Images/phone.png">
                                <div class="contactdetail">
                                    <p class="contactdetails phonedetails">+94764448989</p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="contacts contactsemail">
                                <p class="emailtitle">SEND US AN E-MAIL</p>
                                <img height="200px" class="contact email" src="Assets/Images/email.png">
                                <div class="contactdetail">
                                    <p class="contactdetails emaildetails">fitalldotcombusiness@gmail.com</p>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="leavemessage">
                <div class="lm">
                    <p class="messagetitle">LEAVE A MESSAGE<img height="200px" class="messageimg" src="Assets/Images/message2.png"></p>
                </div>
                <div class="lm2">
                    <small class="messageslogan">We'll get back to you as soon as possible.</small>
                </div>
                <div class="lm3">
                     <form class="lmform" action="Contact" method="GET">
                         <table>
                             <tr>
                                 <td>
                                     <p class="messagesent">${requestScope.message}</p>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label class="msglbl">E-mail address</label>
                                 </td>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;
                                     <input type="text" name="email" class="msg msgmail" id="exampleInputEmail1" aria-describedby="emailHelp" required><br>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label class="msglbl">Full Name</label>
                                 </td>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;
                                     <input type="text" name="fullname" class="msg msgname" id="exampleInputEmail1" aria-describedby="emailHelp" required><br>
                                 </td>
                             </tr>
                         </table>
                        
                        <label class="msglbl2">Your Message</label>
                        <textarea name="message" class="form-control msgtxtarea" id="exampleFormControlTextarea1" rows="4" required></textarea><br><br>
                        <button type="submit" class="btn registerbtn">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong><br>Isurupaya, Battaramulla - Pannipitiya Rd, Battaramulla 10120</p>
        </nav>
    </body>
</html>

<%-- 
    Document   : tonedroutine
    Created on : Jun 14, 2020, 1:39:58 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIT.com - toned</title>
        <script src="Styling/jquery.min.js"></script>
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
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
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
                                            <input name="url" type="hidden" value="about.jsp">
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
        
        <div style="background-color: black; padding: 0px 20px 20px 0px;font-family: 'RobotoRG';font-weight: 500;">
            <img src="Assets/Images/toned.jpg">
            <img style="position: absolute; top: 30%; left: 10%;" src="Assets/Images/fm.png"><br>
            <div style="padding: 30px 80px 30px 80px;color: white;">
                <label>By <a style="font-weight: bolder;" href="#">Nicki Minaj</a></label><br><br>
                <p>This sensible-yet-butt-kicking plan will get you in the habit of working out—and you'll love the results so much that at the end of the three weeks, you won't wanna stop. We've come up with a 21-day shape up workout plan that you'll love so much, you won't wanna ditch it. </p>
                <p>Here's how it works. Each week, you'll do six workouts (none of them last more than about half an hour!):</p>
                <ul>
                    <li>Two total-body toning routines</li>
                    <li>Two fat-blasting interval workouts</li>
                    <li>Two easy recovery sessions</li>
                </ul>
                <label class="routinehead">
                    Total-Body Toning Routines – 2x a week
                </label>
                <p>Reps: 12 – 15 per move<br>Sets: 1 set during week 1, 2 sets during weeks 2 and 3</p>
                <label class="routinehead3">
                    Moves:
                </label>
                <ul>
                    <li>Plank with Alternating Leg Lift</li>
                    <li>Wood Chop with Resistance Band</li>
                    <li>Dumbbell Squat and Overhead Press</li>
                    <li>Romanian Deadlift</li>
                    <li>Bent-Over Row</li>
                    <li>Dynamic Lunge</li>
                </ul>
                <label class="routinehead">
                    Fat-Blasting Intervals – 2x a week
                </label>
                <p>Do the following three moves back to back with no rest in between. That's 1 interval. Rest for one to two minutes between intervals. Complete as many reps of each move as you can in the prescribed amount of time.<br><br>Week 1: 20 seconds per move, 5 intervals<br>Week 2: 30 seconds per move, 6 intervals<br>Week 3: 40 seconds per move, 7 intervals</p>
                <label class="routinehead3">
                    Moves:
                </label>
                <ul>
                    <li>Mountain Climber</li>
                    <li>Lateral Shuffle</li>
                    <li>Jump Squat</li>
                </ul>
                <label class="routinehead">
                    Results-Enhancing Recovery – 2x a week
                </label>
                <p>Do the following three moves in the order shown. Repeat two or three times.</p>
                <label class="routinehead3">
                    Moves:
                </label>
                <ul>
                    <li>Hip Flexor Stretch</li>
                    <li>Double Hip Extension</li>
                    <li>Standing Chest Stretch</li>
                    <li>Floor I-Position Raise</li>
                </ul>
            </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

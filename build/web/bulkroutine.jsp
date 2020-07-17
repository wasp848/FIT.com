<%-- 
    Document   : bulkroutine
    Created on : Jun 14, 2020, 1:39:13 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - BULK</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
        <script>
            function openCartNav() {
              document.getElementById("myCartSidenav").style.width = "300px";
            }

            function closeCartNav() {
              document.getElementById("myCartSidenav").style.width = "0";
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark custoomnav">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             <div>
                <table class="navbar-nav mr-auto navnormal">
                    <tr>
                        <td class="nav-item">
                            <a class="nav-link custoomnavitem" href="index.jsp">Home</a>
                        </td>
                        <td class="nav-item active">
                          <a class="nav-link custoomnavitem" href="routines.jsp">Routines</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="CustomerProduct">Shop</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="contact.jsp">Contact Us</a>
                        </td>
                        <c:if test="${not empty email}">
                            <td class="nav-item">
                                <a class="nav-link custoomnavitem" href="profile.jsp">My Profile</a>
                            </td>
                        </c:if>
                    </tr>
                </table>
                 
                 <table class="navacccrt">
                     <tr>
                        <td>
                            <div class="headeraccount">
                               <c:if test="${empty email}">
                                   <a href="login.jsp"><button style="margin-right: 10px;" class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                               </c:if>
                                 <c:if test="${not empty email}">
                                     <c:if test="${not empty cart}">
                                          <c:set var="total" value="0"></c:set>
                                          <c:set var="totalqty" value="0"></c:set>
                                          <c:forEach var="item" items="${sessionScope.cart}">
                                            <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                                            <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                                          </c:forEach>
                                           <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                                             <img class="headerbtn" src="Assets/Images/cart.png" height="35">
                                             <label class="cartqty">${totalqty}</label>
                                          </a>
                                     </c:if>
                                     <c:if test="${empty cart}">
                                         <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                                           <img class="headerbtn" src="Assets/Images/cart.png" height="35">
                                           <label class="cartqty">0</label>
                                        </a>
                                     </c:if>
                                </c:if>
                           </div>
                        </td>
                        
                        <td>
                            <div class="headercart">
                                <c:if test="${empty email}">
                                   <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                                </c:if>
                                <c:if test="${not empty email}">
                                  <a href="Logout"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Logout</button></a>
                               </c:if>
                            </div>
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
                         <td>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                         </td>
                     </tr>
                 </table>
                 <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="routines.jsp">Routines</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="CustomerProduct">Shop</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                    </ul>
                 </div>
            </nav>
        </c:if>
        
        <c:if test="${not empty sessionScope.email}">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mobilenav">
                 <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
                 <table class="navtable">
                     <tr>
                         <td>
                            <c:set var="total" value="0"></c:set>
                            <c:set var="totalqty" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart}">
                              <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                              <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                            </c:forEach>
                            <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                               <img class="headerbtn" src="Assets/Images/cart.png" height="27">
                               <label class="cartqtymobile">${totalqty}</label>
                            </a>
                         </td>
                         <td>
                            <a href="Logout"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Logout</button></a>
                         </td>
                         <td>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                         </td>
                     </tr>
                 </table>
                 <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="routines.jsp">Routines</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="CustomerProduct">Shop</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="profile.jsp">My Profile</a>
                        </li>
                    </ul>
                 </div>
            </nav>
        </c:if>
        
        <div style="background-color: black;font-weight: 500;position: relative;">
            <div id="myCartSidenav" class="sidenav notshopnav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeCartNav()">&times;</a>
                <c:if test="${not empty cart}">
                    <a href="checkout.jsp" class="checkoutcartbtn">Checkout</a>
                    <br><p style="color: white;font-size: 20px;text-align: center;">Your Cart</p>
                    <p class="carttotal">Total: ${total}</p>
                    <div class="cartitems">
                        <c:set var="total" value="0"></c:set>
                        <c:set var="totalqty" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                            <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                            <form class="checkoutcartform" method="GET" action="CustomerCart">
                                <input name="itemID" type="hidden" value="${item.getProduct().getProductID()}">
                                <input name="command" type="hidden" value="REMOVEC">
                                <input name="url" type="hidden" value="bulkroutine.jsp">
                                <table class="eachitemtable">
                                    <tr>
                                        <td>
                                            <p class="itemname">${item.getProduct().getProductName()}</p>
                                            <p class="itemqty">Quantity: ${item.getQuantity()}</p>
                                        </td>
                                        <td>
                                            <button type="submit" class="btn nav-link removeitembtn">X</button>
                                            <p class="itemprice">${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </c:forEach><br>
                    </div>
             </c:if>
             <c:if test="${empty cart}">
                 <br><p style="margin-left: 30px;color: white;">Cart is empty</p>
             </c:if>
            </div>
            
            <div>
                <img style="width: 100%;" src="Assets/Images/bulk.jpg">
            </div>
            <div class="routinedesc">
                <p>Building mass in is second nature to most bodybuilders, who use the lull in competitions and cold weather to maximise their training and pack on size. Before you want to get your larger frame out and on display, you’ll need to hit the gym hard to pack on size. Don’t worry – FIT.com has prepared an easy-to-follow bulk routine that employs lots of compound lifting to help throw on size quickly. However, before you start, you’ll need to keep the following tips in mind.</p>
                <label class="routinehead2">
                    Eat more (healthy) calories
                </label>
                <p>When you’re bulking, eating at a caloric surplus is vital – you can’t grow without food. However, you can’t throw food down your throat with no regard for its nutritional profile. While protein is vital for muscle gain, you also need to keep eating healthy food. Swap refined carbohydrates for wholegrains, fizzy drinks for water and sweets for greens. Bulking season is no excuse to pig out on poor quality food. It’s also a great period to start supplementing your diet with protein drinks to help up your calories and support your work in the gym.</p>
                <label class="routinehead2">
                    Rest more
                </label>
                <p>Rest is so vital to the muscle building process that it can almost make you feel like you’re being lazy. Without enough rest though, your muscles can go into a state of catabolism as a result of the stress hormone, cortisol. Rest helps your muscles repair – so get plenty in.</p>
                <label class="routinehead2">
                    Compounds are king
                </label>
                <p>Despite the isolation split favoured by many gym-goers, the best way to pack on mass is to perform heavy compound lifts. These promote the greatest release of testosterone, as they recruit the most amount of muscle groups. Bicep curls won’t get you huge – but deadlifts, squats and bench can.</p>
                <label class="routinehead">
                    The 4 week program
                </label>
                <p>The following is a sample 4-day-per-week program that can be used throughout the year. Because mass is the goal, we’ll be cycling through a two-week ‘strength routine’ followed by a 2-week ‘volume’ phase to maximise gains.<br><br>During the plan, you should ensure you’re lifting close to failure. What this means is that you should feel fatigued by the last few reps of each set. If it’s easy, it isn’t working.<br><br>The first two weeks of the program see you performing heavier lifts for around 6-8 reps at 70-80% of your 1 rep max. </p>
                <label class="routinehead">
                    First 2 weeks
                </label>
                <p>Fit rest days in where desired. In the second week, up the weight amount anywhere between 1-5kg.</p>
                <label class="routinehead2">
                    Day 1 – Back
                </label>
                <ul>
                    <li>5 x 8 Barbell Shrug</li>
                    <li>5 x 8 Dumbbell Raise</li>
                    <li>3 x 8 Deadlift</li>
                    <li>5 x 8 Bent Over-Rows</li>
                    <li>3 x 6 Pull-Ups</li>
                </ul>
                <label class="routinehead2">
                    Day 2 - Chest
                </label>
                <ul>
                    <li>5 x 6 Bench Press</li>
                    <li>5 x 8 Pec Flys</li>
                    <li>5 x 6 Incline Bench</li>
                    <li>5 x 8 Decline Dumbbell Bench Press</li>
                </ul>
                <label class="routinehead2">
                    Day 3 - Legs
                </label>
                <ul>
                    <li>3 x 8 Barbell Squat</li>
                    <li>5 x 8 Leg Extension</li>
                    <li>5 x 8 Dumbbell Lunges</li>
                    <li>3 x 8 Front Squats</li>
                </ul>
                <label class="routinehead2">
                    Day 4 – Arms and Shoulders
                </label>
                <ul>
                    <li>3 x 8 Military Press</li>
                    <li>5 x 8 EZ Bar Bicep Curls</li>
                    <li>5 x 8 Overhead Tricep Extensions</li>
                    <li>3 x 8 Chin-Ups</li>
                </ul>
                <label class="routinehead">
                    Second 2 Weeks
                </label>
                <p>This phase focuses on volume to induce hypertrophy. Ensure you’re lifting a weight that leaves you fatigued by the end of each set.</p>
                <label class="routinehead2">
                    Day 1 – Back
                </label>
                <ul>
                    <li>5 x 12 Barbell Shrug</li>
                    <li>5 x 12 Dumbbell Raise</li>
                    <li>3 x 10 Deadlift</li>
                    <li>5 x 12 Bent Over-Rows</li>
                    <li>3 x 10 Pull Ups</li>
                </ul>
                <label class="routinehead2">
                    Day 2 - Chest
                </label>
                <ul>
                    <li>3 x 10 Bench Press</li>
                    <li>5 x 12 Pec Flys</li>
                    <li>3 x 10 Incline Bench</li>
                    <li>5 x 12 Decline Dumbbell Bench Press</li>
                </ul>
                <label class="routinehead2">
                    Day 3 - Legs
                </label>
                <ul>
                    <li>3 x 10 Barbell Squat</li>
                    <li>5 x 12 Leg Extension</li>
                    <li>5 x 12 Dumbbell Lunges</li>
                    <li>3 x 12 Front Squats</li>
                    <li>5 x 12 Seated Leg Curls</li>
                </ul>
                <label class="routinehead2">
                    Day 4 – Arms and Shoulders
                </label>
                <ul>
                    <li>3 x 12 Military Press</li>
                    <li>5 x 12 EZ Bar Bicep Curls</li>
                    <li>5 x 12 Overhead Tricep Extensions</li>
                    <li>5 x 12 Dumbbell Shrugs</li>
                    <li>3 x 10 Chin-Ups</li>
                </ul>
                <p>
                    By running this program over the course of a few months, you should start to see great results. Ensure your protein intake is high, as your body can only build muscle in the presence amino acids. Hit the gym hard and you’ll emerge with more mass and a better route into the summer shred.
                </p>
            </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

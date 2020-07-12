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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIT.com - BULK</title>
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
        
        <div style="background-color: black; padding: 0px 20px 20px 20px;font-family: 'RobotoRG';font-weight: 500;">
            <img width="1480" src="Assets/Images/bulk.jpg">
            <img style="position: absolute; top: 40%; left: 60%;" src="Assets/Images/bulk.png"><br>
            <div style="padding: 30px 80px 30px 80px;color: white;">
                <label>By <a style="font-weight: bolder;" href="#">Phil Heath</a></label><br><br>
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
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

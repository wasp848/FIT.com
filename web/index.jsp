<%-- 
    Document   : index
    Created on : Apr 12, 2020, 8:52:30 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - Home</title>
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
                <table class="navbar-nav mr-auto navnormal">
                    <tr>
                        <td class="nav-item active">
                            <a class="nav-link custoomnavitem" href="index.jsp">Home</a>
                        </td>
                        <td class="nav-item">
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
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
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
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
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
        
        <div class="homemid">
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
                                <input name="url" type="hidden" value="index.jsp">
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
            
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                 <div class="carousel-item active">
                     <img class="homecr slide1" src="Assets/Images/slide11.png" alt="First slide">
                     <div class="captn slide1c">
                         <a href="routines.jsp"><p class="slide1cap">VIEW ROUTINES</p></a>
                      </div>
                 </div>
                   <div class="carousel-item">
                      <img class="homecr slide2" src="Assets/Images/slide2.png" alt="Second slide">
                      <div class="captn slide2c">
                          <a href="CustomerProduct"><p class="slide2cap">VISIT OUR STORE</p></a>
                      </div>
                  </div>
            </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
            
            <div id="carouselExampleIndicators3" class="carousel slidemobile" data-ride="carousel">
                <div class="carousel-inner">
                 <div class="carousel-item active">
                     <img class="homecr slide1" src="Assets/Images/slide11.png" alt="First slide">
                     <div class="captn slide1c">
                         <a href="routines.jsp"><p class="slide1cap">VIEW ROUTINES</p></a>
                      </div>
                 </div>
                   <div class="carousel-item">
                      <img class="homecr slide2" src="Assets/Images/slide2.png" alt="Second slide">
                      <div class="captn slide2c">
                          <a href="CustomerProduct"><p class="slide2cap">VISIT OUR STORE</p></a>
                      </div>
                  </div>
            </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div><br><br><br>
            
            <div class="newitems">
                <p class="newinhead">NEW IN</p>
                <div class="homeallitems">
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/prejym.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                       <div class="itemdescr">Pre JYM Pre Workout<br>(Cherry Limeade, 30 servs)</div></a><p>JYM</p>
                                      <p class="newitemprice">LKR 7500</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/mtcreatine.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="itemdescr">Platinum Creatine<br>(80 servs)</div><p>Muscletech</p>
                                      <p class="newitemprice">LKR 4000</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/syntha6.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="itemdescr">Syntha-6 Whey Protein<br>(Chocolate Peanut Butter, 48 servs)</div><p>BSN</p>
                                      <p class="newitemprice">LKR 10000</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/evlbcaa.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="itemdescr">BCAA Energy<br>(Cherry Limeade, 30 servs)</div><p>Evolution Nutrition</p>
                                        <p class="newitemprice">LKR 4500</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/dymatizewp.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="itemdescr">ISO100 Hydrolyzed Whey Protein<br>(Chocolate Coconut, 72 servs)</div><p>Dymatize</p>
                                      <p class="newitemprice">LKR 15500</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                    <table class="newitemstable homeitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct homeproducts">
                                <div class="newitemimgdiv">
                                        <img class="newitemimg" src="Assets/Images/nitrox.jpg" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="itemdescr">Mr. Hyde NitroX<br>(Blue Razz Popsicle, 30 servs)</div><p>Pro Supps</p>
                                      <p class="newitemprice">LKR 6500</p>
                                    </div>
                              </div>
                        </td>
                    </table>
                </div>
                
                <div id="carouselExampleIndicators2" class="carousel newin" data-ride="carousel">
                    <div class="carousel-inner homecarouselinner">
                        <div class="carousel-item homecarouselitem active">
                            <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/prejym.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                               <div class="itemdescr">Pre JYM Pre Workout<br>(Cherry Limeade, 30 servs)</div></a><p>JYM</p>
                                              <p class="newitemprice">LKR 7500</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                        </div>
                        <div class="carousel-item homecarouselitem">
                           <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/mtcreatine.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <div class="itemdescr">Platinum Creatine<br>(80 servs)</div><p>Muscletech</p>
                                              <p class="newitemprice">LKR 4000</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                       </div>
                        <div class="carousel-item homecarouselitem">
                            <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/syntha6.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <div class="itemdescr">Syntha-6 Whey Protein<br>(Chocolate Peanut Butter, 48 servs)</div><p>BSN</p>
                                              <p class="newitemprice">LKR 10000</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                        </div>
                        <div class="carousel-item homecarouselitem">
                            <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/evlbcaa.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <div class="itemdescr">BCAA Energy<br>(Cherry Limeade, 30 servs)</div><p>Evolution Nutrition</p>
                                                <p class="newitemprice">LKR 4500</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                        </div>
                        <div class="carousel-item homecarouselitem">
                            <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/dymatizewp.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <div class="itemdescr">ISO100 Hydrolyzed Whey Protein<br>(Chocolate Coconut, 72 servs)</div><p>Dymatize</p>
                                              <p class="newitemprice">LKR 15500</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                        </div>
                        <div class="carousel-item homecarouselitem">
                            <table class="newitemstable homeitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct homeproducts">
                                        <div class="newitemimgdiv">
                                                <img class="newitemimg" src="Assets/Images/nitrox.jpg" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <div class="itemdescr">Mr. Hyde NitroX<br>(Blue Razz Popsicle, 30 servs)</div><p>Pro Supps</p>
                                              <p class="newitemprice">LKR 6500</p>
                                            </div>
                                      </div>
                                </td>
                            </table>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="gotostorediv">
                    <a class="gotostore" href="CustomerProduct">GO TO STORE</a>
                </div>
            </div>
            
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav pcfn">
                 <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
                 <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
            </nav>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav tabletmobilefn">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>

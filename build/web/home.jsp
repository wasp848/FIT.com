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
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <jsp:declaration>
            java.util.Enumeration parms;
            java.util.Enumeration values;
        </jsp:declaration>

        <jsp:scriptlet>
            parms = request.getParameterNames();
            values = request.getParameterNames();

            while(parms.hasMoreElements()) {
                String name = (String) parms.nextElement();
                String value = (String) values.nextElement();
                session.setAttribute(name, value);
            }
        </jsp:scriptlet>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a class="navbar-brand" href="home.jsp"><img height="100" src="Assets/Images/fitlogo2.png"></a>
             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home</a>
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
                     <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <img src="Assets/Images/account.png" height="40">&nbsp;<label class="headerttxt">Account</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </a>
                     <div class="dropdown-menu reglogdmenu" aria-labelledby="dLabel">
                         <button class="viewprof"><a href="profile.jsp">Go to Profile</a></button>
                        <div class="dropdown-divider"></div>
                          <button class="dropdown-item logsignup"><a href="Logout">Logout</a></button>   
                        </div>
                 </div>
                 <div class="headercart">
                     <img src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;<label class="headerttxt">Cart</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 </div>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
             </div>
        </nav>
        
        <div class="homemid">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
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
                          <a href="shopall.jsp"><p class="slide2cap">VISIT OUR STORE</p></a>
                      </div>
                  </div>
                    <div class="carousel-item">
                          <img class="homecr slide3" src="Assets/Images/slide3.png" alt="Third slide">
                          <p class="slide3ctxt1">MEET THE NEWEST MEMBER OF OUR <p class="slide3ctxt2">FIT</p><p class="slide3ctxt3">TEAM</p>
                          <a href="phil.jsp"><p class="slide3cap">LEARN MORE</p></a>
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
            </div><br><br><br>
            
            <div class="newitems">
                <p class="newinhead">NEW IN</p>
                <table class="newitemstable">
                    <tr>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/prejym.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                   <div class="itemdescr">Pre JYM Pre Workout<br>(Cherry Limeade, 30 servs)</div></a><p>JYM</p>
                                  <p class="newitemprice">LKR 7500</p>
                                </div>
                              </div>
                        </td>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/mtcreatine.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="itemdescr">Platinum Creatine<br>(80 servs)</div><p>Muscletech</p>
                                  <p class="newitemprice">LKR 4000</p>
                                </div>
                              </div>
                        </td>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/syntha6.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="itemdescr">Syntha-6 Whey Protein<br>(Chocolate Peanut Butter, 48 servs)</div><p>BSN</p>
                                  <p class="newitemprice">LKR 10000</p>
                                </div>
                              </div>
                        </td>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/evlbcaa.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="itemdescr">BCAA Energy<br>(Cherry Limeade, 30 servs)</div><p>Evolution Nutrition</p>
                                    <p class="newitemprice">LKR 4500</p>
                                </div>
                              </div>
                        </td>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/dymatizewp.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="itemdescr">ISO100 Hydrolyzed Whey Protein<br>(Chocolate Coconut, 72 servs)</div><p>Dymatize</p>
                                  <p class="newitemprice">LKR 15500</p>
                                </div>
                                </div>
                        </td>
                        <td>
                            <div class="card mb-2 product">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="Assets/Images/nitrox.jpg" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="itemdescr">Mr. Hyde NitroX<br>(Blue Razz Popsicle, 30 servs)</div><p>Pro Supps</p>
                                  <p class="newitemprice">LKR 6500</p>
                                </div>
                              </div>
                        </td>
                    </tr>
                </table>
                <a class="gotostore" href="CustomerProduct">GO TO STORE</a>
            </div><br><br>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img height="75" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong><br>Isurupaya, Battaramulla - Pannipitiya Rd, Battaramulla 10120</p>
        </nav>
    </body>
</html>

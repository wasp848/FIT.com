<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/popper.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png"/>
        <script>
            function checkExAddr()
            {
               document.getElementById("newaddr").disabled = true;
               document.getElementById("newaddr1").disabled = true;
               document.getElementById("newaddr2").disabled = true;
               document.getElementById("newaddr3").disabled = true;
               document.getElementById("exaddr1").disabled = false;
               document.getElementById("exaddr2").disabled = false;
            }
            function checkOtherAddr()
            {
               document.getElementById("newaddr").disabled = false;
               document.getElementById("newaddr1").disabled = false;
               document.getElementById("newaddr2").disabled = false;
               document.getElementById("newaddr3").disabled = false;
               document.getElementById("exaddr1").disabled = true;
               document.getElementById("exaddr2").disabled = true;
            }
            function checkExCrd()
            {
               document.getElementById("newcrd").disabled = true;
               document.getElementById("newcrd1").disabled = true;
               document.getElementById("newcrd2").disabled = true;
               document.getElementById("newcrd3").disabled = true;
               document.getElementById("excrd1").disabled = false;
               document.getElementById("excrd2").disabled = false;
            }
            function checkOtherCrd()
            {
               document.getElementById("newcrd").disabled = false;
               document.getElementById("newcrd1").disabled = false;
               document.getElementById("newcrd2").disabled = false;
               document.getElementById("newcrd3").disabled = false;
               document.getElementById("excrd1").disabled = true;
               document.getElementById("excrd2").disabled = true;
            }
            function checkCOD()
            {
               document.getElementById("newcrd").disabled = true;
               document.getElementById("newcrd1").disabled = true;
               document.getElementById("newcrd2").disabled = true;
               document.getElementById("newcrd3").disabled = true;
               document.getElementById("excrd1").disabled = true;
               document.getElementById("excrd2").disabled = true;
            }
        </script>
    </head>
    <body style="background-color: white;min-height: 1100px;">
        <nav class="navbar navbar-expand-lg">
            <div style="margin-top: 10px;" class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a style="position: absolute;left: 5%;top: 200%;" class="checkoutnavitm" href="CustomerProduct">Continue Shopping</a>
                    </li>
                    <li>
                        <p style="font-weight: bold;color: black;position: absolute;left: 34%;top: 10%;">CASH ON DELIVERY &middot; FREE DELIVERY &middot; 14-DAY FREE EXCHANGE</p>
                        <img style="position: absolute;left: 44%;" height="150" src="Assets/Images/fitlogo2.png">
                    </li>
                </ul>
             </div>
        </nav>
        
        <div style="margin-bottom: 50px !important;" class="checkoutdiv">
            <div class="cartdiv">
                <p class="chckoutorderreview">REVIEW YOUR ORDER</p>
                <c:set var="total" value="0"></c:set>
                <c:forEach var="item" items="${sessionScope.cart}">
                    <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                    <form class="checkoutcartform" method="GET" action="CustomerCart">
                        <input name="itemID" type="hidden" value="${item.getProduct().getProductID()}">
                        <input name="command" type="hidden" value="REMOVEC">
                        <input name="url" type="hidden" value="checkout.jsp">
                        <table class="chckouteachitemtable">
                            <tr>
                                <td>
                                    <img style="padding: 10px;" src="${item.getProduct().getProductImageDir()}" height="110px">
                                </td>
                                <td>
                                    <p class="chckoutitemname">${item.getProduct().getProductName()}</p>
                                    <button type="submit" class="btn nav-link chckoutremoveitembtn">X</button>
                                    <p class="chckoutitembrand">${item.getProduct().getProductBrand()}</p>
                                    <p class="chckoutitemqty">Quantity: ${item.getQuantity()}</p>
                                    <p class="chckoutitemprice">Price: LKR ${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                </td>
                            </tr>
                        </table>
                    </form>
                </c:forEach>
                <div class="chckouttotaldiv">
                    <table>
                        <tr>
                            <td>
                                <p style="color:#55c0a9;font-weight: normal;font-size: 14px;margin-bottom: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Free Shipping</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;Total:&nbsp;&nbsp;LKR ${total}<br><br><br><br><br>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <form method="GET" action="CustomerCart">
                <input name="command" type="hidden" value="CHECKOUT">
                <table>
                <tr>
                    <td>
                        <div class="chckoutaddresspaymentdiv">
                        <table>
                            <tr>
                                <div class="chckoutaddressdiv">
                                    <p class="chckoutorderreview">SHIPPING DETAILS</p>
                                    <input required onclick="checkExAddr()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="address" value="exaddress"> Use existing address<br>
                                    <c:if test = "${sessionScope.addresses.size() != 0}">
                                        <c:set var="index1" value="${0}"></c:set>
                                        <c:forEach items="${sessionScope.addresses}">
                                            <input id="exaddr${index1 + 1}" style="margin-left: 60px;" type="radio" name="addr" value="${sessionScope.addresses[index1]}" required> ${sessionScope.addresses[index1]}<br>
                                            <c:set var="index1" value="${index1 + 1}"></c:set>
                                        </c:forEach><br>
                                            <input required onclick="checkOtherAddr()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="address" value="newaddress"> Use different address
                                            <div id="chckoutnewaddressdiv" class="chckoutnewaddressdiv">
                                                <input style="margin-bottom: 5px;" id="newaddr" class="form-control" name="addresss" type="text" placeholder="Address" required> 
                                                <input style="margin-bottom: 5px;" id="newaddr1" class="form-control" name="city" type="text" placeholder="City" required> 
                                                <input style="margin-bottom: 5px;" id="newaddr2" class="form-control" name="province" type="text" placeholder="Province" required> 
                                                <input style="margin-bottom: 15px;" id="newaddr3" class="form-control" name="postal" type="text" placeholder="Postal Code" required> 
                                            </div>
                                    </c:if>
                                    <c:if test = "${sessionScope.addresses.size() == 0}">
                                        <p style="margin-left: 30px;" class="mutedlbl">You have not saved any addresses</p>
                                        <input required checked onclick="checkOtherAddr()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="address" value="newaddress" required> Use different address
                                        <div id="chckoutnewaddressdiv" class="chckoutnewaddressdiv">
                                            <input style="margin-bottom: 5px;" id="newaddr" class="form-control" name="addresss" type="text" placeholder="Address" required> 
                                            <input style="margin-bottom: 5px;" id="newaddr1" class="form-control" name="city" type="text" placeholder="City" required> 
                                            <input style="margin-bottom: 5px;" id="newaddr2" class="form-control" name="province" type="text" placeholder="Province" required> 
                                            <input style="margin-bottom: 15px;" id="newaddr3" class="form-control" name="postal" type="text" placeholder="Postal Code" required> 
                                        </div>
                                    </c:if>
                                </div>
                            </tr>
                        </table>
                        
                        <table>
                            <tr>
                                <div class="chckoutpaymentdiv">
                                    <p class="chckoutorderreview">PAYMENT DETAILS</p>
                                    <c:if test = "${sessionScope.cards.size() != 0}">
                                        <input required onclick="checkExCrd()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="card" value="existingcard"> Use existing card<br>
                                        <c:set var="index1" value="${0}"></c:set>
                                        <c:forEach items="${sessionScope.cards}">
                                            <input id="excrd${index1 + 1}" style="margin-left: 60px;" type="radio" name="crd" value="${sessionScope.cards[index1].getCardNumber()}" required> ${sessionScope.cards[index1].getCardNumber()}<br>
                                            <c:set var="index1" value="${index1 + 1}"></c:set>
                                        </c:forEach><br>
                                        <input required onclick="checkOtherCrd()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="card" value="newcard"> Use different card
                                        <div id="chckoutnewaddressdiv" class="chckoutnewaddressdiv">
                                            <input style="margin-bottom: 5px;" id="newcrd" class="form-control" name="name" type="text" placeholder="KA Fazal" required> 
                                            <input style="margin-bottom: 5px;" id="newcrd1" class="form-control" name="number" type="text" placeholder="1234123412341234" required> 
                                            <input style="margin-bottom: 5px;" id="newcrd2" class="form-control" name="expiry" type="text" placeholder="10/24" required> 
                                            <input style="margin-bottom: 15px;" id="newcrd3" class="form-control" name="cvv" type="text" placeholder="123" required> 
                                        </div>
                                        <input required onclick="checkCOD()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="card" value="cod"> Cash on Delivery<br>
                                    </c:if>
                                    <c:if test = "${sessionScope.cards.size() == 0}">
                                        <p style="margin-left: 30px;" class="mutedlbl">You have not saved any cards</p>
                                        <input required onclick="checkOtherCrd()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="card" value="newcard"> Use different card
                                        <div id="chckoutnewaddressdiv" class="chckoutnewaddressdiv">
                                            <input style="margin-bottom: 5px;" id="newcrd" class="form-control" name="name" type="text" placeholder="KA Fazal" required> 
                                            <input style="margin-bottom: 5px;" id="newcrd1" class="form-control" name="number" type="text" placeholder="1234123412341234" required> 
                                            <input style="margin-bottom: 5px;" id="newcrd2" class="form-control" name="expiry" type="text" placeholder="10/24" required> 
                                            <input style="margin-bottom: 15px;" id="newcrd3" class="form-control" name="cvv" type="text" placeholder="123" required> 
                                        </div>
                                        <input required onclick="checkCOD()" style="margin-left: 30px;margin-bottom: 15px;" type="radio" name="card" value="cod"> Cash on Delivery<br>
                                    </c:if>
                                </div>
                            </tr>
                        </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input name="total" type="hidden" value="${total}">
                        <button type="submit" class="btn placeorderbtn">PLACE ORDER</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : addproducts
    Created on : May 3, 2020, 1:38:49 AM
    Author     : Khalid Fazal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <div class="modal fade" id="addProductImgModal" tabindex="-1" role="dialog" aria-labelledby="addProductImgModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered addprodimgmodal" role="document">
              <div class="modal-content addproductimgmodalcontent">
                <div class="modal-header">
                  <h5 class="modal-title addproductimgmodaltitle" id="exampleModalLabel">Add Product</h5>
                  <button type="button" class="close reglogclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-footer">
                        <form class="addproductimgform" action="FileUploadHandler" method="POST" enctype="multipart/form-data">
                        <table>
                            <tr>
                                <td>
                                    <input class="addprodimg" type="file" name="productImage" size="50" required/>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-link">Upload File</button>
                                </td>
                            </tr>
                        </table>
                        </form>
                   </div>
              </div>
            </div>
          </div>
                        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark adminheader">
            <a class="navbar-brand" href="admin.jsp"><img class="adminheaderimg" src="Assets/Images/fitlogo2.png"></a>
            <a class="adminlogout adminmngphome" href="adminhome.jsp"><img height="33px" src="Assets/Images/home.png">&nbsp; Home</a>
            <a class="adminlogout adminmngplogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
        </nav>
        
        <div class="mid manageproductsmid">
        <form class="addproductform" action="AdminProduct" method="GET">
            <input type="hidden" name="command" value="ADDP">
            <table>
                <tr>
                    <td>
                        <div class="imageuploadeddiv">
                            <button class="btn addproductimgbtn" data-toggle="modal" data-target="#addProductImgModal">Upload Image</button><br><br>
                            <label class="imageuploadedlbl">${requestScope["message"]}</label>&nbsp;&nbsp;&nbsp;
                            <input type="text" class="imageuploadedinp" name="productImageDir" value="${requestScope["filepath"]}">
                        </div>
                    </td>
                </tr>
                <tr>
                <br><br><br><br><br><br>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">Product Type</label>
                    </td>
                    <td>
                        <select name="productType" class="custom-select my-1 mr-sm-2 slcexp prodtype" id="inlineFormCustomSelectPref" required>
                            <option selected>Choose...</option>
                            <option value="Whey Protein">Whey Protein</option>
                            <option value="Mass Gainer">Mass Gainer</option>
                            <option value="Pre Workout">Pre Workout</option>
                            <option value="Creatine">Creatine</option>
                            <option value="BCAA">BCAA</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">Name</label>
                    </td>
                    <td>
                        <input class="form-control2 fc2addp fc2prodname" name="productName" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">Brand</label>
                    </td>
                    <td>
                        <input class="form-control2 fc2addp fc2prodBrand" name="productBrand" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">Description</label>
                    </td>
                    <td>
                        <input class="form-control2 fc2addp fc2proddesc" name="productDescription" type="text" placeholder="Flavor, Number of Servings" id="exampleInputEmail1" aria-describedby="emailHelp" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">Price</label>
                    </td>
                    <td>
                        <input class="form-control2 fc2addp fc2prodprice" name="productPrice" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="exampleInputEmail1 addproductformlbl">In Stock</label>
                    </td>
                    <td>
                        <input class="form-control2 fc2addp fc2prodstock" name="numInStock" type="number" id="exampleInputEmail1" aria-describedby="emailHelp" min="1"max="50" required/>
                    </td>
                </tr>
            </table><br>
            <button type="submit" class="btn btn-dark addproductformbtn">Add Product</button>
        </form>
        </div>
    </body>
</html>

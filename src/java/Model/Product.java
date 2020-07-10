/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Khalid Fazal
 */
public class Product {
    private int productID;
    private String productImageDir;
    private String productType, productBrand, productName, productDescription;
    private int productPrice;
    private int numInStock;

    public Product(int productID, String productImageDir, String productType, String productBrand, String productName, String productDescription, int productPrice, int numInStock) {
        this.productID = productID;
        this.productImageDir = productImageDir;
        this.productType = productType;
        this.productBrand = productBrand;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.numInStock = numInStock;
    }

    public Product(String productImageDir, String productType, String productBrand, String productName, String productDescription, int productPrice, int numInStock) {
        this.productImageDir = productImageDir;
        this.productType = productType;
        this.productBrand = productBrand;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.numInStock = numInStock;
    }


    public String getProductImageDir() {
        return productImageDir;
    }

    public void setProductImageDir(String productImageDir) {
        this.productImageDir = productImageDir;
    }

    public String getProductBrand() {
        return productBrand;
    }

    /*public Product(String productImageDir, String productType, String productName, String productDesc, int productPrice, int numInStock)
    {
    this.productImageDir = productImageDir;
    this.productType = productType;
    this.productName = productName;
    this.productDesc = productDesc;
    this.productPrice = productPrice;
    this.numInStock = numInStock;
    }
    public Product(String productType, String productName, String productDesc, int productPrice, int numInStock) {
    this.productType = productType;
    this.productName = productName;
    this.productDesc = productDesc;
    this.productPrice = productPrice;
    this.numInStock = numInStock;
    }*/
    public void setProductBrand(String productBrand) {
        this.productBrand = productBrand;
    }

    public int getNumInStock() {
        return numInStock;
    }

    public void setNumInStock(int numInStock) {
        this.numInStock = numInStock;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
}

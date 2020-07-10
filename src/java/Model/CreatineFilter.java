/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Khalid Fazal
 */
public class CreatineFilter implements FilterProducts
{
    @Override
    public ArrayList<Product> filterProducts(ArrayList<Product> products) 
    {
        ArrayList<Product> creatine = new ArrayList<>();
        
        for (Product product : products)
        {
            if (product.getProductType().equals("Creatine"))
            {
                creatine.add(product);
            }
        }
        
        return creatine;
    }
}

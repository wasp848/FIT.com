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
public class PreWorkoutFilter implements FilterProducts
{
    @Override
    public ArrayList<Product> filterProducts(ArrayList<Product> products) 
    {
        ArrayList<Product> pre = new ArrayList<>();
        
        for (Product product : products)
        {
            if (product.getProductType().equals("Pre Workout"))
            {
                pre.add(product);
            }
        }
        
        return pre;
    }
}

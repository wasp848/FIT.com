/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Khalid Fazal
 */
public interface SortStrategy 
{
    public ArrayList <Product> priceSort() throws SQLException;
    public ArrayList <Product> nameSort() throws SQLException;
}

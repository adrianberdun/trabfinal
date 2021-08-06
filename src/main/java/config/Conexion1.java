
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion1 {
    
    public String driver = "com.mysql.jdbc.Driver";
    public Connection getConnection(){  
        Connection conexion = null;
        try{
            Class.forName(driver);
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/codoacodo","root","");     
                                              
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.toString());
        }       
        return conexion;
    }  
}    


    
    
    
    


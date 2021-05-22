
package ConexionOracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
    
    private static Connection cn = null;
    private static String user = "olympobd";
    private static String password = "oracle2";
    private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
    
    public static Connection getConnection(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cn = DriverManager.getConnection(url,user,password);
            cn.setAutoCommit(false);
            if(cn != null){
                System.out.println("Conexion Exitosa");
            }else{
                System.out.println("No se pudo conectar a la Base de Datos");
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "La conexion fallo"+e.getMessage());
        }
        return cn;
    }   
    
}





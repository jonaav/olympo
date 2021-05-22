
package CapaLogica;

import CapaDatos.DatCliente;
import CapaEntidad.EntCliente;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JTable;

public class LogCliente {
    
    private String mensaje = "";
    private DatCliente datCliente = new DatCliente();
    
    public String guardarCliente( EntCliente cliente){
        
        try {
            mensaje = datCliente.guardarCliente( cliente);
        } catch (Exception e) {
            mensaje = mensaje + " " + e.getMessage();
        }
       return mensaje;
   } 
   
   public String modificarCliente( EntCliente cliente){
       
        try {
            mensaje = datCliente.modificarCliente(cliente);
        } catch (Exception e) {
            mensaje = mensaje + " " + e.getMessage();
        }
       return mensaje;
   } 
   
   public String eliminarCliente( String id){
       
        try {
            mensaje = datCliente.eliminarCliente(id);
        } catch (Exception e) {
            mensaje = mensaje + " " + e.getMessage();
        }
       return mensaje;
   } 
   /*********************************************************/
   public void listarCliente(JTable tabla){
       
       
       try {
           datCliente.listarCliente( tabla);
           
       } catch (Exception e) {
           System.out.println(e.getMessage());
       }
   } 
   
   /*
   public String gatMaxID(){
       Connection cn = ConexionOracle.Conexion.getConnection();
       String id = datCliente.getMaxID(cn);
       try {
           cn.close();
       } catch (SQLException e) {
           System.out.println(e.getMessage());
       }
       
       return id;
   }
   */
}

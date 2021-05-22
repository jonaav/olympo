
package CapaDatos;

import ConexionOracle.Conexion;
import java.sql.Connection;
import CapaEntidad.EntCliente;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.xml.transform.Result;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.oracore.OracleType;
import oracle.net.nt.ConnOption;

public class DatCliente {
   
   private String mensaje= ""; 
   
   //GUARDAR
   public String guardarCliente( EntCliente cliente){
       Connection cn = ConexionOracle.Conexion.getConnection();
       
       try {
         CallableStatement cs = cn.prepareCall("call pack_persona.registrar_persona(?,?,?,?,?,?)");
         cs.setString(1,cliente.getDni()+"");
         cs.setString(2,cliente.getNombre());
         cs.setString(3,cliente.getApellidos());
         cs.setString(4,cliente.getCorreo());
         cs.setString(5,cliente.getTelefono());
         cs.setString(6,cliente.getFecha());
         cs.executeUpdate();
         cn.close();
         mensaje = "GUARDADO CORRECTAMENTE ";
       } catch (SQLException e) {
         mensaje = "NO SE PUDO GUARDAR \n"+ e.getMessage();
       }
       return mensaje;
   } 
   
   //ACTUALIZAR
   public String modificarCliente( EntCliente cliente){
       
       Connection cn = ConexionOracle.Conexion.getConnection();
       
       try {
         CallableStatement cs = cn.prepareCall("call pack_persona.actualizar_persona(?,?,?,?,?,?,?)");
         cs.setString(1,cliente.getIdCliente());
         cs.setString(2,cliente.getDni()+"");
         cs.setString(3,cliente.getNombre());
         cs.setString(4,cliente.getApellidos());
         cs.setString(5,cliente.getCorreo());
         cs.setString(6,cliente.getTelefono());
         cs.setString(7,cliente.getFecha());
                  
         cs.executeUpdate();
         cn.close();
         mensaje = "ACTUALIZADO CORRECTAMENTE ";
       } catch (SQLException e) {
         mensaje = "NO SE PUDO MODIFICAR \n"+ e.getMessage();
       }
       return mensaje;
   } 
   
   //ELIMINAR
   public String eliminarCliente( String id){
       
       Connection cn = ConexionOracle.Conexion.getConnection();
       
       try {
         CallableStatement cs = cn.prepareCall("call pack_persona.eliminar_persona(?)");
         cs.setString(1,id);
                  
         cs.executeUpdate();
         cn.close();
         mensaje = "CLIENTE ELIMINADO ";
       } catch (SQLException e) {
         mensaje = "NO SE PUDO MODIFICAR \n"+ e.getMessage();
       }
       return mensaje;
   } 
   
   //MOSTRAR
   public void listarCliente( JTable tabla){
       
       Connection cn = ConexionOracle.Conexion.getConnection();
       DefaultTableModel model;
       String[] columnas = {"ID","DNI","NOMBRES","APELLIDOS","CORREO","TELEFONO","FECHA NACIMIENTO"};
       model = new DefaultTableModel(null, columnas);
       String[] filas = new String[7];
       ResultSet rs = null;
       try {
           CallableStatement cs = cn.prepareCall("call pack_persona.mostrar_persona(?)");
           cs.registerOutParameter(1, OracleTypes.CURSOR);
           cs.executeQuery();
           rs = (ResultSet) cs.getObject(1);
           while(rs.next()){
               for (int i=0; i<7; i++){
                   filas[i] = rs.getString(i+1);
               }
               model.addRow(filas);
           }
           tabla.setModel(model);
           cn.close();
       } catch (Exception e) {
           JOptionPane.showMessageDialog(null, "No se puede mostrar los datos");
       
       }
   } 
    
   
   
}

package com.michaelsalvatierra.models.dao;
import com.michaelsalvatierra.db.*;
import com.michaelsalvatierra.models.domain.Persona;
import com.michaelsalvatierra.models.idao.IPersonaDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import java.sql.SQLException;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 3:10:04 PM
 */
public class PersonaDaoImpl implements IPersonaDAO{
    private static final String SQL_SELECT="SELECT id, nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigo_postal, estado, pais FROM persona;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Persona persona = null;
    private List<Persona> listaPersonas = new ArrayList<>();
    
    @Override
    public List<Persona> getAll() {
       try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              persona = new Persona( 
                      rs.getInt("id"),
                      rs.getString("nombre1"),
                      rs.getString("nombre2"),
                      rs.getString("nombre3"),
                      rs.getString("apellido1"),
                      rs.getString("apellido2"),
                      rs.getString("telefono"),
                      rs.getString("direccion"),
                      rs.getString("ciudad"),
                      rs.getString("codigo_postal"),
                      rs.getString("estado"),
                      rs.getString("pais")
              );
                    System.out.println(persona.toString());
              listaPersonas.add(persona);
          }
       }catch(SQLException e){
           e.printStackTrace(System.out);
       }catch(Exception e){
           e.printStackTrace(System.out);
       }finally{
           Conexion.close(rs);
           Conexion.close(pstmt);
           Conexion.close(con);
       }
       return listaPersonas;
    }

    @Override
    public int add(Persona persona) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public int update(Persona persona) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int delete(Persona persona) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public Persona get(Persona persona) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

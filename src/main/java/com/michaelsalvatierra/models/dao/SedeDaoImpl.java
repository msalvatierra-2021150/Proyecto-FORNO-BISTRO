package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 3/09/2022
 * @time 09:12:22
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.db.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Sede;
import com.michaelsalvatierra.models.idao.ISedeDAO;
import java.sql.SQLException;

public class SedeDaoImpl implements ISedeDAO {
    private static final String SQL_SELECT="SELECT id, nombre_agencia, NIT, direccion, ruta_imagen FROM sede;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Sede sede = null;
    private List<Sede> listaSede = new ArrayList<>();
    
    @Override
    public List<Sede> getAll() {
        try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              sede = new Sede( 
                      rs.getInt("id"),
                      rs.getString("nombre_agencia"),
                      rs.getString("NIT"),
                      rs.getString("direccion"),
                      rs.getString("ruta_imagen")
              );
                    System.out.println(sede.toString());
              listaSede.add(sede);
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
       return listaSede;
    }

    @Override
    public int add(Sede sede) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(Sede sede) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(Sede sede) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}


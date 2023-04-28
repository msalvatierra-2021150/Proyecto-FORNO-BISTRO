package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 18:37:01
 *
 * Código Técnico: IN5BM
 * 
 */

import com.michaelsalvatierra.db.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Bebida;
import com.michaelsalvatierra.models.idao.IBebidaDAO;
import java.sql.SQLException;

public class BebidaDaoImpl implements IBebidaDAO {
    private static final String SQL_SELECT="SELECT id, nombre, descripcion, precio, descuento, ruta_imagen FROM bebida;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Bebida bebida = null;
    private List<Bebida> listaBebida = new ArrayList<>();
    
    @Override
    public List<Bebida> getAll() {
        try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              bebida = new Bebida( 
                      rs.getInt("id"),
                      rs.getString("nombre"),
                      rs.getString("descripcion"),
                      rs.getFloat("precio"),
                      rs.getFloat("descuento"),
                      rs.getString("ruta_imagen")
              );
                    System.out.println(bebida.toString());
              listaBebida.add(bebida);
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
       return listaBebida;
    }

    @Override
    public int add(Bebida bebida) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(Bebida bebida) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(Bebida bebida) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

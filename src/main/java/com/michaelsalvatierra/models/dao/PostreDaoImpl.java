package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 22:24:24
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
import com.michaelsalvatierra.models.domain.Postre;
import com.michaelsalvatierra.models.idao.IPostreDAO;
import java.sql.SQLException;

public class PostreDaoImpl implements IPostreDAO {
    private static final String SQL_SELECT="SELECT id, nombre, descripcion, precio, descuento, ruta_imagen FROM postre;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Postre postre = null;
    private List<Postre> listaPostre = new ArrayList<>();

    @Override
    public List<Postre> getAll() {
        try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              postre = new Postre( 
                      rs.getInt("id"),
                      rs.getString("nombre"),
                      rs.getString("descripcion"),
                      rs.getFloat("precio"),
                      rs.getFloat("descuento"),
                      rs.getString("ruta_imagen")
              );
                    System.out.println(postre.toString());
              listaPostre.add(postre);
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
       return listaPostre;
    }

    @Override
    public int add(Postre postre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(Postre postre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(Postre postre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
     
}

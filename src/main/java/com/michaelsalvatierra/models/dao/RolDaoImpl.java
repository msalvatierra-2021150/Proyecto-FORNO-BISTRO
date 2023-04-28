package com.michaelsalvatierra.models.dao;
import com.michaelsalvatierra.db.*;
import com.michaelsalvatierra.models.idao.IRolDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Rol;
import java.sql.SQLException;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 8:43:24 PM
 */
public class RolDaoImpl implements IRolDAO{
    private static final String SQL_SELECT="SELECT id, nombre FROM rol;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Rol rol = null;
    private List<Rol> listaRol = new ArrayList<>();
    
    @Override
    public List<Rol> getAll() {
       try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              rol = new Rol( 
                      rs.getInt("id"),
                      rs.getString("nombre")
              );
                    System.out.println(rol.toString());
              listaRol.add(rol);
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
       return listaRol;
    }

    @Override
    public int add(Rol rol) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public int update(Rol rol) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int delete(Rol rol) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
}

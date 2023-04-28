/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Rol;
import com.michaelsalvatierra.models.domain.Tarjeta;
import com.michaelsalvatierra.models.idao.ITarjetaDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jose Mauricio Villeda Morales
 * @date 2 sept. 2022
 * @time 23:50:26
 * 
 * Codigo Tecnico: IN5BM
 */
public class TarjetaDaoImpl implements ITarjetaDAO {
 private static final String SQL_SELECT="SELECT numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta FROM tarjeta;";
 private static final String SQL_DELETE = "DELETE FROM tarjeta WHERE id = ?";
 private static final String SQL_SELECT_BY_ID = "SELECT numero_de_tarjeta, nombre_en_tarjeta, fecha_de_vencimiento, tipo_de_tarjeta FROM tarjeta WHERE numero_de_tarjeta = ?";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Tarjeta tarjeta = null;
    private List<Tarjeta> listaTarjeta = new ArrayList<>();
    
    @Override
    public List<Tarjeta> getAll() {
       try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              tarjeta = new Tarjeta( 
                      rs.getString(1),
                      rs.getString(2),
                      rs.getDate(3),
                      rs.getString(4)
              );
                    System.out.println(tarjeta.toString());
              listaTarjeta.add(tarjeta);
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
       return listaTarjeta;
    }
    
    public Tarjeta get(Tarjeta tarjeta) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setString(1, tarjeta.getNumeroDeTarjeta());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                tarjeta = new Tarjeta(
                        rs.getString(1),
                        rs.getString(2), 
                        rs.getDate(3), 
                        rs.getString(4)
                );
            }
            System.out.println("estudiante: " + tarjeta);
        } catch (SQLException e) {
            System.out.println("\nSQLException\n");
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return tarjeta;
    }

    @Override
    public int add(Tarjeta tarjeta) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public int update(Tarjeta tarjeta) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int delete(Tarjeta tarjeta) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setString(1,tarjeta.getNumeroDeTarjeta()); 
            System.err.println(pstmt.toString());
             rows = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace(System.out);
            System.err.println("Se produjo un erro al intentar eliminar el registro con el id "+ tarjeta.getNumeroDeTarjeta());
        }catch(Exception e){
            e.printStackTrace(System.out);
        }
        return rows; 
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Desayunos;
import com.michaelsalvatierra.models.domain.Tarjeta;
import com.michaelsalvatierra.models.idao.IDesayunosDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jose Mauricio Villeda Morales
 * @date 3 sept. 2022
 * @time 0:25:34
 *
 * Codigo Tecnico: IN5BM
 */
public class DesayunosDaoImpl implements IDesayunosDAO {

    private static final String SQL_SELECT = "SELECT combo.id, combo.nombre, po.id, po.nombre, pla.id, pla.nombre, b.id, b.nombre, combo.descripcion, combo.precio, combo.ruta_imagen,combo.tiempo FROM combo \n"
            + "JOIN postre AS po ON combo.postre_id = po.id \n"
            + "JOIN platillo AS pla ON combo.platillo_id= pla.id \n"
            + "JOIN bebida AS b ON combo.bebida_id=b.id AND tiempo=\"DESAYUNO\";";

    private static final String SQL_DELETE = "DELETE FROM combo WHERE id = ?;";
    private static final String SQL_INSERT = "INSERT INTO combo (nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen, tiempo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT id, nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen, tiempo FROM combo WHERE id = ?";
    private static final String SQL_UPDATE = "UPDATE combo SET nombre = ? , postre_id = ?, platillo_id = ?, bebida_id = ?, descripcion = ?, precio = ?, ruta_imagen = ?, tiempo = ? WHERE id = ?";

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Desayunos desayunos = null;
    private List<Desayunos> listaDesayunos = new ArrayList<>();

    @Override
    public List<Desayunos> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                desayunos = new Desayunos(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDouble(10),
                        rs.getString(11),
                        rs.getString(12)
                );
                System.out.println(desayunos.toString());
                listaDesayunos.add(desayunos);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return listaDesayunos;
    }

    @Override
    public int add(Desayunos desayunos) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_INSERT);
            pstmt.setString(1, desayunos.getNombre());
            pstmt.setInt(2, desayunos.getPostreId());
            pstmt.setInt(3, desayunos.getPlatilloId());
            pstmt.setInt(4, desayunos.getBebidaId());
            pstmt.setString(5, desayunos.getDescripcion());
            pstmt.setDouble(6, desayunos.getPrecio());
            pstmt.setString(7, desayunos.getRutaImagen());
            pstmt.setString(8, desayunos.getTiempo());

            System.out.println(pstmt.toString());

            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Se produjo un error al intentar insertar el siguiente registro " + desayunos.toString());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    public Desayunos get(Desayunos desayunos) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, desayunos.getId());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                desayunos = new Desayunos(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
            System.out.println("desayunos: " + desayunos);
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
        return desayunos;
    }

    @Override
    public int update(Desayunos desayunos) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_UPDATE);
            System.out.println(desayunos.toString());
            pstmt.setString(1, desayunos.getNombre());
            pstmt.setInt(2, desayunos.getPostreId());
            pstmt.setInt(3, desayunos.getPlatilloId());
            pstmt.setInt(4, desayunos.getBebidaId());
            pstmt.setString(5, desayunos.getDescripcion());
            pstmt.setDouble(6, desayunos.getPrecio());
            pstmt.setString(7, desayunos.getRutaImagen());
            pstmt.setString(8, desayunos.getTiempo());
            pstmt.setInt(9, desayunos.getId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Se produjo un error al intentar actualizar el siguiente registro: " 
                    + desayunos.toString());
            e.printStackTrace(System.out);
        }catch(Exception e){
            e.printStackTrace(System.out);
        } finally{
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    @Override
    public int delete(Desayunos desayunos) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, desayunos.getId());
            System.err.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            System.err.println("Se produjo un erro al intentar eliminar el registro con el id " + desayunos.getId());
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return rows;
    }

}

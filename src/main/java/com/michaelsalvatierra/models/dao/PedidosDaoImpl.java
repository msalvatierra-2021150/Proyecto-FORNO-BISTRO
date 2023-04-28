/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Pedidos;
import com.michaelsalvatierra.models.idao.IPedidosDAO;
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
 * @time 7:51:36
 *
 * Codigo Tecnico: IN5BM
 */
public class PedidosDaoImpl implements IPedidosDAO {

    private static final String SQL_SELECT = "SELECT id, tarjeta_id,combo_id,usuario_id, sede_id, order_status_id,comentario FROM pedidos ;";
    private static final String SQL_INSERT = "INSERT INTO pedidos (tarjeta_id,combo_id,usuario_id, sede_id, order_status_id,comentario) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SQL_DELETE = "DELETE FROM pedidos WHERE id = ?;";
    private static final String SQL_SELECT_BY_ID = "SELECT id, tarjeta_id,combo_id,usuario_id, sede_id, order_status_id,comentario FROM pedidos WHERE id = ?";
    private static final String SQL_UPDATE = "UPDATE pedidos SET tarjeta_id = ? , combo_id = ?, usuario_id = ?, sede_id = ?, order_status_id = ?, comentario = ? WHERE id = ?";
    
    
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Pedidos pedidos = null;
    private List<Pedidos> listaPedidos = new ArrayList<>();

    @Override
    public List<Pedidos> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                pedidos = new Pedidos(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
                System.out.println(pedidos.toString());
                listaPedidos.add(pedidos);
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
        return listaPedidos;
    }

   @Override
    public int add(Pedidos pedidos) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_INSERT);
            pstmt.setString(1, pedidos.getTarjetaId());
            pstmt.setInt(2, pedidos.getComboId());
            pstmt.setString(3, pedidos.getUsuarioId());
            pstmt.setInt(4, pedidos.getSedeId());
            pstmt.setInt(5, pedidos.getOrderStatusId());
            pstmt.setString(6, pedidos.getComentario());


            System.out.println(pstmt.toString());

            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Se produjo un error al intentar insertar el siguiente registro " + pedidos.toString());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    public Pedidos get(Pedidos pedidos) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, pedidos.getId());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                pedidos = new Pedidos(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
            }
            System.out.println("pedidos: " + pedidos);
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
        return pedidos;
    }

    @Override
    public int update(Pedidos pedidos) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_UPDATE);
            System.out.println(pedidos.toString());
            pstmt.setString(1, pedidos.getTarjetaId());
            pstmt.setInt(2, pedidos.getComboId());
            pstmt.setString(3, pedidos.getUsuarioId());
            pstmt.setInt(4, pedidos.getSedeId());
            pstmt.setInt(5, pedidos.getOrderStatusId());
            pstmt.setString(6, pedidos.getComentario());
            pstmt.setInt(7, pedidos.getId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Se produjo un error al intentar actualizar el siguiente registro: " 
                    + pedidos.toString());
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
    public int delete(Pedidos pedidos) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setInt(1,pedidos.getId()); 
            System.err.println(pstmt.toString());
             rows = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace(System.out);
            System.err.println("Se produjo un erro al intentar eliminar el registro con el id "+ pedidos.getId());
        }catch(Exception e){
            e.printStackTrace(System.out);
        }
        return rows;  
    }
}

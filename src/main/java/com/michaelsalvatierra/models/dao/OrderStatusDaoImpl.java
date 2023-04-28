
package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 20:12:37
 *
 * Código Técnico: IN5BM
 * 
 */
import com.michaelsalvatierra.db.*;
import com.michaelsalvatierra.models.domain.OrderStatus;
import com.michaelsalvatierra.models.idao.IOrderStatusDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import java.sql.SQLException;
public class OrderStatusDaoImpl implements IOrderStatusDAO {
    private static final String SQL_SELECT="SELECT id, status FROM order_status;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private OrderStatus orderStatus = null;
    private List<OrderStatus> listaOrderStatus = new ArrayList<>();

    @Override
    public List<OrderStatus> getAll() {
        try{
          con =  Conexion.getConnection();
          pstmt = con.prepareStatement(SQL_SELECT);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              orderStatus = new OrderStatus( 
                      rs.getInt("id"),
                      rs.getString("status")
              );
                    System.out.println(orderStatus.toString());
              listaOrderStatus.add(orderStatus);
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
       return listaOrderStatus;
    }

    @Override
    public int add(OrderStatus orderStatus) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(OrderStatus orderStatus) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(OrderStatus orderStatus) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

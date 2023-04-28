package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 8/09/2022
 * @time 17:13:54
 *
 * Código Técnico: IN5BM
 * 
 */
import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.OrderStatus;
import com.michaelsalvatierra.models.idao.IOrderStatusDAO;
import java.util.List;

public class OrderStatusDaoJPA implements IOrderStatusDAO{
    
     private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<OrderStatus> getAll() {
         return con.getEntityManager().createNamedQuery("Order.findAll").getResultList();
    }

    @Override
    public int add(OrderStatus orderStatus) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(orderStatus);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + orderStatus.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(OrderStatus orderStatus) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(orderStatus);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
    
    public OrderStatus get(OrderStatus orderStatus) {
        return (OrderStatus) con.getEntityManager().
                createNamedQuery("Order.find").
                setParameter("id", orderStatus.getId()).getSingleResult();
    }
     
    @Override
    public int delete(OrderStatus orderStatus) {
        int rows = 0;
        System.out.println("Order status a eliminar: " + orderStatus.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(orderStatus);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + orderStatus.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
    
}

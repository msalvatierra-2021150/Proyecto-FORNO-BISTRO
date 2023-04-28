package com.michaelsalvatierra.models.idao;

/**
 *
 * @author octav
 */
import com.michaelsalvatierra.models.domain.OrderStatus;
import java.util.List;

public interface IOrderStatusDAO {
    //Listar todos los registros

    public List<OrderStatus> getAll();

    //Insertar un registtro 
    public int add(OrderStatus orderStatus);

    //Actualizar un registro
    public int update(OrderStatus orderStatus);

    //Eliminar un registro
    public int delete(OrderStatus orderStatus);
}

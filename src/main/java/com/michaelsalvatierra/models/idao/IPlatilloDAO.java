
package com.michaelsalvatierra.models.idao;

import com.michaelsalvatierra.models.domain.Platillo;
import java.util.List;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 10:18:20 PM
 */
public interface IPlatilloDAO {
    
    
    public List <Platillo> getAll();
    
    //Insertar un registtro 
    public int add(Platillo platillos); 
    
    //Actualizar un registro
    public int update(Platillo platillos);
    
    //Eliminar un registro
    public int delete(Platillo platillos);
    
}

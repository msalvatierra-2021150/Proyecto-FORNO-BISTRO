package com.michaelsalvatierra.models.idao;

/**
 *
 * @author octav
 */

import com.michaelsalvatierra.models.domain.Postre;
import java.util.List;
public interface IPostreDAO {
    //Listar todos los registros

    public List<Postre> getAll();

    //Insertar un registtro 
    public int add(Postre postre);

    //Actualizar un registro
    public int update(Postre postre);

    //Eliminar un registro
    public int delete(Postre postre);
}

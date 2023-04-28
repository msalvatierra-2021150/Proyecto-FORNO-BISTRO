package com.michaelsalvatierra.models.idao;

/**
 *
 * @author octav
 */
import com.michaelsalvatierra.models.domain.Cena;
import java.util.List;
public interface ICenaDAO {
    //Listar todos los registros

    public List<Cena> getAll();

    //Insertar un registtro 
    public int add(Cena cena);

    //Actualizar un registro
    public int update(Cena cena);

    //Eliminar un registro
    public int delete(Cena cena);
}

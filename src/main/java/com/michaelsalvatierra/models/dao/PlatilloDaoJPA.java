

package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Jose Pablo Fabian Herrera Garcia
 * @date 9/09/2022
 * @time 12:35:58
 */

import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Platillo;
import com.michaelsalvatierra.models.idao.IPlatilloDAO;
import java.util.List;

public class PlatilloDaoJPA implements IPlatilloDAO{
    
private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Platillo> getAll() {
        return con.getEntityManager().createNamedQuery("Platillo.findAll").getResultList();
    }

    @Override
    public int add(Platillo platillo) {
       int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(platillo);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + platillo.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Platillo platillo) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(platillo);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    public Platillo get(Platillo platillo) {
        return (Platillo) con.getEntityManager().
                createNamedQuery("Platillo.find").
                setParameter("id", platillo.getId()).getSingleResult();
    }

    @Override
    public int delete(Platillo platillo) {
        int rows = 0;
        System.out.println("Platillo a eliminar: " + platillo.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(platillo);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + platillo.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

}

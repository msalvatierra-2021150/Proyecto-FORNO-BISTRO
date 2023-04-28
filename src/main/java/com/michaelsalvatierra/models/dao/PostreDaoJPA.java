

package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Jose Pablo Fabian Herrera Garcia
 * @date 9/09/2022
 * @time 14:31:30
 */

import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Postre;
import com.michaelsalvatierra.models.idao.IPostreDAO;
import java.util.List;

public class PostreDaoJPA implements IPostreDAO {

    private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Postre> getAll() {
        return con.getEntityManager().createNamedQuery("Postre.findAll").getResultList();
    }

    @Override
    public int add(Postre postre) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(postre);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + postre.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Postre postre) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(postre);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    public Postre get(Postre postre) {
        return (Postre) con.getEntityManager().
                createNamedQuery("Postre.find").
                setParameter("id", postre.getId()).getSingleResult();
    }

    @Override
    public int delete(Postre postre) {
        int rows = 0;
        System.out.println("Postre a eliminar: " + postre.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(postre);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + postre.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

}

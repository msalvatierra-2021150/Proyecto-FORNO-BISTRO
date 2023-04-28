package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 8/09/2022
 * @time 22:30:32
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Sede;
import com.michaelsalvatierra.models.idao.ISedeDAO;
import java.util.List;

public class SedeDaoJPA implements ISedeDAO {
    
    private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Sede> getAll() {
        return con.getEntityManager().createNamedQuery("Sede.findAll").getResultList();
    }

    @Override
    public int add(Sede sede) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(sede);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + sede.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Sede sede) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(sede);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int delete(Sede sede) {
        int rows = 0;
        System.out.println("Sede a eliminar: " + sede.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(sede);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + sede.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
    
    public Sede get(Sede sede) {
        return (Sede) con.getEntityManager().
                createNamedQuery("Sede.find").
                setParameter("id", sede.getId()).getSingleResult();
    }

}

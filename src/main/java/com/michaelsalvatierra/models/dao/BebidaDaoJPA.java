package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 7/09/2022
 * @time 18:49:24
 *
 * Código Técnico: IN5BM
 *
 */
import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Bebida;
import com.michaelsalvatierra.models.idao.IBebidaDAO;
import java.util.List;

public class BebidaDaoJPA implements IBebidaDAO {

    private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Bebida> getAll() {
        return con.getEntityManager().createNamedQuery("Bebida.findAll").getResultList();
    }

    @Override
    public int add(Bebida bebida) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(bebida);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + bebida.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Bebida bebida) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(bebida);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    public Bebida get(Bebida bebida) {
        return (Bebida) con.getEntityManager().
                createNamedQuery("Bebida.find").
                setParameter("id", bebida.getId()).getSingleResult();
    }

    @Override
    public int delete(Bebida bebida) {
        int rows = 0;
        System.out.println("Bebida a eliminar: " + bebida.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(bebida);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + bebida.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

}

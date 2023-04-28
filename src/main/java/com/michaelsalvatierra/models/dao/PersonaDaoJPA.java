package com.michaelsalvatierra.models.dao;
import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Persona;
import com.michaelsalvatierra.models.idao.IPersonaDAO;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author W10
 * @date Sep 8, 2022
 * @time 4:11:37 PM
 */
public class PersonaDaoJPA implements IPersonaDAO {

    
    private ConexionPU con = ConexionPU.getInstance();
    
    @Override
    public List<Persona> getAll() {
        return con.getEntityManager().createNamedQuery("Persona.findAll").getResultList();
    }

    @Override
    public int add(Persona persona) {
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(persona);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el siguiente registro "+persona.toString());
            e.printStackTrace();
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Persona persona) {
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(persona);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un erroe al intentar insertar el siguiente registro "+persona.toString());
            e.printStackTrace();
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
    
    @Override
    public Persona get(Persona persona){
        return (Persona) con.getEntityManager().createNamedQuery("Persona.find").setParameter("id", persona.getId()).getSingleResult();
    }
    
    @Override
    public int delete(Persona persona) {
        int rows = 0;
        System.out.println("Persona a eliminar = "+persona.getId());
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(persona);
            con.getEntityManager().getTransaction().commit();
            rows= 1;
        }catch(Exception e){
            System.err.println("Se produjo un error al intentar eliminar un registro con el id = "+persona.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

}

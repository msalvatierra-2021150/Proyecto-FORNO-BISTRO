/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 8/09/2022
 * @time 23:56:49
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Rol;
import com.michaelsalvatierra.models.idao.IRolDAO;
import java.util.List;

public class RolDaoJPA implements IRolDAO {

    private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Rol> getAll() {
        return con.getEntityManager().createNamedQuery("Rol.findAll").getResultList();
    }

    @Override
    public int add(Rol rol) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().persist(rol);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el registro: " + rol.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows; 
    }

    @Override
    public int update(Rol rol) {
        int rows = 0;       
        try{
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(rol);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    public Rol get(Rol rol) {
        return (Rol) con.getEntityManager().
                createNamedQuery("Rol.find").
                setParameter("id", rol.getId()).getSingleResult();
    }

    @Override
    public int delete(Rol rol) {
        int rows = 0;
        System.out.println("Rol a eliminar: " + rol.getId());
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(rol);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + rol.getId());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
}

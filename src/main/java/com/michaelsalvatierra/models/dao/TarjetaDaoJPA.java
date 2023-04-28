/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.ConexionPU;
import com.michaelsalvatierra.models.domain.Tarjeta;
import com.michaelsalvatierra.models.idao.ITarjetaDAO;
import java.util.List;

/**
 *
 * @author Jose Mauricio Villeda Morales
 * @date 8 sept. 2022
 * @time 18:53:46
 * 
 * Codigo Tecnico: IN5BM
 */
public class TarjetaDaoJPA implements ITarjetaDAO{
private ConexionPU con = ConexionPU.getInstance();

    @Override
    public List<Tarjeta> getAll() {
        return con.getEntityManager().createNamedQuery("Tarjeta.findAll").getResultList();
    }

    @Override
    public int add(Tarjeta tarjeta) {
        int rows = 0;
        try{
            con.getEntityManager().getTransaction().begin();
            System.out.println("Tarjeta JPA " + tarjeta);
            con.getEntityManager().persist(tarjeta);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        }catch(Exception e){
            System.out.println("Se produjo un error al intentar insertar el siguiente registro: " + tarjeta.toString());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int update(Tarjeta tarjeta) {
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().merge(tarjeta);
            con.getEntityManager().getTransaction().commit();
            rows=1;
        }catch(Exception e){
            e.printStackTrace();
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }


    public Tarjeta get(Tarjeta tarjeta) {
        return (Tarjeta) con.getEntityManager().
                createNamedQuery("Tarjeta.find").
                setParameter("numero_de_tarjeta", tarjeta.getNumeroDeTarjeta()).getSingleResult();
    }

    @Override
    public int delete(Tarjeta tarjeta) {
        int rows = 0;
        try {
            con.getEntityManager().getTransaction().begin();
            con.getEntityManager().remove(tarjeta);
            con.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            System.out.println("Se produjo un error al intentar eliminar un registro con el id: " + tarjeta.getNumeroDeTarjeta());
            e.printStackTrace(System.out);
            con.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }
}

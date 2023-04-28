package com.michaelsalvatierra.models.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 8:41:47 PM
 */

@Entity
@Table(name = "rol")
@NamedQueries({
    @NamedQuery(name = "Rol.findAll", query = "from Rol"),
    @NamedQuery(name = "Rol.find", query = "from Rol WHERE id = :id"
            + "")
})

public class Rol implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    
    @Column
    private String nombre;

    public Rol() {
    }

    public Rol(int id) {
        this.id = id;
    }

    public Rol(String nombre) {
        this.nombre = nombre;
    }
    
    
    
    public Rol(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}

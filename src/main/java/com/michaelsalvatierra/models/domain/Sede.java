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
 * @author Luis Fernando Archila Valdez
 * @date 3/09/2022
 * @time 11:12:33
 *
 * Código Técnico: IN5BM
 */
@Entity
@Table(name = "sede")
@NamedQueries({
    @NamedQuery(name = "Sede.findAll", query = "from Sede"),
    @NamedQuery(name = "Sede.find", query = "from Sede WHERE id = :id"
            + "")
})


public class Sede implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    private int id;
    
    @Column(name = "nombre_agencia")
    private String nombreAgencia;
    
    @Column(name = "NIT")
    private String nit;
    
    @Column
    private String direccion;
    
    @Column(name = "ruta_imagen")
    private String rutaImagen;

    public Sede() {
    }

    public Sede(int id) {
        this.id = id;
    }
    

    public Sede(int id, String nombreAgencia, String nit, String direccion) {
        this.id = id;
        this.nombreAgencia = nombreAgencia;
        this.nit = nit;
        this.direccion = direccion;
    }

    public Sede(String nombreAgencia, String nit, String direccion, String rutaImagen) {
        this.nombreAgencia = nombreAgencia;
        this.nit = nit;
        this.direccion = direccion;
        this.rutaImagen = rutaImagen;
    }
    
    

    public Sede(int id, String nombreAgencia, String nit, String direccion, String rutaImagen) {
        this.id = id;
        this.nombreAgencia = nombreAgencia;
        this.nit = nit;
        this.direccion = direccion;
        this.rutaImagen = rutaImagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreAgencia() {
        return nombreAgencia;
    }

    public void setNombreAgencia(String nombreAgencia) {
        this.nombreAgencia = nombreAgencia;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }

    @Override
    public String toString() {
        return "Sede{" + "id=" + id + ", nombreAgencia=" + nombreAgencia + ", nit=" + nit + ", direccion=" + direccion + ", rutaImagen=" + rutaImagen + '}';
    }
    
    
}

package com.michaelsalvatierra.models.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 18:31:16
 *
 * Código Técnico: IN5BM
 *
 */

@Entity
@Table(name = "bebida")
@NamedQueries({
    @NamedQuery(name = "Bebida.findAll", query = "from Bebida"),
    @NamedQuery(name = "Bebida.find", query = "from Bebida WHERE id = :id"
            + "")
})

public class Bebida implements Serializable{

    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    private int id;
    
    @Column
    private String nombre;
    
    @Column
    private String descripcion;
    
    @Column
    private float precio;
    
    @Column
    private float descuento;
    
    @Column(name = "ruta_imagen")
    private String rutaImagen;

    public Bebida() {
    }
    
    public Bebida(int id, String nombre, String descripcion, float precio, float descuento, String rutaImagen) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.rutaImagen = rutaImagen;
    }
    
    public Bebida(int id, String nombre, float precio, float descuento) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.descuento = descuento;
    }

    public Bebida(int id) {
        this.id = id;
    }

    public Bebida(String nombre, String descripcion, float precio, float descuento, String rutaImagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.rutaImagen = rutaImagen;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }
    
    @Override
    public String toString() {
        return "Bebida{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio + ", descuento=" + descuento + ", rutaImagen=" + rutaImagen + '}';
    }
    
    
}



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
 * @author W10
 * @date Sep 2, 2022
 * @time 10:21:26 PM
 */
@Entity
@Table(name = "platillo")
@NamedQueries({
    @NamedQuery(name = "Platillo.findAll", query = "from Platillo"),
    @NamedQuery(name = "Platillo.find", query = "from Platillo WHERE id = :id"
            + "")
})
public class Platillo implements Serializable {
    
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

    public Platillo() {
    }

    public Platillo(int id, String nombre, String descripcion, float precio, float descuento, String rutaImagen) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.rutaImagen = rutaImagen;
    }

    public Platillo(String nombre, String descripcion, float precio, float descuento, String rutaImagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.rutaImagen = rutaImagen;
    }

    public Platillo(int id) {
        this.id = id;
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
        return "Platillo{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio + ", descuento=" + descuento + ", rutaImagen=" + rutaImagen + '}';
    }

}

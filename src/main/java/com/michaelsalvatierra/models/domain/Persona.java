package com.michaelsalvatierra.models.domain;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 3:04:29 PM
 */
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Id;


 @Entity
 @Table(name = "persona")
 @NamedQueries({
    @NamedQuery(name="Persona.findAll", query = "from Persona"), 
    @NamedQuery(name="Persona.find", query = "from Persona WHERE id= :id")
})
public class Persona implements Serializable {
     
    private static final long serialVersionUID = 1L; 
     
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    
    @Column
    private String nombre1;
    
    @Column
    private String nombre2;
    
    @Column
    private String nombre3;
    
    @Column
    private String apellido1;
    
    @Column
    private String apellido2;
    
    @Column
    private String telefono;
    
    @Column
    private String direccion;
    
    @Column
    private String ciudad;
    
    @Column(name = "codigo_postal")
    private String codigoPostal;
    
    @Column
    private String estado;
    
    @Column
    private String pais;

    public Persona(int id, String nombre1, String nombre2, String nombre3, String apellido1, String apellido2, String telefono, String direccion, String ciudad, String codigPostal, String estado, String pais) {
        this.id = id;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.nombre3 = nombre3;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.telefono = telefono;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.codigoPostal = codigPostal;
        this.estado = estado;
        this.pais = pais;
    }

    public Persona() {
    }

    public Persona(int id) {
        this.id = id;
    }

    
    public Persona(int id, String nombre1, String apellido1, String direccion, String ciudad, String codigPostal, String estado, String pais) {
        this.id = id;
        this.nombre1 = nombre1;
        this.apellido1 = apellido1;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.codigoPostal = codigPostal;
        this.estado = estado;
        this.pais = pais;
    }

    
    public int getId() {
        return id;
    }

    public String getNombre1() {
        return nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public String getNombre3() {
        return nombre3;
    }

    public String getApellido1() {
        return apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public String getEstado() {
        return estado;
    }

    public String getPais() {
        return pais;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public void setNombre3(String nombre3) {
        this.nombre3 = nombre3;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public void setCodigoPostal(String codigPostal) {
        this.codigoPostal = codigPostal;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    @Override
    public String toString() {
        return "Persona{" + "id=" + id + ", nombre1=" + nombre1 + ", nombre2=" + nombre2 + ", nombre3=" + nombre3 + ", apellido1=" + apellido1 + ", apellido2=" + apellido2 + ", telefono=" + telefono + ", direccion=" + direccion + ", ciudad=" + ciudad + ", codigPostal=" + codigoPostal + ", estado=" + estado + ", pais=" + pais + '}';
    }
    
    
}

package com.michaelsalvatierra.models.domain;

import java.io.Serializable;
import java.sql.Date;
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
 * @author Jose Mauricio Villeda Morales
 * @date 2 sept. 2022
 * @time 19:16:28
 *
 * Codigo Tecnico: IN5BM
 */

@Entity
@Table(name = "tarjeta")
@NamedQueries({
    @NamedQuery(name = "Tarjeta.findAll", query = "from Tarjeta"),
    @NamedQuery(name = "Tarjeta.find", query = "from Tarjeta WHERE numero_de_tarjeta = :numero_de_tarjeta")
})
public class Tarjeta implements Serializable{
    
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "numero_de_tarjeta")
    private String numeroDeTarjeta;
    
    @Column(name = "nombre_en_tarjeta")
    private String nombreDeTarjeta;
    @Column(name = "fecha_de_vencimiento")
    private Date fechaVencimiento;
    @Column(name = "tipo_de_tarjeta")
    private String tipoDeTarjeta;

    public Tarjeta() {

    }

    public Tarjeta(String numeroDeTarjeta, String nombreDeTarjeta, Date fechaVencimiento, String tipoDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
        this.nombreDeTarjeta = nombreDeTarjeta;
        this.fechaVencimiento = fechaVencimiento;
        this.tipoDeTarjeta = tipoDeTarjeta;
    }

    public Tarjeta(String numeroDeTarjeta, String nombreDeTarjeta, Date fechaVencimiento) {
        this.numeroDeTarjeta = numeroDeTarjeta;
        this.nombreDeTarjeta = nombreDeTarjeta;
        this.fechaVencimiento = fechaVencimiento;
    }

    public Tarjeta(String numeroDeTarjeta, String nombreDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
        this.nombreDeTarjeta = nombreDeTarjeta;
    }

    public Tarjeta(String numeroDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
    }

    // Getter's Y Setter's
    
    public String getNumeroDeTarjeta() {
        return numeroDeTarjeta;
    }

    public void setNumeroDeTarjeta(String numeroDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
    }

    public String getNombreDeTarjeta() {
        return nombreDeTarjeta;
    }

    public void setNombreDeTarjeta(String nombreDeTarjeta) {
        this.nombreDeTarjeta = nombreDeTarjeta;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getTipoDeTarjeta() {
        return tipoDeTarjeta;
    }

    public void setTipoDeTarjeta(String tipoDeTarjeta) {
        this.tipoDeTarjeta = tipoDeTarjeta;
    }

    @Override
    public String toString() {
        return "Tarjeta{" + "numeroDeTarjeta=" + numeroDeTarjeta + ", nombreDeTarjeta=" + nombreDeTarjeta + ", fechaVencimiento=" + fechaVencimiento + ", tipoDeTarjeta=" + tipoDeTarjeta + '}';
    }
}

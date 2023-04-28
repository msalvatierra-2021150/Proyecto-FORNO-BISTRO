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
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 20:09:54
 *
 * Código Técnico: IN5BM
 *
 */

@Entity
@Table(name = "order_status")
@NamedQueries({
    @NamedQuery(name = "Order.findAll", query = "from OrderStatus"),
    @NamedQuery(name = "Order.find", query = "from OrderStatus WHERE id = :id"
            + "")
})
public class OrderStatus implements Serializable{

    
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    
    private int id;
    
    private String status;

    public OrderStatus() {
    }

    public OrderStatus(int id) {
        this.id = id;
    }
    
    public OrderStatus(String status) {
        this.status = status;
    }

    public OrderStatus(int id, String status) {
        this.id = id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderStatus{" + "id=" + id + ", status=" + status + '}';
    }
    
}

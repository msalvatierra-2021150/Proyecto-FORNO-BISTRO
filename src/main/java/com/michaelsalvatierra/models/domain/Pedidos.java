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
 * @author Jose Mauricio Villeda Morales
 * @date 3 sept. 2022
 * @time 0:46:54
 *
 * Codigo Tecnico: IN5BM
 */
@Entity
 @Table(name = "pedidos")
 @NamedQueries({
    @NamedQuery(name="Pedidos.findAll", query = "from Pedidos"), 
    @NamedQuery(name="Pedidos.find", query = "from Pedidos WHERE id= :id")
})
public class Pedidos implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    
    @Column(name = "tarjeta_id")
    private String TarjetaId;
    
    @Column(name = "combo_id")
    private int comboId;
    
    @Column(name = "usuario_id")
    private String usuarioId;
    
    @Column(name = "sede_id")
    private int sedeId;
    
    @Column(name = "order_status_id")
    private int orderStatusId;
    
    private String comentario;

    public Pedidos(int id, String TarjetaId, int comboId, String usuarioId, int sedeId, int orderStatusId, String comentario) {
        this.id = id;
        this.TarjetaId = TarjetaId;
        this.comboId = comboId;
        this.usuarioId = usuarioId;
        this.sedeId = sedeId;
        this.orderStatusId = orderStatusId;
        this.comentario = comentario;
    }

    public Pedidos() {
    }

    public Pedidos(int id) {
        this.id = id;
    }

    public Pedidos(String TarjetaId, int comboId, String usuarioId, int sedeId, int orderStatusId, String comentario) {
        this.TarjetaId = TarjetaId;
        this.comboId = comboId;
        this.usuarioId = usuarioId;
        this.sedeId = sedeId;
        this.orderStatusId = orderStatusId;
        this.comentario = comentario;
    }



    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTarjetaId() {
        return TarjetaId;
    }

    public void setTarjetaId(String TarjetaId) {
        this.TarjetaId = TarjetaId;
    }

    public int getComboId() {
        return comboId;
    }

    public void setComboId(int comboId) {
        this.comboId = comboId;
    }

    public int getSedeId() {
        return sedeId;
    }

    public void setSedeId(int sedeId) {
        this.sedeId = sedeId;
    }

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    @Override
    public String toString() {
        return "Pedidos{" + "id=" + id + ", TarjetaId=" + TarjetaId + ", comboId=" + comboId + ", sedeId=" + sedeId + ", usuarioId=" + usuarioId + ", orderStatusId=" + orderStatusId + ", comentario=" + comentario + '}';
    }

}

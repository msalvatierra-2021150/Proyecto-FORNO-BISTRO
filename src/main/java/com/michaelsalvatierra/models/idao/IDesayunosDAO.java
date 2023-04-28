/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.michaelsalvatierra.models.idao;

import com.michaelsalvatierra.models.domain.Desayunos;
import java.util.List;

/**
 *
 * @author PC
 */
public interface IDesayunosDAO {
    
    //Listar todos los registros
    public List<Desayunos> getAll();

    //Insertar un registtro 
    public int add(Desayunos desayunos);

    //Actualizar un registro
    public int update(Desayunos desayunos);

    //Eliminar un registro
    public int delete(Desayunos desayunos);
}

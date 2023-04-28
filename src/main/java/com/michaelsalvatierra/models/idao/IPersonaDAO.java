/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.michaelsalvatierra.models.idao;

import com.michaelsalvatierra.models.domain.Persona;
import java.util.List;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 3:19:23 PM
 */
public interface IPersonaDAO {
        //Listar todos los registros
    public List <Persona> getAll();
    
    //Insertar un registtro 
    public int add(Persona persona); 
    
    //Actualizar un registro
    public int update(Persona persona);
    
    //Eliminar un registro
    public int delete(Persona persona);
    
    public Persona get(Persona persona);
}

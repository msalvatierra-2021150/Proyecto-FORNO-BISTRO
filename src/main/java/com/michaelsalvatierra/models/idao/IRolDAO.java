/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.michaelsalvatierra.models.idao;

import com.michaelsalvatierra.models.domain.Rol;
import java.util.List;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 8:38:47 PM
 */
public interface IRolDAO {
            //Listar todos los registros
    public List <Rol> getAll();
    
    //Insertar un registtro 
    public int add(Rol rol); 
    
    //Actualizar un registro
    public int update(Rol rol);
    
    //Eliminar un registro
    public int delete(Rol rol);
    
}

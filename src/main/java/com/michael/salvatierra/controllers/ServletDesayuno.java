/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.michael.salvatierra.controllers;

import com.michaelsalvatierra.models.dao.DesayunosDaoImpl;
import com.michaelsalvatierra.models.domain.Desayunos;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jose Mauricio Villeda Morales
 * @date 3 sept. 2022
 * @time 0:25:57
 *
 * Codigo Tecnico: IN5BM
 */
@WebServlet("/ServletDesayuno")
public class ServletDesayuno extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarDesayuno(request, response);
                    break;
                    
                case "actualizar":
                    actualizarDesayuno(request, response);
                    break;
                    
                default:
                    break;
            }
        }
    }

    private void actualizarDesayuno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int postreId = Integer.parseInt(request.getParameter("postreId"));
        int platilloId = Integer.parseInt(request.getParameter("platilloId"));
        int bebidaId = Integer.parseInt(request.getParameter("bebidaId"));
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        String rutaImagen = request.getParameter("rutaImagen");
        String tiempo = request.getParameter("tiempo");

        System.out.println("Actualizar el usuario con el id: " + id);

        Desayunos desayunos = new Desayunos(id, nombre, postreId,  platilloId,  bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(desayunos.toString());

        int registrosActualizados = new DesayunosDaoImpl().update(desayunos);

        listarDesayunos(request, response);
    }

    private void insertarDesayuno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        int postreId = Integer.parseInt(request.getParameter("postreId"));
        int platilloId = Integer.parseInt(request.getParameter("platilloId"));
        int bebidaId = Integer.parseInt(request.getParameter("bebidaId"));
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String rutaImagen = request.getParameter("rutaImagen");
        String tiempo = request.getParameter("tiempo");
        

        Desayunos desayunos = new Desayunos(nombre, postreId,  platilloId,  bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(desayunos.toString());

        int registrosInsertados = new DesayunosDaoImpl().add(desayunos);

        listarDesayunos(request, response);
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarDesayunos(request, response);
                    break;
                case "editar":
                    editarDesayuno(request, response);
                    break;
                case "eliminar":
                    eliminarDesayuno(request, response);
                    break;
                default:

                    break;
            }
        }
    }

    private void editarDesayuno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idDesayuno = Integer.parseInt(request.getParameter("id"));

        Desayunos desayunos = new DesayunosDaoImpl().get(new Desayunos(idDesayuno));

        System.out.println(desayunos.toString());
        System.out.println(idDesayuno);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("desayunos", desayunos);
        response.sendRedirect(request.getContextPath() + "/" + "desayunos/editar-desayunos.jsp");
    }

    private void listarDesayunos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Desayunos> listaDesayunos = new DesayunosDaoImpl().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaDesayunos);
        response.sendRedirect("desayunos/Desayunos.jsp");
    }

    private void eliminarDesayuno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idDesayunos = Integer.parseInt(request.getParameter("id"));
        Desayunos desayunos = new Desayunos(idDesayunos);
        int registrosEliminados = new DesayunosDaoImpl().delete(desayunos);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + desayunos.toString());
        }

        listarDesayunos(request, response);
    }
}

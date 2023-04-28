/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.michael.salvatierra.controllers;

import com.michaelsalvatierra.models.dao.PedidosDaoImpl;
import com.michaelsalvatierra.models.domain.Pedidos;
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
 * @time 8:02:41
 * 
 * Codigo Tecnico: IN5BM
 */
@WebServlet("/ServletPedidos")
public class ServletPedidos extends HttpServlet {
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarPedido(request, response);
                    break;
                    
                case "actualizar":
                    actualizarPedido(request, response);
                    break;
                    
                default:
                    break;
            }
        }
    }

    private void actualizarPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tarjetaId = request.getParameter("TarjetaId");
        int comboId = Integer.parseInt(request.getParameter("comboId"));
        String usuarioId = request.getParameter("usuarioId");
        int sedeId = Integer.parseInt(request.getParameter("sedeId"));
        int orderStatusId = Integer.parseInt(request.getParameter("orderStatusId"));
        String comentario = request.getParameter("comentario");

        System.out.println("Actualizar el usuario con el id: " + id);

        Pedidos pedidos = new Pedidos(id, tarjetaId, comboId, usuarioId, sedeId, orderStatusId, comentario);
        System.out.println(pedidos.toString());

        int registrosActualizados = new PedidosDaoImpl().update(pedidos);

        listarPedidos(request, response);
    }

    private void insertarPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String tarjetaId = request.getParameter("TarjetaId");
        int comboId = Integer.parseInt(request.getParameter("comboId"));
        String usuarioId = request.getParameter("usuarioId");
        int sedeId = Integer.parseInt(request.getParameter("sedeId"));
        int orderStatusId = Integer.parseInt(request.getParameter("orderStatusId"));
        String comentario = request.getParameter("comentario");

        Pedidos pedidos = new Pedidos(tarjetaId, comboId, usuarioId, sedeId, orderStatusId, comentario);
        System.out.println(pedidos.toString());

        int registrosActualizados = new PedidosDaoImpl().add(pedidos);

        listarPedidos(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String accion = request.getParameter("accion");
        
        if (accion != null){
            switch(accion){
                case "listar":
                    listarPedidos(request, response);
                    break;
                case "editar":
                    editarPedido(request, response);
                    break;
                case "eliminar":
                    eliminarPedido(request, response);
                    break;
                default:
                    
                    
                    break;
            }
        }
    }
    
    private void editarPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPedidos = Integer.parseInt(request.getParameter("id"));

        Pedidos pedidos = new PedidosDaoImpl().get(new Pedidos(idPedidos));

        System.out.println(pedidos.toString());
        System.out.println(idPedidos);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("pedidos", pedidos);
        response.sendRedirect(request.getContextPath() + "/" + "pedidos/editar-pedidos.jsp");
    }
    
    private void listarPedidos(HttpServletRequest request, HttpServletResponse response) throws IOException{
        List<Pedidos> listaPedidos = new PedidosDaoImpl().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaPedidos);
        response.sendRedirect("pedidos/Pedidos.jsp");
    }
    
    private void eliminarPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPedidos = Integer.parseInt(request.getParameter("id"));
        Pedidos pedidos = new Pedidos(idPedidos);
        int registrosEliminados = new PedidosDaoImpl().delete(pedidos);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " +  pedidos.toString());
        }
        
        listarPedidos(request, response);
    }
}

package com.michael.salvatierra.controllers;


import com.michaelsalvatierra.models.dao.TarjetaDaoImpl;
import com.michaelsalvatierra.models.dao.TarjetaDaoJPA;
import com.michaelsalvatierra.models.domain.Tarjeta;
import java.io.IOException;
import java.sql.Date;
import java.lang.Object;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jose Mauricio Villeda Morales
 * @date 2 sept. 2022
 * @time 23:55:21
 *
 * Codigo Tecnico: IN5BM
 */
@WebServlet("/ServletTarjeta")
public class ServletTarjeta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarTarjeta(request, response);
                    break;
                case "actualizar":
                    actualizarTarjeta(request, response);
                    break;
            }
        }
    }


    private void insertarTarjeta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String numeroDeTarjeta = request.getParameter("numero_de_tarjeta");
        String nombreDeTarjeta = request.getParameter("nombre_en_tarjeta");
        
        Date fechaVencimiento = Date.valueOf(request.getParameter("fecha_vencimiento"));
        String tipoDeTarjeta = request.getParameter("tipo_de_tarjeta");
        
        System.out.println("Numero: " + numeroDeTarjeta + "Nombre: "+nombreDeTarjeta + "Fecha: "+fechaVencimiento + "Tipo: " + tipoDeTarjeta);

        Tarjeta tarjeta = new Tarjeta(numeroDeTarjeta, nombreDeTarjeta, fechaVencimiento, tipoDeTarjeta);
        System.out.println("Tarjeta Insertar: "+ tarjeta);
        

        int registrosInsertados = new TarjetaDaoJPA().add(tarjeta);

        listarTarjetas(request, response);
    }
    
     private void actualizarTarjeta(HttpServletRequest request, HttpServletResponse response) throws IOException {
          String numeroDeTarjeta = request.getParameter("numero_de_tarjeta");
        String nombreDeTarjeta = request.getParameter("nombre_en_tarjeta");
        
        Date fechaVencimiento = Date.valueOf(request.getParameter("fecha_vencimiento"));
        String tipoDeTarjeta = request.getParameter("tipo_de_tarjeta");
        
        System.out.println("Numero: " + numeroDeTarjeta + "Nombre: "+nombreDeTarjeta + "Fecha: "+fechaVencimiento + "Tipo: " + tipoDeTarjeta);
        Tarjeta tarjeta = new Tarjeta(numeroDeTarjeta, nombreDeTarjeta, fechaVencimiento, tipoDeTarjeta);
        System.out.println("Tarjeta Insertar: "+ tarjeta);

        //int registrosActualizados = new EstudianteDaoImpl().update(estudiante);
        int registrosActualizados = new TarjetaDaoJPA().update(tarjeta);
        listarTarjetas(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarTarjetas(request, response);
                    break;
                case "editar":
                    editarTarjeta(request, response);
                    break;
                case "eliminar":
                    eliminarTarjeta(request, response);
                    break;
                default:

                    break;
            }
        }
    }

    private void listarTarjetas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Tarjeta> listaTarjetas = new TarjetaDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaTarjetas);
        response.sendRedirect("tarjetas/Tarjetas.jsp");

    }
    
     private void editarTarjeta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //Recuperar ID
        String numeroTarjeta = request.getParameter("numero_de_tarjeta");

        //Crear Objeto de tipo estudiante
        Tarjeta tarjeta = new TarjetaDaoImpl().get(new Tarjeta(numeroTarjeta));

        HttpSession sesion = request.getSession();
        sesion.setAttribute("tarjeta", tarjeta);
        response.sendRedirect(request.getContextPath() + "/" + "tarjetas/editar-tarjetas.jsp");
    }
    

    private void eliminarTarjeta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String numeroDeTarjeta = request.getParameter("numero_de_tarjeta");
        Tarjeta tarjeta = new TarjetaDaoJPA().get(new Tarjeta(numeroDeTarjeta));

        int registrosEliminados = new TarjetaDaoJPA().delete(tarjeta);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar la siguiente tarjeta: " + tarjeta.toString());
        }

        listarTarjetas(request, response);
    }

}

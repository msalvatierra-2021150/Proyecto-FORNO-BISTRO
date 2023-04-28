package com.michael.salvatierra.controllers;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 3/09/2022
 * @time 08:30:06
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.models.domain.Sede;
import com.michaelsalvatierra.models.dao.SedeDaoImpl;
import com.michaelsalvatierra.models.dao.SedeDaoJPA;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletSede")
public class ServletSede extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarSede(request, response);
                    break;
                case "actualizar":
                    actualizarSede(request, response);
            }
        }
    }
    
    private void actualizarSede(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idSede"));
        String nombreAgencia = request.getParameter("nombreAgencia");
        String nit = request.getParameter("nit");
        String direccion = request.getParameter("direccion");
        String rutaImagen = request.getParameter("rutaImagen"); 
        Sede sede = new Sede(id, nombreAgencia, nit, direccion, rutaImagen);
        System.out.println(sede.toString());   
        int registrosActualizados = new SedeDaoJPA().update(sede);    
        listarSedes(request, response);
    }

    private void insertarSede(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombreAgencia = request.getParameter("nombreAgencia");
        String nit = request.getParameter("nit");
        String direccion = request.getParameter("direccion");
        String rutaImagen = request.getParameter("rutaImagen");
        Sede sede = new Sede(nombreAgencia, nit, direccion, rutaImagen);
        System.out.println(sede);        
        int registrosInsertados = new SedeDaoJPA().add(sede);   
        listarSedes(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion != null) {
                switch (accion) {
                    case "listar":
                        listarSedes(request, response);
                        break;
                    case "editar":
                        editarSede(request, response);
                        break;
                    case "eliminar":
                        eliminarSede(request, response);
                        break;
                    default:

                        break;
                }
            }
        } catch (Exception e) {
            System.out.println("\n-------------------------------------------\n");
            System.out.println("\nError doGet\n");
            e.printStackTrace();
        }
    }
    
    private void editarSede(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idSede = Integer.parseInt(request.getParameter("id"));
        Sede sede = new SedeDaoJPA().get(new Sede(idSede));       
        System.out.println(sede.toString());      
        HttpSession sesion = request.getSession();
        sesion.setAttribute("sede", sede);
        response.sendRedirect(request.getContextPath() + "/" + "sedes/editar-sedes.jsp");
    }

    private void eliminarSede(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idSede = Integer.parseInt(request.getParameter("id"));
        Sede sede = new SedeDaoJPA().get(new Sede(idSede));
        int registrosEliminados = new SedeDaoJPA().delete(sede);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar la siguiente sede: " + sede.toString());
        }
        listarSedes(request, response);
    }

    private void listarSedes(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //List<Sede> listaSedes = new SedeDaoImpl().getAll();
        List<Sede> listaSedes = new SedeDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaSedes);
        response.sendRedirect(request.getContextPath() + "/" + "sedes/Sedes.jsp");
    }

}

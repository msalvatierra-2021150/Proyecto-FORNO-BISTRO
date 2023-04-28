package com.michael.salvatierra.controllers;

import com.michaelsalvatierra.models.domain.Rol;
import com.michaelsalvatierra.models.dao.RolDaoImpl;
import com.michaelsalvatierra.models.dao.RolDaoJPA;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 8:53:19 PM
 */
@WebServlet("/ServletRol")
public class ServletRol extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarRoles(request, response);
                    break;
                case "actualizar":
                    actualizarRoles(request, response);
            }
        }
    }
    
    private void actualizarRoles(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idRol"));
        String nombre = request.getParameter("nombre");        
        Rol rol = new Rol(id, nombre);
        System.out.println(rol.toString());
        
        //int registrosActualizados = new EstudianteDaoImpl().update(estudiante);
        int registrosActualizados = new RolDaoJPA().update(rol);
        
        listarRoles(request, response);
    }

    private void insertarRoles(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        Rol rol = new Rol(nombre);
        System.out.println(rol);

        int registrosInsertados = new RolDaoJPA().add(rol);
        
        listarRoles(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion != null) {
                switch (accion) {
                    case "listar":
                        listarRoles(request, response);
                        break;
                    case "editar":
                        editarRoles(request, response);
                        break;
                    case "eliminar":
                        eliminarRoles(request, response);
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
    
     private void editarRoles(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idRol = Integer.parseInt(request.getParameter("id"));
        
        Rol rol = new RolDaoJPA().get(new Rol(idRol));
        
        System.out.println(rol.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("rol", rol);
        response.sendRedirect(request.getContextPath() + "/" + "roles/editar-roles.jsp");
    }

    private void eliminarRoles(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idRol = Integer.parseInt(request.getParameter("id"));
        Rol rol = new RolDaoJPA().get(new Rol(idRol));

        int registrosEliminados = new RolDaoJPA().delete(rol);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente rol: " + rol.toString());
        }

        listarRoles(request, response);
    }

    private void listarRoles(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //List<Rol> listaRol = new RolDaoImpl().getAll();
        
        List<Rol> listaRol = new RolDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaRol);
        response.sendRedirect(request.getContextPath() + "/" + "roles/Roles.jsp");
    }
}

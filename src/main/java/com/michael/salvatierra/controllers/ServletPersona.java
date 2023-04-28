package com.michael.salvatierra.controllers;
import com.michaelsalvatierra.models.domain.Persona;
import com.michaelsalvatierra.models.dao.PersonaDaoImpl;
import com.michaelsalvatierra.models.dao.PersonaDaoJPA;
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
 * @time 3:42:04 PM
 */
@WebServlet("/ServletPersona")
public class ServletPersona extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");  
        if(accion != null){
            switch(accion){
                case "insertar":
                    insertarEstudiante(request, response);
                    break;
                case "actualizar":
                    actualizarEstudiante(request, response);
                    break;
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String accion = request.getParameter("accion");
        
        if (accion != null){
            switch(accion){
                case "listar":
                    listarPersonas(request, response);
                    break;
                case "editar":
                    editarPersona(request, response);
                    break;
                case "eliminar":
                    eliminarPersona(request, response);
                    break;
                default:
                    
                    
                    break;
            }
        }
    }
    
    private void listarPersonas(HttpServletRequest request, HttpServletResponse response) throws IOException{
        //List<Persona> listaPersonas = new PersonaDaoImpl().getAll();
        List<Persona> listaPersonas = new PersonaDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaPersonas);
        response.sendRedirect("personas/Personas.jsp");
    }
    
    private void eliminarPersona(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idPersona = Integer.parseInt(request.getParameter("id"));
        //Estudiante estudiante = new Estudiante(idEstudiante);
        //int registrosEliminados = new EstudianteDaoImpl(). delete(estudiante);
        
        Persona persona = new PersonaDaoJPA().get(new Persona(idPersona));
        int registrosEliminados = new PersonaDaoJPA().delete(persona);
        if(registrosEliminados >= 1){
            System.out.println("Registros eliminados con exito ");
        }
        listarPersonas(request, response);
    }
    
    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String nombre1 = request.getParameter("nombre1");
        String nombre2 = request.getParameter("nombre2");
        String nombre3 = request.getParameter("nombre3");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2"); 
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String codigoPostal = request.getParameter("codigoPostal");
        String estado = request.getParameter("estado");
        String pais = request.getParameter("pais");
        
        Persona persona = new Persona(0, nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigoPostal, estado, pais);
        System.out.println(persona);
        int registrosInsertados = new PersonaDaoJPA().add(persona); 
        listarPersonas(request, response);
    }

    private void editarPersona(HttpServletRequest request, HttpServletResponse response) throws  IOException{
        int idPersona = Integer.parseInt(request.getParameter("id"));
        Persona persona = new PersonaDaoJPA().get(new Persona(idPersona));
        System.out.println(persona.toString());
        HttpSession sesion = request.getSession();
        sesion.setAttribute("persona", persona);
        response.sendRedirect(request.getContextPath() + "/" + "personas/editar-persona.jsp");
    }
    
    private void actualizarEstudiante(HttpServletRequest request, HttpServletResponse response) throws  IOException{
        int id = Integer.parseInt(request.getParameter("id"));        
        String nombre1 = request.getParameter("nombre1");
        String nombre2 = request.getParameter("nombre2");
        String nombre3 = request.getParameter("nombre3");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2"); 
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String codigoPostal = request.getParameter("codigoPostal");
        String estado = request.getParameter("estado");
        String pais = request.getParameter("pais");  
        
        Persona persona = new Persona(id, nombre1, nombre2, nombre3, apellido1, apellido2, telefono, direccion, ciudad, codigoPostal, estado, pais);
        System.out.println(persona);
        //int registrosActualizados = new EstudianteDaoImpl().update(estudiante);
        int registrosInsertados = new PersonaDaoJPA().update(persona); 
        listarPersonas(request, response);
    }
}

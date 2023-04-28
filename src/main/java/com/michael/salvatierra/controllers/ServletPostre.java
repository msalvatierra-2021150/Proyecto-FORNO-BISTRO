package com.michael.salvatierra.controllers;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 22:28:54
 *
 * Código Técnico: IN5BM
 *
 */
import com.michaelsalvatierra.models.domain.Postre;
import com.michaelsalvatierra.models.dao.PostreDaoImpl;
import com.michaelsalvatierra.models.dao.PostreDaoJPA;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletPostre")

public class ServletPostre extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
           request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarPostre(request, response);
                    break;
                case "actualizar":
                    actualizarPostre(request, response);
            }
        }
    }
     
    
    private void actualizarPostre(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idPostre"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");
        
        Postre postre = new Postre(id, nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(postre.toString());
        
        
        int registrosActualizados = new PostreDaoJPA().update(postre);
        
        listarPostres(request, response);
    }

    private void insertarPostre(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");

        Postre postre = new Postre(nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(postre);

        
        int registrosInsertados = new PostreDaoJPA().add(postre);
        
        listarPostres(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion != null) {
                switch (accion) {
                    case "listar":
                        listarPostres(request, response);
                        break;
                    case "editar":
                        editarPostre(request, response);
                        break;
                    case "eliminar":
                        eliminarPostre(request, response);
                        break;
                    default:
                        editarPostre(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            System.out.println("\n-------------------------------------------\n");
            System.out.println("\nError doGet\n");
            e.printStackTrace();
        }
    }
    
     private void editarPostre(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idPostre = Integer.parseInt(request.getParameter("id"));
        
        Postre postre = new PostreDaoJPA().get(new Postre(idPostre));
        
        System.out.println(postre.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("postre", postre);
        response.sendRedirect(request.getContextPath() + "/" + "postres/editar-postres.jsp");
    }

    private void eliminarPostre(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPostre = Integer.parseInt(request.getParameter("id"));
        Postre postre = new PostreDaoJPA().get(new Postre(idPostre));

        int registrosEliminados = new PostreDaoJPA().delete(postre);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + postre.toString());
        }

        listarPostres(request, response);
    }

    private void listarPostres(HttpServletRequest request, HttpServletResponse response) throws IOException {
        

        List<Postre> listaPostres = new PostreDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("arraylistPostre", listaPostres);
        response.sendRedirect(request.getContextPath() + "/" + "postres/Postres.jsp");
    }

}

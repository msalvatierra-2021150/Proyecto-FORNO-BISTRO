package com.michael.salvatierra.controllers;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 19:48:29
 *
 * Código Técnico: IN5BM
 *
 */
import com.michaelsalvatierra.models.domain.Cena;
import com.michaelsalvatierra.models.dao.CenaDaoImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletCena")
public class ServletCena extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarCena(request, response);
                    break;

                case "actualizar":
                    actualizarCena(request, response);
                    break;

                default:
                    break;
            }
        }
    }
    
    private void actualizarCena(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

        Cena desayunos = new Cena(id, nombre, postreId,  platilloId,  bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(desayunos.toString());

        int registrosActualizados = new CenaDaoImpl().update(desayunos);

        listarCenas(request, response);
    }

    private void insertarCena(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        int postreId = Integer.parseInt(request.getParameter("postreId"));
        int platilloId = Integer.parseInt(request.getParameter("platilloId"));
        int bebidaId = Integer.parseInt(request.getParameter("bebidaId"));
        String descripcion = request.getParameter("descripcion");
        Float precio = Float.parseFloat(request.getParameter("precio"));
        String rutaImagen = request.getParameter("rutaImagen");
        String tiempo = request.getParameter("tiempo");
        

        Cena cena = new Cena(nombre, postreId,  platilloId,  bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(cena.toString());

        int registrosInsertados = new CenaDaoImpl().add(cena);

        listarCenas(request, response);
    }
     
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarCenas(request, response);
                    break;
                case "editar":
                    editarCena(request, response);
                    break;
                case "eliminar":
                    eliminarCena(request, response);
                    break;
                default:

                    break;
            }
        }
    }
    
     private void editarCena(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idCena = Integer.parseInt(request.getParameter("id"));
        
        Cena cena = new CenaDaoImpl().get(new Cena(idCena));
        
        System.out.println(cena.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("cena", cena);
        response.sendRedirect(request.getContextPath() + "/" + "cenas/editar-cenas.jsp");
    }

    private void listarCenas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Cena> listarCenas = new CenaDaoImpl().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listarCenas);
        response.sendRedirect("cenas/Cenas.jsp");
    }

    private void eliminarCena(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idCena = Integer.parseInt(request.getParameter("id"));
        Cena cena = new Cena(idCena);
        int registrosEliminados = new CenaDaoImpl().delete(cena);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + cena.toString());
        }

        listarCenas(request, response);
    }

}

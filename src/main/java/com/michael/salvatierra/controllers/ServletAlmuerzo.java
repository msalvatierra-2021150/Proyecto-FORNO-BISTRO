package com.michael.salvatierra.controllers;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 3/09/2022
 * @time 08:15:53
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.models.domain.Almuerzo;
import com.michaelsalvatierra.models.dao.AlmuerzoDaoImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletAlmuerzo")
public class ServletAlmuerzo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarAlmuerzo(request, response);
                    break;
                case "actualizar":
                    actualizarAlmuerzo(request, response);
            }
        }
    }

    private void actualizarAlmuerzo(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

        Almuerzo almuerzo = new Almuerzo(id, nombre, postreId, platilloId, bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(almuerzo.toString());

        int registrosActualizados = new AlmuerzoDaoImpl().update(almuerzo);

        listarAlmuerzos(request, response);
    }

    private void insertarAlmuerzo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        int postreId = Integer.parseInt(request.getParameter("postreId"));
        int platilloId = Integer.parseInt(request.getParameter("platilloId"));
        int bebidaId = Integer.parseInt(request.getParameter("bebidaId"));
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        String rutaImagen = request.getParameter("rutaImagen");
        String tiempo = request.getParameter("tiempo");

        Almuerzo almuerzo = new Almuerzo(nombre, postreId, platilloId, bebidaId, descripcion, precio, rutaImagen, tiempo);
        System.out.println(almuerzo.toString());

        int registrosInsertados = new AlmuerzoDaoImpl().add(almuerzo);

        listarAlmuerzos(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarAlmuerzos(request, response);
                    break;
                case "editar":
                    editarAlmuerzos(request, response);
                    break;
                case "eliminar":
                    eliminarAlmuerzos(request, response);
                    break;
                default:

                    break;
            }
        }
    }
    
    private void editarAlmuerzos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idAlmuerzo = Integer.parseInt(request.getParameter("id"));

        Almuerzo almuerzo = new AlmuerzoDaoImpl().get(new Almuerzo(idAlmuerzo));

        System.out.println(almuerzo.toString());
        System.out.println(idAlmuerzo);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("almuerzo", almuerzo);
        response.sendRedirect(request.getContextPath() + "/" + "almuerzos/editar-almuerzos.jsp");
    }

    private void listarAlmuerzos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Almuerzo> listarAlmuerzos = new AlmuerzoDaoImpl().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listarAlmuerzos);
        response.sendRedirect("almuerzos/Almuerzos.jsp");
    }

    private void eliminarAlmuerzos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idAlmuerzo = Integer.parseInt(request.getParameter("id"));
        Almuerzo almuerzo = new Almuerzo(idAlmuerzo);
        int registrosEliminados = new AlmuerzoDaoImpl().delete(almuerzo);
        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + almuerzo.toString());
        }

        listarAlmuerzos(request, response);
    }

}

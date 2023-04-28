package com.michael.salvatierra.controllers;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 18:47:52
 *
 * Código Técnico: IN5BM
 *
 */
import com.michaelsalvatierra.models.domain.Bebida;
import com.michaelsalvatierra.models.dao.BebidaDaoImpl;
import com.michaelsalvatierra.models.dao.BebidaDaoJPA;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletBebida")
public class ServletBebida extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarBebida(request, response);
                    break;
                case "actualizar":
                    actualizarBebida(request, response);
            }
        }
    }
    
    private void actualizarBebida(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idBebida"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");
        
        Bebida bebida = new Bebida(id, nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(bebida.toString());
        
        
        int registrosActualizados = new BebidaDaoJPA().update(bebida);
        
        listarBebidas(request, response);
    }

    private void insertarBebida(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");

        Bebida bebida = new Bebida(nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(bebida);

        
        int registrosInsertados = new BebidaDaoJPA().add(bebida);
        
        listarBebidas(request, response);
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion != null) {
                switch (accion) {
                    case "listar":
                        listarBebidas(request, response);
                        break;
                    case "editar":
                        editarBebida(request, response);
                        break;
                    case "eliminar":
                        eliminarBebida(request, response);
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
    
    private void editarBebida(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idBebida = Integer.parseInt(request.getParameter("id"));
        
        Bebida bebida = new BebidaDaoJPA().get(new Bebida(idBebida));
        
        System.out.println(bebida.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("bebida", bebida);
        response.sendRedirect(request.getContextPath() + "/" + "bebidas/editar-bebidas.jsp");
    }

    private void eliminarBebida(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idBebida = Integer.parseInt(request.getParameter("id"));
        Bebida bebida = new BebidaDaoJPA().get(new Bebida(idBebida));

        int registrosEliminados = new BebidaDaoJPA().delete(bebida);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + bebida.toString());
        }

        listarBebidas(request, response);
    }

    private void listarBebidas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //List<Bebida> listaBebidas = new BebidaDaoImpl().getAll();

        List<Bebida> listaBebidas = new BebidaDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("arraylistBebida", listaBebidas);
        response.sendRedirect(request.getContextPath() + "/" + "bebidas/Bebidas.jsp");
    }

}

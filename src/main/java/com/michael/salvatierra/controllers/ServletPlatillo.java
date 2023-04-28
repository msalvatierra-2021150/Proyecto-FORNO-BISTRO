package com.michael.salvatierra.controllers;
import com.michaelsalvatierra.models.domain.Platillo;
import com.michaelsalvatierra.models.dao.PlatilloDaoImpl;
import com.michaelsalvatierra.models.dao.PlatilloDaoJPA;
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
 * @time 10:41:09 PM
 */
@WebServlet("/ServletPlatillo")
public class ServletPlatillo extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
           request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarPlatillo(request, response);
                    break;
                case "actualizar":
                    actualizarPlatillo(request, response);
            }
        }
    }
    
    private void actualizarPlatillo(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idPlatillo"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");
        
        Platillo platillo = new Platillo(id, nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(platillo.toString());
        
        
        int registrosActualizados = new PlatilloDaoJPA().update(platillo);
        
        listarPlatillo(request, response);
    }

    private void insertarPlatillo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));
        String rutaImagen = request.getParameter("rutaImagen");

        Platillo platillo = new Platillo(nombre, descripcion, precio, descuento, rutaImagen);
        System.out.println(platillo);

        
        int registrosInsertados = new PlatilloDaoJPA().add(platillo);
        
        listarPlatillo(request, response);
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion != null) {
                switch (accion) {
                    case "listar":
                        listarPlatillo(request, response);
                        break;
                    case "editar":
                        editarPlatillo(request, response);
                        break;
                    case "eliminar":
                        eliminarPlatillo(request, response);
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
     private void editarPlatillo(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idPlatillo = Integer.parseInt(request.getParameter("id"));
        
        Platillo platillo = new PlatilloDaoJPA().get(new Platillo(idPlatillo));
        
        System.out.println(platillo.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("platillo", platillo);
        response.sendRedirect(request.getContextPath() + "/" + "platillos/editar-platillos.jsp");
    }
    private void eliminarPlatillo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPlatillo = Integer.parseInt(request.getParameter("id"));
        Platillo platillo = new PlatilloDaoJPA().get(new Platillo(idPlatillo));

        int registrosEliminados = new PlatilloDaoJPA().delete(platillo);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + platillo.toString());
        }

        listarPlatillo(request, response);
    }

    private void listarPlatillo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //List<Bebida> listaBebidas = new BebidaDaoImpl().getAll();

        List<Platillo> listaPlatillos = new PlatilloDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("arraylistPlatillo", listaPlatillos);
        response.sendRedirect(request.getContextPath() + "/" + "platillos/Platillos.jsp");
    }

}

package com.michael.salvatierra.controllers;

/**
 *
 * @author Octavio Alejandro Corzo Reyes
 * @date 2/09/2022
 * @time 20:18:15
 *
 * Código Técnico: IN5BM
 *
 */
import com.michaelsalvatierra.models.domain.OrderStatus;
import com.michaelsalvatierra.models.dao.OrderStatusDaoImpl;
import com.michaelsalvatierra.models.dao.OrderStatusDaoJPA;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ServletOrderStatus")
public class ServletOrderStatus extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarOderStatus(request, response);
                    break;
                case "actualizar":
                    actualizarOrderStatus(request, response);
            }
        }
    }
    
    private void actualizarOrderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("idOrderStatus"));
        String status = request.getParameter("status");        
        OrderStatus orderStatus = new OrderStatus(id, status);
        System.out.println(orderStatus.toString());
        
        //int registrosActualizados = new EstudianteDaoImpl().update(estudiante);
        int registrosActualizados = new OrderStatusDaoJPA().update(orderStatus);
        
        listarOrderStatus(request, response);
    }

    private void insertarOderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String status = request.getParameter("status");
        OrderStatus orderStatus = new OrderStatus(status);
        System.out.println(orderStatus);

        int registrosInsertados = new OrderStatusDaoJPA().add(orderStatus);
        
        listarOrderStatus(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarOrderStatus(request, response);
                    break;
                case "editar":
                    editarOrderStatus(request, response);
                    break;
                case "eliminar":
                    eliminarOderStatus(request, response);
                    break;
                default:

                    break;
            }
        }
    }
    
     private void editarOrderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int idOrderStatus = Integer.parseInt(request.getParameter("id"));
        
        OrderStatus orderStatus = new OrderStatusDaoJPA().get(new OrderStatus(idOrderStatus));
        
        System.out.println(orderStatus.toString());
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("orderStatus", orderStatus);
        response.sendRedirect(request.getContextPath() + "/" + "orderStatus/editar-orderStatus.jsp");
    }
    
    
    private void eliminarOderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idOrderStatus = Integer.parseInt(request.getParameter("id"));
        OrderStatus orderStatus = new OrderStatusDaoJPA().get(new OrderStatus(idOrderStatus));

        int registrosEliminados = new OrderStatusDaoJPA().delete(orderStatus);

        if (registrosEliminados >= 1) {
            System.out.println("El registro fue eliminado con exito");
        } else {
            System.err.println("Se produjo un error al intentar eliminar el siguiente estudiante: " + orderStatus.toString());
        }

        listarOrderStatus(request, response);
    }
    
    private void listarOrderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException{
        //List<Bebida> listaBebidas = new BebidaDaoImpl().getAll();

        List<OrderStatus> listaOrderStatus = new OrderStatusDaoJPA().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaOrderStatus);
        response.sendRedirect(request.getContextPath() + "/" + "orderStatus/OrderStatus.jsp");
    }
}

package com.michael.salvatierra.controllers;

import com.michaelsalvatierra.models.domain.Usuario;
import com.michaelsalvatierra.models.dao.UsuarioDaoImpl;
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
 * @time 7:15:07 PM
 */
@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarUsuario(request, response);
                    break;
                case "actualizar":
                    actualizarUsuario(request, response);
            }
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        int rolId= Integer.parseInt(request.getParameter("rolId"));
        int personaId = Integer.parseInt(request.getParameter("personaId"));
        
        System.out.println("Actualizar el usuario con el correo:" + password);
        
        Usuario usuario = new Usuario(correo, password, rolId, personaId);
        System.out.println(usuario.toString());

        int registrosActualizados = new UsuarioDaoImpl().update(usuario);

        listarUsuario(request, response);
    }

    private void insertarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        int rol = Integer.parseInt(request.getParameter("rolId"));
        int personaId = Integer.parseInt(request.getParameter("personaId"));

        Usuario usuario = new Usuario(correo, password, rol, personaId);
        System.out.println(usuario);
        
        int registrosInsertados = new UsuarioDaoImpl().add(usuario);
        
        listarUsuario(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarUsuario(request, response);
                    break;
                case "editar":
                    editarUsuario(request, response);
                    break;
                case "eliminar":
                    eliminarUsuario(request, response);
                    break;
                default:

                    break;
            }
        }
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String correoUsuario = request.getParameter("correo");
        
        Usuario usuario = new UsuarioDaoImpl().get(new Usuario(correoUsuario));
        
        System.out.println(usuario.toString());
        System.out.println(correoUsuario);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", usuario);
        response.sendRedirect(request.getContextPath() + "/" + "usuarios/editar-usuario.jsp");
    }
    
    
    private void listarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Usuario> listaUsuario = new UsuarioDaoImpl().getAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("data", listaUsuario);
        response.sendRedirect("usuarios/Usuarios.jsp");
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String correoUsuario = request.getParameter("correo");
        Usuario usuario = new Usuario(correoUsuario);
        int registrosEliminados = new UsuarioDaoImpl().delete(usuario);
        if (registrosEliminados >= 1) {
            System.out.println("Registros eliminados con exito ");
        }
        listarUsuario(request, response);
    }
}

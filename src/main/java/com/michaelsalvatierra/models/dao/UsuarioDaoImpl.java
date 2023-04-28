package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.*;
import com.michaelsalvatierra.models.domain.Usuario;
import com.michaelsalvatierra.models.idao.IUsuarioDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import java.sql.SQLException;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 7:15:44 PM
 */
public class UsuarioDaoImpl implements IUsuarioDAO {

    private static final String SQL_SELECT = "/*SELECT PARA VER Usuario*/\n"
            + "SELECT us.correo, us.password, us.rol_id, r.nombre AS rol, us.persona_id, CONCAT(p.nombre1,\" \", p.apellido1) AS nombrePersona\n"
            + "FROM usuario AS us \n"
            + "JOIN rol AS r ON us.rol_id=r.id\n"
            + "JOIN persona AS p ON us.persona_id= p.id;";
    private static final String SQL_DELETE = "DELETE FROM usuario WHERE correo = ?";
     private static final String SQL_INSERT = "INSERT INTO usuario (correo, password, rol_id, persona_id) VALUES (?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT correo, password, rol_id, persona_id FROM usuario WHERE correo = ?";
    private static final String SQL_UPDATE = "UPDATE usuario SET password=?, rol_id=?, persona_id=? WHERE correo = ?";
    
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Usuario usuario = null;
    private List<Usuario> listaUsuarios = new ArrayList<>();

    @Override
    public List<Usuario> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                usuario = new Usuario(
                        rs.getString("correo"),
                        rs.getString("password"),
                        rs.getInt("rol_id"),
                        rs.getString("rol"),
                        rs.getInt("persona_id"),
                        rs.getString("nombrePersona")
                );
                System.out.println(usuario.toString());
                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return listaUsuarios;
    }

    @Override
    public int add(Usuario usuario) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_INSERT);
            pstmt.setString(1, usuario.getCorreo());
            pstmt.setString(2, usuario.getPassword());
            pstmt.setInt(3, usuario.getRol_id());
            pstmt.setInt(4, usuario.getPersona_id());       
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Se produjo un error al intentar insertar el siguiente registro: " + usuario.toString());
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    public Usuario get(Usuario usuario) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setString(1, usuario.getCorreo());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                usuario = new Usuario(rs.getString("correo"), rs.getString("password"), rs.getInt("rol_id"), rs.getInt("persona_id"));
            }
            System.out.println("estudiante: " + usuario);
        } catch (SQLException e) {
            System.out.println("\nSQLException\n");
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return usuario;
    }

    @Override
    public int update(Usuario usuario) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_UPDATE);
            System.out.println(usuario.toString());
            pstmt.setString(1, usuario.getPassword());
            pstmt.setInt(2, usuario.getRol_id());
            pstmt.setInt(3, usuario.getPersona_id());
            pstmt.setString(4, usuario.getCorreo());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Se produjo un error al intentar actualizar el siguiente registro: " 
                    + usuario.toString());
            e.printStackTrace(System.out);
        }catch(Exception e){
            e.printStackTrace(System.out);
        } finally{
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    @Override
    public int delete(Usuario usuario) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setString(1, usuario.getCorreo());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Se produjo un error al intentar eliminar un registro con el id = " + usuario.getCorreo());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return rows;
    }
}

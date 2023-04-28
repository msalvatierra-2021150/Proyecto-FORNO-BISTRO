package com.michaelsalvatierra.models.dao;

/**
 *
 * @author Luis Fernando Archila Valdez
 * @date 3/09/2022
 * @time 09:09:42
 *
 * Código Técnico: IN5BM
 */
import com.michaelsalvatierra.db.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import com.michaelsalvatierra.models.domain.Almuerzo;
import com.michaelsalvatierra.models.idao.IAlmuerzoDAO;
import java.sql.SQLException;

public class AlmuerzoDaoImpl implements IAlmuerzoDAO {

    private static final String SQL_SELECT = "SELECT combo.id, combo.nombre, po.id, po.nombre, pla.id, pla.nombre, b.id, b.nombre, combo.descripcion, combo.precio, combo.ruta_imagen,combo.tiempo FROM combo JOIN postre AS po ON combo.postre_id = po.id\n"
            + "JOIN platillo AS pla ON combo.platillo_id= pla.id \n"
            + "JOIN bebida AS b ON combo.bebida_id=b.id AND tiempo=\"ALMUERZO\"";

    private static final String SQL_DELETE = "DELETE FROM combo WHERE id = ?;";
    private static final String SQL_INSERT = "INSERT INTO combo (nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen, tiempo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT id, nombre, postre_id, platillo_id, bebida_id, descripcion, precio, ruta_imagen, tiempo FROM combo WHERE id = ?";
    private static final String SQL_UPDATE = "UPDATE combo SET nombre = ? , postre_id = ?, platillo_id = ?, bebida_id = ?, descripcion = ?, precio = ?, ruta_imagen = ?, tiempo = ? WHERE id = ?";

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Almuerzo almuerzo = null;
    private List<Almuerzo> listaAlmuerzo = new ArrayList<>();

    @Override
    public List<Almuerzo> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                almuerzo = new Almuerzo(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getString(11),
                        rs.getString(12)
                );
                System.out.println(almuerzo.toString());
                listaAlmuerzo.add(almuerzo);
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
        return listaAlmuerzo;
    }

    @Override
    public int add(Almuerzo almuerzo) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_INSERT);
            pstmt.setString(1, almuerzo.getNombre());
            pstmt.setInt(2, almuerzo.getPostreId());
            pstmt.setInt(3, almuerzo.getPlatilloId());
            pstmt.setInt(4, almuerzo.getBebidaId());
            pstmt.setString(5, almuerzo.getDescripcion());
            pstmt.setDouble(6, almuerzo.getPrecio());
            pstmt.setString(7, almuerzo.getRutaImagen());
            pstmt.setString(8, almuerzo.getTiempo());

            System.out.println(pstmt.toString());

            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Se produjo un error al intentar insertar el siguiente registro " + almuerzo.toString());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return rows;
    }

    @Override
    public int update(Almuerzo almuerzo) {
        int rows = 0;
        try{
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_UPDATE);
            System.out.println(almuerzo.toString());
            pstmt.setString(1, almuerzo.getNombre());
            pstmt.setInt(2, almuerzo.getPostreId());
            pstmt.setInt(3, almuerzo.getPlatilloId());
            pstmt.setInt(4, almuerzo.getBebidaId());
            pstmt.setString(5, almuerzo.getDescripcion());
            pstmt.setFloat(6, almuerzo.getPrecio());
            pstmt.setString(7, almuerzo.getRutaImagen());
            pstmt.setString(8, almuerzo.getTiempo());
            pstmt.setInt(9, almuerzo.getId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Se produjo un error al intentar actualizar el siguiente registro: " 
                    + almuerzo.toString());
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
    public int delete(Almuerzo almuerzo) {
        int rows = 0;
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, almuerzo.getId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Se produjo un error al intentar eliminar el registro con id: " + almuerzo.getId());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows;
    }

    public Almuerzo get(Almuerzo almuerzo) {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, almuerzo.getId());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                almuerzo = new Almuerzo(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
            System.out.println("desayunos: " + almuerzo);
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
        return almuerzo;
    }
}

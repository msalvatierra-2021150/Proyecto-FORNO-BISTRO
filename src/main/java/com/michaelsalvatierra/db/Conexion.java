package com.michaelsalvatierra.db;

import java.sql.*;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Created on : Aug 19, 2022, 8:48:50 am 
 * Author : Michael Steven Salvatierra Ramirez 
 * Carne: 2021150 
 * Codigo tecnico: IN5BM 
 * Jornada: Matutina 
 * Grado: 5to
 * Perito en informatica 
 * Profesor: Lic. Jorge Luis Perez Canto 
 * Grupo presencial:2 (Lunes)
 */
public class Conexion {

    private static final String HOST = "127.0.0.1";
    private static final String PORT = "3306";
    private static final String DB = "bd_restaurante_in5bm_grupo5";
    private static final String USER = "kinal";
    private static final String PASSWORD = "admin";
    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB + "?useSSL=false&useTimeZone=true&serverTimeZone=UTC&allowPublicKeyRetrieval=true";

    private static BasicDataSource basicDataSource;

    public static DataSource getDataSource() {
        if (basicDataSource == null) {
            basicDataSource = new BasicDataSource();
            basicDataSource.setUrl(URL);
            basicDataSource.setUsername(USER);
            basicDataSource.setPassword(PASSWORD);
            basicDataSource.setInitialSize(25);
        }
        return basicDataSource;
    }

    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }

    public static void close(ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public static void close(PreparedStatement pstmt) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public static void close(Connection con) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }
}

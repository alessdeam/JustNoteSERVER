package mwt.justnote.services.impl;

import mwt.justnote.model.Nota;
import mwt.justnote.model.Utente;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.UtenteService;

import java.sql.*;
import java.util.TimeZone;

public class UtenteServiceImpl implements UtenteService {

    final private String port = "localhost:3306/justnote";
    final private String user = "root";
    final private String pwd = "";
    final private String timeZone = TimeZone.getTimeZone("Europe/Rome").getID();

    private static final String FIND_UTENTE_BY_ID = "SELECT * FROM utenti where id=?";
    private static final String FIND_UTENTE_BY_EMAIL = "SELECT * FROM utenti where email=?";
    private static final String UPDATE_UTENTE = "UPDATE utenti SET nome=?, cognome=?, email=? WHERE id=?";

    public Connection getConnection(Connection connection) {
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                //System.out.println("Errore Connessione");
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://" + port + "?user=" + user + "&password=" + pwd
                    + "&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone="
                    + timeZone);
            //System.out.println("Connection established");
        } catch (Exception e) {
            //System.out.println("SQLException: " + e.getMessage());
        }
        return connection;
    }

    @Override
    public Utente getUtenteById(long id) {

        PreparedStatement sql = null;
        Connection connection = null;

        Utente utente = new Utente();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_UTENTE_BY_ID);

            sql.setLong(1, id);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                utente.setId(rs.getLong("id"));
                utente.setNome(rs.getString("nome"));
                utente.setCognome(rs.getString("cognome"));
                utente.setEmail(rs.getString("email"));

            }
            return utente;

        } catch (SQLException e) {
            return utente;
        }finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public Utente getUtenteByEmail(String email) {

        PreparedStatement sql = null;
        Connection connection = null;

        Utente utente = new Utente();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_UTENTE_BY_EMAIL);

            sql.setString(1, email);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                utente.setId(rs.getLong("id"));
                utente.setNome(rs.getString("nome"));
                utente.setCognome(rs.getString("cognome"));

            }
            return utente;

        } catch (SQLException e) {
            return utente;
        }finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public void updateUtente(Utente utente, Long utenteId) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            ps = connection.prepareStatement(UPDATE_UTENTE);

            ps.setString(1, utente.getNome());
            ps.setString(2, utente.getCognome());
            ps.setString(3, utente.getEmail());
            ps.setLong(4, utenteId);

            if(ps.executeUpdate() == 1) {
                //System.out.println("Utente updated");
            }else {
                //System.out.println("Utente not updated");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with Update an Utente..");
        }
        finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                }
            }
        }

    }

}

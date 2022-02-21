package mwt.justnote.services.impl;

import mwt.justnote.model.Session;
import mwt.justnote.model.Utente;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.Utility;

import java.sql.*;

public class AuthenticationServiceImpl implements AuthenticationService {
    private static final String FIND_USER = "SELECT * FROM utenti WHERE email = ?";
    private static final String CREATE_SESSION = "INSERT into sessions(token, id_utente) VALUES(?,?)";
    private static final String INSERT_USER = "INSERT into utenti(nome,cognome,email,password) VALUES (?,?,?,?)";

    public Connection getConnection(Connection connection) {

        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                //System.out.println("Errore Connessione");
                e.printStackTrace();
            }

            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/justnote?user=root&password=");

            //System.out.println("Connection established");

        } catch (Exception e) {
            //System.out.println("SQLException: " + e.getMessage());
        }
        return connection;
    }

    @Override
    public Session loginUser(Utente utente) throws JustNoteBusinessException {

        Session response = new Session();
        Utility utility = new Utility();

        Utente result = null;
        Connection connection = null;

        connection = this.getConnection(connection);
        try (PreparedStatement stmt = connection.prepareStatement(FIND_USER)) {

            stmt.setString(1, utente.getEmail());

            try (ResultSet rs = stmt.executeQuery();) {

                if (rs.next()) {
                    if(utility.hashPwd(utente.getPassword()).equals(rs.getString("password"))) {

                        long f = rs.getLong("id");

                        utente.setId(f);
                        utente.setEmail(rs.getString("email"));
                        utente.setNome(rs.getString("nome"));
                        utente.setCognome(rs.getString("cognome"));

                        // generate session token
                        String token = Utility.generateToken(utente);

                        PreparedStatement sessionSt = connection.prepareStatement(CREATE_SESSION);
                        sessionSt.setString(1, token);
                        sessionSt.setLong(2, utente.getId());

                        if(sessionSt.executeUpdate() == 1) {
                            response.setId(f);
                            response.setToken(token);
                        } else {
                            response.setToken(null);
                        }
                    }
                } else {
                    response.setToken(null);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with User Login");
        }
        return response;
    }

    @Override
    public Boolean insertUser(Utente utente) throws JustNoteBusinessException {

        PreparedStatement userPs = null;

        Boolean response = false;
        Utility utility = new Utility();
        Connection connection = null;

        connection = this.getConnection(connection);
        try (PreparedStatement stmt = connection.prepareStatement(FIND_USER);) {
            stmt.setString(1, utente.getEmail());
            try (ResultSet rs = stmt.executeQuery();) {
                if (rs.next()) {
                    response = false;
                } else {

                    try (PreparedStatement st = connection.prepareStatement(INSERT_USER);) {
                        st.setString(1, utente.getNome());
                        st.setString(2, utente.getCognome());
                        st.setString(3, utente.getEmail());
                        //password hashed using google.common.hash functions
                        st.setString(4, utility.hashPwd(utente.getPassword()));

                        st.executeUpdate();
                    }

                    response = true;
                }

                return response;

            }
        } catch (SQLException e) {
            throw new JustNoteBusinessException("findUtenteByUsername", e);
        }

    }

    @Override
    public Boolean checkSession(String token) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM sessions WHERE token = ?";
        Boolean response;
        Connection connection = null;

        connection = this.getConnection(connection);

        try {
            int num_rows = 0;
            ps = connection.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();
            while(rs.next())
            {
                num_rows = rs.getRow();
            }

            if(num_rows != 0) {
                response = true;
            } else {
                response = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with Checking Session");
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {}
            }
        }
        return response;
    }
}

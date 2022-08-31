package bean;
import java.sql.*;

public class LoginDao {
    
    public static boolean validate(LoginBean bean)
    {
        boolean status=false;
        try
        {
        Connection con=ConnectionProvider.getCon();
        PreparedStatement ps=con.prepareStatement("SELECT * FROM usuario where usr_nombre=? and usr_correo=? and usr_contrasenna=?;");
        ps.setString(1, bean.getNombre());
        ps.setString(2, bean.getEmail());
        ps.setString(3, bean.getPass());
        
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        
        }
        catch(SQLException e){
        }
        return status;
    }

    
}


package bean;


public interface Provider {
    
    String DRIVER="com.mysql.cj.jdbc.Driver";
    String USERNAME="/*usuario Bd*/";
    String PASSWORD="/*contraseñan Bd*/";
    String HOST="localhost";
    String PORT="3306";
    String DATABASE="/*nombre Bd*/";
    String CLASSNAME="com.mysql.cj.jdbc.Driver";
    boolean useSSL=false;
    String publicKey = "true"; 
    String autoReconnect = "true";
    String CONNECTION_URL= "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE+"?user="+USERNAME+"&password="+PASSWORD+"&autoReconnect="+autoReconnect+"&allowPublicKeyRetrieval="+publicKey+"&useSSL="+useSSL;
    
}

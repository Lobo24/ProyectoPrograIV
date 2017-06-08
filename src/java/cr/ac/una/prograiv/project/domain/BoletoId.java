package cr.ac.una.prograiv.project.domain;
// Generated 07/06/2017 09:12:23 PM by Hibernate Tools 4.3.1

// Generated 07/06/2017 09:12:23 PM by Hibernate Tools 4.3.1



/**
 * BoletoId generated by hbm2java
 */
public class BoletoId  implements java.io.Serializable {


     private int idVuelo;
     private int idUsuario;

    public BoletoId() {
    }

    public BoletoId(int idVuelo, int idUsuario) {
       this.idVuelo = idVuelo;
       this.idUsuario = idUsuario;
    }
   
    public int getIdVuelo() {
        return this.idVuelo;
    }
    
    public void setIdVuelo(int idVuelo) {
        this.idVuelo = idVuelo;
    }
    public int getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof BoletoId) ) return false;
		 BoletoId castOther = ( BoletoId ) other; 
         
		 return (this.getIdVuelo()==castOther.getIdVuelo())
 && (this.getIdUsuario()==castOther.getIdUsuario());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdVuelo();
         result = 37 * result + this.getIdUsuario();
         return result;
   }   


}



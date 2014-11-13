package sv.edu.ues.dsi.palasatenea.utilidades;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class Utilidades {
	public Date stringToDate(String strFecha){
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
		Date fecha = null;
		try {
			fecha = formatoDelTexto.parse(strFecha);
			return fecha;
		} catch (Exception e){
			System.err.println("(Fechas) Ocurrio un error "+e.getMessage());
			return null;
		}
	}
	
	public BigDecimal stringToBigDecimal(String strBigDecimal){
		strBigDecimal = strBigDecimal.replaceAll(",","");
		return new BigDecimal(strBigDecimal);
	}
	
	public String getUsuario(){
		String usuario = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) principal;
			usuario = userDetails.getUsername();
		}
		return usuario;
	}
}

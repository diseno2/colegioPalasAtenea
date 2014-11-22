package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.Usuario;
import sv.edu.ues.dsi.palasatenea.modelo.dao.UsuarioDao;

public class UsuarioCtrl {
	private UsuarioDao dao = new UsuarioDao();
	
	public void guardar(Usuario usuario){
		dao.guardar(usuario);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Usuario findById(int ident){
		Usuario usuario = dao.findById(ident);
		return usuario;
	}
	
	public List<Usuario> findByAll(){
		List<Usuario> lst = dao.findByAll();
		return lst;
	}
	
	public List<Usuario> findByParam(Usuario usuario){
		List<Usuario> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Usuario usuario){
		if (usuario.getDocentes().size() == 0 && usuario.getFamiliars().size() == 0 && usuario.getFamiliars().size() == 0 && usuario.getLogs().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Usuarios\\Report.jrxml";
			File f = new File(path);
			JasperDesign disenioReporte = JRXmlLoader.load(path);
			JasperReport report = JasperCompileManager.compileReport(disenioReporte);
			bytes = JasperRunManager.runReportToPdf(report, new HashMap(), dao.obtenerConexion());*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return bytes;
	}
}

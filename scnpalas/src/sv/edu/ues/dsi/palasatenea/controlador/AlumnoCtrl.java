package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import org.springframework.security.crypto.keygen.KeyGenerators;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiares;
import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.Usuario;
import sv.edu.ues.dsi.palasatenea.modelo.dao.AlumnoDao;
import sv.edu.ues.dsi.palasatenea.utilidades.Mail;

public class AlumnoCtrl {
	private AlumnoDao dao = new AlumnoDao();
	
	public void guardar(Alumno alumno){
		dao.guardar(alumno);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public void borrarAll(){
		System.out.println("1");
		List<Alumno> alumnoList = dao.findByAll((short) 0);
		System.out.println("2");
		Alumno alumno;
		Familiares familiares;
		FamiliaresCtrl famCtrl = new FamiliaresCtrl();
		FamiliarCtrl famCtrl1 = new FamiliarCtrl();
		List<Familiares> famList = null;
		List<Familiares> famList1 = null;
		
		System.out.println("2");
		for(int i=0;i<alumnoList.size();i++){
			System.out.println("3");
			alumno = (Alumno) alumnoList.get(i);
			
			//obtener los familiares
			famList = famCtrl.findByAlumno(alumno);
			System.out.println("4");
			for(int j=0;j<famList.size();j++){
				familiares = (Familiares) famList.get(j);
				famCtrl.borrar(familiares.getIdent());
				System.out.println("5");
				//buscar si para el familiar hay mas registros de familiares
				famList1 = famCtrl.findByFamiliar(familiares.getFamiliar());
				System.out.println("6");
				if (famList1.size() == 0 || famList1.isEmpty() || famList1 == null){
					System.out.println("7");
					famCtrl1.borrar(familiares.getFamiliar().getIdent());
				}
			}
			this.borrar(alumno.getIdent());
			System.out.println("8");
		}
	}
	
	public Alumno findById(int ident){
		Alumno alumno = dao.findById(ident);
		return alumno;
	}
	
	public void alta(Integer ident){
		Alumno alumno = this.findById(ident);
		String codigo = this.codigo(alumno);
		alumno.setCarnet(codigo);
		Short estado = 1;
		alumno.setEstado(estado);
		
		String pass = KeyGenerators.string().generateKey();
		String user = "alumno@"+alumno.getCarnet().toLowerCase();
		Rol rol = new RolCtrl().findByTipo("ROLE_ALUMNO");
		Usuario usuario = new Usuario(rol, user,pass, "A");
		UsuarioCtrl uCtrl = new UsuarioCtrl();
		uCtrl.guardar(usuario);
		alumno.setUsuario(usuario);
		
		if (alumno.getCorreo() != null && alumno.getCorreo() != ""){
			Mail mail = new Mail();
			mail.send(alumno.getCorreo(),"Información de Usuario de Colegio Palas Atenea",
					  "Su registro ha sido dado de alta para el alumno "+alumno.toString()+"."+	
					  "Su usuario asignado es "+user+" y su contraseña "+pass);
		}
		//aqui tambien crear los usuarios de los familiares en caso de ser necesario
		
		this.guardar(alumno);
	}
	
	private String codigo(Alumno alumno){
		String codigo = "";
		codigo = alumno.getApellido1().substring(0,1);
		
		if (alumno.getApellido2().isEmpty())
			codigo += alumno.getApellido1().substring(1,2);
		else
			codigo += alumno.getApellido2().substring(0,1);
		
		//sacando el año de la fecha de nacimiento del alumno
		String anio = alumno.getFnacimiento().toString().substring(2,4); 
		codigo += anio;
		
		Long cant = dao.findByYear(Integer.parseInt(alumno.getFnacimiento().toString().substring(0,4)));
		if (cant <= 9) codigo += "00"+cant;
		else if(cant <= 99 && cant > 9) codigo += "0"+cant;
		else codigo += cant;
		
		return codigo;
	}
	
	public void baja(Integer ident){
		Alumno alumno = this.findById(ident);
		Short estado = 2;
		alumno.setEstado(estado);
		this.guardar(alumno);
	}
	
	public List<Alumno> findByAll(){
		List<Alumno> lst = dao.findByAll();
		return lst;
	}
	
	public List<Alumno> findByParam(String nombre1, String nombre2, 
			String apellido1, String apellido2,
			String genero, String grado){
		return dao.findByParam(nombre1, nombre2, apellido1, apellido2,genero, grado);
	}
	
	public Boolean puedoBorrar(Alumno alumno){
		if (alumno.getFamiliareses().size() == 0 && alumno.getMatriculas().size() == 0 && alumno.getNotas().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Materias\\Report.jrxml";
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

package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-21-2014 05:34:49 PM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Alumno generated by hbm2java
 */
@Entity
@Table(name = "alumno", catalog = "scnpalas")
public class Alumno implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private Usuario usuario;
	private Grado gradoByGradoActual;
	private Grado gradoByGradoAprobado;
	private String carnet;
	private Short estado;
	private String nombre1;
	private String nombre2;
	private String apellido1;
	private String apellido2;
	private String genero;
	private Date fnacimiento;
	private String lnacimiento;
	private String direccion;
	private String telefono;
	private String religion;
	private String enfermedades;
	private String medicamentos;
	private String alergico;
	private String aprendizaje;
	private String escuelaprevia;
	private String correo;
	private Set<Matricula> matriculas = new HashSet<Matricula>(0);
	private Set<Familiares> familiareses = new HashSet<Familiares>(0);
	private Set<Nota> notas = new HashSet<Nota>(0);

	public Alumno() {
		this.ident = 0;
		this.carnet = "";
		this.estado = 0;
		this.nombre1 = "";
		this.nombre2 = "";
		this.apellido1 = "";
		this.apellido2 = "";
		this.genero = "";
		//this.fnacimiento = "";
		this.lnacimiento = "";
		this.direccion = "";
		this.telefono = "";
		this.religion = "";
		this.enfermedades = "";
		this.medicamentos = "";
		this.alergico = "";
		this.aprendizaje = "";
		this.escuelaprevia = "";
		this.correo = "";
	}

	public Alumno(Usuario usuario, Grado gradoByGradoActual,
			Grado gradoByGradoAprobado, String carnet, Short estado,
			String nombre1, String nombre2, String apellido1, String apellido2,
			String genero, Date fnacimiento, String lnacimiento,
			String direccion, String telefono, String religion,
			String enfermedades, String medicamentos, String alergico,
			String aprendizaje, String escuelaprevia, String correo,
			Set<Matricula> matriculas, Set<Familiares> familiareses,
			Set<Nota> notas) {
		this.usuario = usuario;
		this.gradoByGradoActual = gradoByGradoActual;
		this.gradoByGradoAprobado = gradoByGradoAprobado;
		this.carnet = carnet;
		this.estado = estado;
		this.nombre1 = nombre1;
		this.nombre2 = nombre2;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.genero = genero;
		this.fnacimiento = fnacimiento;
		this.lnacimiento = lnacimiento;
		this.direccion = direccion;
		this.telefono = telefono;
		this.religion = religion;
		this.enfermedades = enfermedades;
		this.medicamentos = medicamentos;
		this.alergico = alergico;
		this.aprendizaje = aprendizaje;
		this.escuelaprevia = escuelaprevia;
		this.correo = correo;
		this.matriculas = matriculas;
		this.familiareses = familiareses;
		this.notas = notas;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ident", unique = true, nullable = false)
	public Integer getIdent() {
		return this.ident;
	}

	public void setIdent(Integer ident) {
		this.ident = ident;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "usuario")
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "grado_actual")
	public Grado getGradoByGradoActual() {
		return this.gradoByGradoActual;
	}

	public void setGradoByGradoActual(Grado gradoByGradoActual) {
		this.gradoByGradoActual = gradoByGradoActual;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "grado_aprobado")
	public Grado getGradoByGradoAprobado() {
		return this.gradoByGradoAprobado;
	}

	public void setGradoByGradoAprobado(Grado gradoByGradoAprobado) {
		this.gradoByGradoAprobado = gradoByGradoAprobado;
	}

	@Column(name = "carnet", length = 8)
	public String getCarnet() {
		return this.carnet;
	}

	public void setCarnet(String carnet) {
		this.carnet = carnet;
	}

	@Column(name = "estado")
	public Short getEstado() {
		return this.estado;
	}

	public void setEstado(Short estado) {
		this.estado = estado;
	}

	@Column(name = "nombre1", length = 50)
	public String getNombre1() {
		return this.nombre1;
	}

	public void setNombre1(String nombre1) {
		this.nombre1 = nombre1;
	}

	@Column(name = "nombre2", length = 50)
	public String getNombre2() {
		return this.nombre2;
	}

	public void setNombre2(String nombre2) {
		this.nombre2 = nombre2;
	}

	@Column(name = "apellido1", length = 50)
	public String getApellido1() {
		return this.apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	@Column(name = "apellido2", length = 50)
	public String getApellido2() {
		return this.apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}

	@Column(name = "genero", length = 1)
	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fnacimiento", length = 19)
	public Date getFnacimiento() {
		return this.fnacimiento;
	}

	public void setFnacimiento(Date fnacimiento) {
		this.fnacimiento = fnacimiento;
	}

	@Column(name = "lnacimiento", length = 250)
	public String getLnacimiento() {
		return this.lnacimiento;
	}

	public void setLnacimiento(String lnacimiento) {
		this.lnacimiento = lnacimiento;
	}

	@Column(name = "direccion", length = 500)
	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Column(name = "telefono", length = 8)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Column(name = "religion", length = 250)
	public String getReligion() {
		return this.religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	@Column(name = "enfermedades", length = 500)
	public String getEnfermedades() {
		return this.enfermedades;
	}

	public void setEnfermedades(String enfermedades) {
		this.enfermedades = enfermedades;
	}

	@Column(name = "medicamentos", length = 500)
	public String getMedicamentos() {
		return this.medicamentos;
	}

	public void setMedicamentos(String medicamentos) {
		this.medicamentos = medicamentos;
	}

	@Column(name = "alergico", length = 500)
	public String getAlergico() {
		return this.alergico;
	}

	public void setAlergico(String alergico) {
		this.alergico = alergico;
	}

	@Column(name = "aprendizaje", length = 500)
	public String getAprendizaje() {
		return this.aprendizaje;
	}

	public void setAprendizaje(String aprendizaje) {
		this.aprendizaje = aprendizaje;
	}

	@Column(name = "escuelaprevia", length = 250)
	public String getEscuelaprevia() {
		return this.escuelaprevia;
	}

	public void setEscuelaprevia(String escuelaprevia) {
		this.escuelaprevia = escuelaprevia;
	}

	@Column(name = "correo", length = 45)
	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "alumno")
	public Set<Matricula> getMatriculas() {
		return this.matriculas;
	}

	public void setMatriculas(Set<Matricula> matriculas) {
		this.matriculas = matriculas;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "alumno")
	public Set<Familiares> getFamiliareses() {
		return this.familiareses;
	}

	public void setFamiliareses(Set<Familiares> familiareses) {
		this.familiareses = familiareses;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "alumno")
	public Set<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(Set<Nota> notas) {
		this.notas = notas;
	}
	
	public String toString(){
		String nombre = this.carnet+"-"+this.nombre1;
		if(this.nombre1!=null) nombre+=" "+this.nombre2;
		
		nombre += " "+this.apellido1;
		if(this.apellido2!=null) nombre+=" "+this.apellido2;
		
		return nombre;
		
	}

}

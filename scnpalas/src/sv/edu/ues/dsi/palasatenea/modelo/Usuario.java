package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

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

/**
 * Usuario generated by hbm2java
 */
@Entity
@Table(name = "usuario", catalog = "scnpalas")
public class Usuario implements java.io.Serializable {

	private Integer ident;
	private Rol rol;
	private String usuario;
	private String password;
	private String estado;
	private Set<Familiar> familiars = new HashSet<Familiar>(0);
	private Set<Alumno> alumnos = new HashSet<Alumno>(0);
	private Set<Log> logs = new HashSet<Log>(0);
	private Set<Docente> docentes = new HashSet<Docente>(0);

	public Usuario() {
	}

	public Usuario(Rol rol, String usuario, String password, String estado) {
		this.rol = rol;
		this.usuario = usuario;
		this.password = password;
		this.estado = estado;
	}

	public Usuario(Rol rol, String usuario, String password, String estado,
			Set<Familiar> familiars, Set<Alumno> alumnos, Set<Log> logs,
			Set<Docente> docentes) {
		this.rol = rol;
		this.usuario = usuario;
		this.password = password;
		this.estado = estado;
		this.familiars = familiars;
		this.alumnos = alumnos;
		this.logs = logs;
		this.docentes = docentes;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rol", nullable = false)
	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	@Column(name = "usuario", nullable = false, length = 45)
	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	@Column(name = "password", nullable = false, length = 250)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "estado", nullable = false, length = 1)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Familiar> getFamiliars() {
		return this.familiars;
	}

	public void setFamiliars(Set<Familiar> familiars) {
		this.familiars = familiars;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Alumno> getAlumnos() {
		return this.alumnos;
	}

	public void setAlumnos(Set<Alumno> alumnos) {
		this.alumnos = alumnos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Log> getLogs() {
		return this.logs;
	}

	public void setLogs(Set<Log> logs) {
		this.logs = logs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Docente> getDocentes() {
		return this.docentes;
	}

	public void setDocentes(Set<Docente> docentes) {
		this.docentes = docentes;
	}

}
package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 10-25-2014 08:29:50 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Familiar generated by hbm2java
 */
@Entity
@Table(name = "familiar", catalog = "palasatenea")
@NamedQueries({
	@NamedQuery(name="Familiar.findByAll", query="SELECT a FROM Familiar a"),
	@NamedQuery(name="Familiar.findByIdent", query="SELECT a FROM Familiar a WHERE a.ident = :id"),
	@NamedQuery(name="Familiar.findByAlumno", query="SELECT c FROM Familiar c WHERE c.alumno = :alumno")
	})
public class Familiar implements java.io.Serializable {

	private Integer ident;
	private Integer alumno;
	private String nombre;
	private String direccion;
	private String telefono;
	private String celular;
	private String empresa;
	private String email;
	private String lugtrabajo;
	private String dirtrabajo;
	private String teltrabajo;
	private String exttrabajo;
	private Integer parentesco;

	public Familiar() {
	}

	public Familiar(Integer alumno, String nombre, String direccion,
			String telefono, String celular, String empresa, String email,
			String lugtrabajo, String dirtrabajo, String teltrabajo,
			String exttrabajo, Integer parentesco) {
		this.alumno = alumno;
		this.nombre = nombre;
		this.direccion = direccion;
		this.telefono = telefono;
		this.celular = celular;
		this.empresa = empresa;
		this.email = email;
		this.lugtrabajo = lugtrabajo;
		this.dirtrabajo = dirtrabajo;
		this.teltrabajo = teltrabajo;
		this.exttrabajo = exttrabajo;
		this.parentesco = parentesco;
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

	@Column(name = "alumno")
	public Integer getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Integer alumno) {
		this.alumno = alumno;
	}

	@Column(name = "nombre", length = 100)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "direccion", length = 500)
	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Column(name = "telefono", length = 45)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Column(name = "celular", length = 45)
	public String getCelular() {
		return this.celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	@Column(name = "empresa", length = 45)
	public String getEmpresa() {
		return this.empresa;
	}

	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "lugtrabajo", length = 100)
	public String getLugtrabajo() {
		return this.lugtrabajo;
	}

	public void setLugtrabajo(String lugtrabajo) {
		this.lugtrabajo = lugtrabajo;
	}

	@Column(name = "dirtrabajo", length = 500)
	public String getDirtrabajo() {
		return this.dirtrabajo;
	}

	public void setDirtrabajo(String dirtrabajo) {
		this.dirtrabajo = dirtrabajo;
	}

	@Column(name = "teltrabajo", length = 45)
	public String getTeltrabajo() {
		return this.teltrabajo;
	}

	public void setTeltrabajo(String teltrabajo) {
		this.teltrabajo = teltrabajo;
	}

	@Column(name = "exttrabajo", length = 5)
	public String getExttrabajo() {
		return this.exttrabajo;
	}

	public void setExttrabajo(String exttrabajo) {
		this.exttrabajo = exttrabajo;
	}

	@Column(name = "parentesco")
	public Integer getParentesco() {
		return this.parentesco;
	}

	public void setParentesco(Integer parentesco) {
		this.parentesco = parentesco;
	}

}

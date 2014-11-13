package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

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
 * Docente generated by hbm2java
 */
@Entity
@Table(name = "docente", catalog = "scnpalas")
public class Docente implements java.io.Serializable {

	private Integer ident;
	private Usuario usuario;
	private String nombre1;
	private String nombre2;
	private String apellido1;
	private String apellido2;
	private String direccion;
	private String telefono;
	private Date fnacimiento;
	private Date fcontrato;
	private Set<Grado> grados = new HashSet<Grado>(0);

	public Docente() {
	}

	public Docente(Usuario usuario, String nombre1, String nombre2,
			String apellido1, String apellido2, String direccion,
			String telefono, Date fnacimiento, Date fcontrato) {
		this.usuario = usuario;
		this.nombre1 = nombre1;
		this.nombre2 = nombre2;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.direccion = direccion;
		this.telefono = telefono;
		this.fnacimiento = fnacimiento;
		this.fcontrato = fcontrato;
	}

	public Docente(Usuario usuario, String nombre1, String nombre2,
			String apellido1, String apellido2, String direccion,
			String telefono, Date fnacimiento, Date fcontrato, Set<Grado> grados) {
		this.usuario = usuario;
		this.nombre1 = nombre1;
		this.nombre2 = nombre2;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.direccion = direccion;
		this.telefono = telefono;
		this.fnacimiento = fnacimiento;
		this.fcontrato = fcontrato;
		this.grados = grados;
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
	@JoinColumn(name = "usuario", nullable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Column(name = "nombre1", nullable = false, length = 45)
	public String getNombre1() {
		return this.nombre1;
	}

	public void setNombre1(String nombre1) {
		this.nombre1 = nombre1;
	}

	@Column(name = "nombre2", nullable = false, length = 45)
	public String getNombre2() {
		return this.nombre2;
	}

	public void setNombre2(String nombre2) {
		this.nombre2 = nombre2;
	}

	@Column(name = "apellido1", nullable = false, length = 45)
	public String getApellido1() {
		return this.apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	@Column(name = "apellido2", nullable = false, length = 45)
	public String getApellido2() {
		return this.apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}

	@Column(name = "direccion", nullable = false, length = 250)
	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Column(name = "telefono", nullable = false, length = 9)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fnacimiento", nullable = false, length = 10)
	public Date getFnacimiento() {
		return this.fnacimiento;
	}

	public void setFnacimiento(Date fnacimiento) {
		this.fnacimiento = fnacimiento;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fcontrato", nullable = false, length = 10)
	public Date getFcontrato() {
		return this.fcontrato;
	}

	public void setFcontrato(Date fcontrato) {
		this.fcontrato = fcontrato;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "docente")
	public Set<Grado> getGrados() {
		return this.grados;
	}

	public void setGrados(Set<Grado> grados) {
		this.grados = grados;
	}

}

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
 * Evaluacion generated by hbm2java
 */
@Entity
@Table(name = "evaluacion", catalog = "scnpalas")
public class Evaluacion implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private SubPeriodo subperiodo;
	private Grado grado;
	private Materia materia;
	private String evaluacion;
	private String descripcion;
	private float porcentaje;
	private Date fecha;
	private String estado;
	private Seccion seccion;
	private Set<Nota> notas = new HashSet<Nota>(0);

	public Evaluacion() {
		this.ident = 0;
	}

	public Evaluacion(SubPeriodo subperiodo, Grado grado,
			Materia materia, String evaluacion, float porcentaje,
			Date fecha, String estado) {
		this.subperiodo = subperiodo;
		this.grado = grado;
		this.materia = materia;
		this.evaluacion = evaluacion;
		this.porcentaje = porcentaje;
		this.fecha = fecha;
		this.estado = estado;
	}

	public Evaluacion(SubPeriodo subperiodo, Grado grado,
			GradoMateria gradoMateria, String evaluacion, String descripcion,
			float porcentaje, Date fecha, String estado, Set<Nota> notas) {
		this.subperiodo = subperiodo;
		this.grado = grado;
		this.materia = materia;
		this.evaluacion = evaluacion;
		this.descripcion = descripcion;
		this.porcentaje = porcentaje;
		this.fecha = fecha;
		this.estado = estado;
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
	@JoinColumn(name = "superiodo", nullable = false)
	public SubPeriodo getSubperiodo() {
		return this.subperiodo;
	}

	public void setSubperiodo(SubPeriodo subperiodo) {
		this.subperiodo = subperiodo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "grado", nullable = false)
	public Grado getGrado() {
		return this.grado;
	}

	public void setGrado(Grado grado) {
		this.grado = grado;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "materia", nullable = false)
	public Materia getMateria() {
		return this.materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	@Column(name = "evaluacion", nullable = false, length = 45)
	public String getEvaluacion() {
		return this.evaluacion;
	}

	public void setEvaluacion(String evaluacion) {
		this.evaluacion = evaluacion;
	}

	@Column(name = "descripcion", length = 45)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "porcentaje", nullable = false, precision = 12, scale = 0)
	public float getPorcentaje() {
		return this.porcentaje;
	}

	public void setPorcentaje(float porcentaje) {
		this.porcentaje = porcentaje;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", nullable = false, length = 10)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "estado", nullable = false, length = 1)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "evaluacion")
	public Set<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(Set<Nota> notas) {
		this.notas = notas;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "seccion", nullable = false)
	public Seccion getSeccion() {
		return this.seccion;
	}

	public void setSeccion(Seccion seccion) {
		this.seccion = seccion;
	}

	public String toString(){
		return this.grado.toString()+" "+
			   //this.materia.toString()+" "+
			   this.descripcion+" "+
			   this.porcentaje;
	}
}

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

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Evaluacion generated by hbm2java
 */
@Entity
@Table(name = "evaluacion", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Evaluacion.findByAll", query = "SELECT c FROM Evaluacion c "),
	@NamedQuery(name = "Evaluacion.findByIdent", query = "SELECT c FROM Evaluacion c WHERE ident = :id")
})
public class Evaluacion implements java.io.Serializable {

	private Integer ident;
	private GradoMateria gradoMateria;
	private String evaluacion;
	private String descripcion;
	private float porcentaje;
	private String bimestre;
	private Date fecha;
	private String estado;
	private Set<Nota> notas = new HashSet<Nota>(0);

	public Evaluacion() {
	}

	public Evaluacion(GradoMateria gradoMateria, String evaluacion,
			float porcentaje, String bimestre, Date fecha, String estado) {
		this.gradoMateria = gradoMateria;
		this.evaluacion = evaluacion;
		this.porcentaje = porcentaje;
		this.bimestre = bimestre;
		this.fecha = fecha;
		this.estado = estado;
	}

	public Evaluacion(GradoMateria gradoMateria, String evaluacion,
			String descripcion, float porcentaje, String bimestre, Date fecha,
			String estado, Set<Nota> notas) {
		this.gradoMateria = gradoMateria;
		this.evaluacion = evaluacion;
		this.descripcion = descripcion;
		this.porcentaje = porcentaje;
		this.bimestre = bimestre;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "grado_materia", nullable = false)
	public GradoMateria getGradoMateria() {
		return this.gradoMateria;
	}

	public void setGradoMateria(GradoMateria gradoMateria) {
		this.gradoMateria = gradoMateria;
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

	@Column(name = "bimestre", nullable = false, length = 45)
	public String getBimestre() {
		return this.bimestre;
	}

	public void setBimestre(String bimestre) {
		this.bimestre = bimestre;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "evaluacion")
	public Set<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(Set<Nota> notas) {
		this.notas = notas;
	}
	
	public String toString(){
		return this.gradoMateria.getGrado().toString()+" "+
			   this.gradoMateria.getMateria().toString()+" "+
			   this.descripcion+" "+
			   this.porcentaje;
	}
}

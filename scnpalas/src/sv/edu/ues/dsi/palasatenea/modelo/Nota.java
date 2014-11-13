package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Nota generated by hbm2java
 */
@Entity
@Table(name = "nota", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Nota.findByAll", query = "SELECT c FROM Nota c "),
	@NamedQuery(name = "Nota.findByIdent", query = "SELECT c FROM Nota c WHERE ident = :id")
})
public class Nota implements java.io.Serializable {

	private Integer ident;
	private Alumno alumno;
	private Periodo periodo;
	private Evaluacion evaluacion;
	private Materia materia;
	private float calificacion;
	private String tipoRegistro;

	public Nota() {
	}

	public Nota(Alumno alumno, Periodo periodo, Materia materia,
			float calificacion, String tipoRegistro) {
		this.alumno = alumno;
		this.periodo = periodo;
		this.materia = materia;
		this.calificacion = calificacion;
		this.tipoRegistro = tipoRegistro;
	}

	public Nota(Alumno alumno, Periodo periodo, Evaluacion evaluacion,
			Materia materia, float calificacion, String tipoRegistro) {
		this.alumno = alumno;
		this.periodo = periodo;
		this.evaluacion = evaluacion;
		this.materia = materia;
		this.calificacion = calificacion;
		this.tipoRegistro = tipoRegistro;
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
	@JoinColumn(name = "alumno", nullable = false)
	public Alumno getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "periodo", nullable = false)
	public Periodo getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "evaluacion")
	public Evaluacion getEvaluacion() {
		return this.evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "materia", nullable = false)
	public Materia getMateria() {
		return this.materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	@Column(name = "calificacion", nullable = false, precision = 12, scale = 0)
	public float getCalificacion() {
		return this.calificacion;
	}

	public void setCalificacion(float calificacion) {
		this.calificacion = calificacion;
	}

	@Column(name = "tipo_registro", nullable = false, length = 45)
	public String getTipoRegistro() {
		return this.tipoRegistro;
	}

	public void setTipoRegistro(String tipoRegistro) {
		this.tipoRegistro = tipoRegistro;
	}

}

package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-21-2014 05:34:49 PM by Hibernate Tools 4.0.0

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
 * GradoMateria generated by hbm2java
 */
@Entity
@Table(name = "grado_materia", catalog = "scnpalas")
public class GradoMateria implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private Grado grado;
	private Docente docente;
	private Materia materia;
	private String enSeccion;
	private Set<Evaluacion> evaluacions = new HashSet<Evaluacion>(0);

	public GradoMateria() {
		this.ident = 0;
	}

	public GradoMateria(Grado grado, Materia materia) {
		this.grado = grado;
		this.materia = materia;
	}

	public GradoMateria(Grado grado, Docente docente, Materia materia,
			String enSeccion, Set<Evaluacion> evaluacions) {
		this.grado = grado;
		this.docente = docente;
		this.materia = materia;
		this.enSeccion = enSeccion;
		this.evaluacions = evaluacions;
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
	@JoinColumn(name = "grado", nullable = false)
	public Grado getGrado() {
		return this.grado;
	}

	public void setGrado(Grado grado) {
		this.grado = grado;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "docente")
	public Docente getDocente() {
		return this.docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "materia", nullable = false)
	public Materia getMateria() {
		return this.materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	@Column(name = "en_seccion", length = 1)
	public String getEnSeccion() {
		return this.enSeccion;
	}

	public void setEnSeccion(String enSeccion) {
		this.enSeccion = enSeccion;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "gradoMateria")
	public Set<Evaluacion> getEvaluacions() {
		return this.evaluacions;
	}

	public void setEvaluacions(Set<Evaluacion> evaluacions) {
		this.evaluacions = evaluacions;
	}
	
	public String toString(){
		return this.grado.toString()+" "+
			   this.materia.toString();
	}
}

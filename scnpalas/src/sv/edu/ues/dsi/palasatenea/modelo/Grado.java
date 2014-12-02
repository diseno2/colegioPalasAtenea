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
 * Grado generated by hbm2java
 */
@Entity
@Table(name = "grado", catalog = "scnpalas")
public class Grado implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private Grado gradoByGrado1;
	private Grado gradoByGrado2;
	private String grado;
	/*private Set<Evaluacion> evaluacions = new HashSet<Evaluacion>(0);
	private Set<Seccion> seccions = new HashSet<Seccion>(0);
	private Set<GradoMateria> gradoMaterias = new HashSet<GradoMateria>(0);
	private Set<Grado> gradosForGrado1 = new HashSet<Grado>(0);
	private Set<Alumno> alumnosForGradoAprobado = new HashSet<Alumno>(0);
	private Set<Grado> gradosForGrado2 = new HashSet<Grado>(0);
	private Set<Alumno> alumnosForGradoActual = new HashSet<Alumno>(0);*/

	public Grado() {
		this.ident = 0;
		this.grado = "";
	}

	public Grado(String grado) {
		this.grado = grado;
	}

	public Grado(Grado gradoByGrado1, Grado gradoByGrado2, String grado/*,
			Set<Evaluacion> evaluacions, Set<Seccion> seccions,
			Set<GradoMateria> gradoMaterias, Set<Grado> gradosForGrado1,
			Set<Alumno> alumnosForGradoAprobado, Set<Grado> gradosForGrado2,
			Set<Alumno> alumnosForGradoActual*/) {
		this.gradoByGrado1 = gradoByGrado1;
		this.gradoByGrado2 = gradoByGrado2;
		this.grado = grado;
		/*this.evaluacions = evaluacions;
		this.seccions = seccions;
		this.gradoMaterias = gradoMaterias;
		this.gradosForGrado1 = gradosForGrado1;
		this.alumnosForGradoAprobado = alumnosForGradoAprobado;
		this.gradosForGrado2 = gradosForGrado2;
		this.alumnosForGradoActual = alumnosForGradoActual;*/
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
	@JoinColumn(name = "grado1")
	public Grado getGradoByGrado1() {
		return this.gradoByGrado1;
	}

	public void setGradoByGrado1(Grado gradoByGrado1) {
		this.gradoByGrado1 = gradoByGrado1;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "grado2")
	public Grado getGradoByGrado2() {
		return this.gradoByGrado2;
	}

	public void setGradoByGrado2(Grado gradoByGrado2) {
		this.gradoByGrado2 = gradoByGrado2;
	}

	@Column(name = "grado", nullable = false, length = 45)
	public String getGrado() {
		return this.grado;
	}

	public void setGrado(String grado) {
		this.grado = grado;
	}

	/*@OneToMany(fetch = FetchType.EAGER, mappedBy = "grado")
	public Set<Evaluacion> getEvaluacions() {
		return this.evaluacions;
	}

	public void setEvaluacions(Set<Evaluacion> evaluacions) {
		this.evaluacions = evaluacions;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "grado")
	public Set<Seccion> getSeccions() {
		return this.seccions;
	}

	public void setSeccions(Set<Seccion> seccions) {
		this.seccions = seccions;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "grado")
	public Set<GradoMateria> getGradoMaterias() {
		return this.gradoMaterias;
	}

	public void setGradoMaterias(Set<GradoMateria> gradoMaterias) {
		this.gradoMaterias = gradoMaterias;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "gradoByGrado1")
	public Set<Grado> getGradosForGrado1() {
		return this.gradosForGrado1;
	}

	public void setGradosForGrado1(Set<Grado> gradosForGrado1) {
		this.gradosForGrado1 = gradosForGrado1;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "gradoByGradoAprobado")
	public Set<Alumno> getAlumnosForGradoAprobado() {
		return this.alumnosForGradoAprobado;
	}

	public void setAlumnosForGradoAprobado(Set<Alumno> alumnosForGradoAprobado) {
		this.alumnosForGradoAprobado = alumnosForGradoAprobado;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "gradoByGrado2")
	public Set<Grado> getGradosForGrado2() {
		return this.gradosForGrado2;
	}

	public void setGradosForGrado2(Set<Grado> gradosForGrado2) {
		this.gradosForGrado2 = gradosForGrado2;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "gradoByGradoActual")
	public Set<Alumno> getAlumnosForGradoActual() {
		return this.alumnosForGradoActual;
	}

	public void setAlumnosForGradoActual(Set<Alumno> alumnosForGradoActual) {
		this.alumnosForGradoActual = alumnosForGradoActual;
	}*/

	public String toString(){
		return this.grado;
	}
}

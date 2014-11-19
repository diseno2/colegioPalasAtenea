package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Seccion generated by hbm2java
 */
@Entity
@Table(name = "seccion", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Seccion.findByAll", query = "SELECT c FROM Seccion c "),
	@NamedQuery(name = "Seccion.findByIdent", query = "SELECT c FROM Seccion c WHERE ident = :id")
})
public class Seccion implements java.io.Serializable {

	private Integer ident;
	private Grado grado;
	private Periodo periodo;
	private Docente docente;
	private int inscritos;
	private String estado;
	private String seccion;
	private Set<Matricula> matriculas = new HashSet<Matricula>(0);

	public Seccion() {
	}

	public Seccion(Grado grado, Periodo periodo, Docente docente,
			int inscritos, String estado) {
		this.grado = grado;
		this.periodo = periodo;
		this.docente = docente;
		this.inscritos = inscritos;
		this.estado = estado;
	}

	public Seccion(Grado grado, Periodo periodo, Docente docente,
			int inscritos, String estado, Set<Matricula> matriculas) {
		this.grado = grado;
		this.periodo = periodo;
		this.docente = docente;
		this.inscritos = inscritos;
		this.estado = estado;
		this.matriculas = matriculas;
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
	@JoinColumn(name = "periodo", nullable = false)
	public Periodo getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "docente", nullable = false)
	public Docente getDocente() {
		return this.docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	@Column(name = "inscritos", nullable = false)
	public int getInscritos() {
		return this.inscritos;
	}

	public void setInscritos(int inscritos) {
		this.inscritos = inscritos;
	}

	@Column(name = "estado", nullable = false, length = 1)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "seccion")
	public Set<Matricula> getMatriculas() {
		return this.matriculas;
	}

	public void setMatriculas(Set<Matricula> matriculas) {
		this.matriculas = matriculas;
	}

	@Column(name = "seccion", nullable = false, length = 1)
	public String getSeccion() {
		return seccion;
	}
	
	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}
	
	public String toString(){
		return this.grado.toString()+" "+
			   this.seccion+" "+
			   this.periodo.toString()+" "+
			   this.docente.toString();
	}

}

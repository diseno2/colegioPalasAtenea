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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Materia generated by hbm2java
 */
@Entity
@Table(name = "materia", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Materia.findByAll", query = "SELECT c FROM Materia c "),
	@NamedQuery(name = "Materia.findByIdent", query = "SELECT c FROM Materia c WHERE ident = :id")
})
public class Materia implements java.io.Serializable {

	private Integer ident;
	private String descripcion;
	private String activa;
	private Set<Nota> notas = new HashSet<Nota>(0);
	private Set<GradoMateria> gradoMaterias = new HashSet<GradoMateria>(0);

	public Materia() {
		this.ident = 0;
		this.descripcion = "";
		this.activa = "S";
	}

	public Materia(String descripcion, String activa) {
		this.descripcion = descripcion;
		this.activa = activa;
	}

	public Materia(String descripcion, String activa, Set<Nota> notas,
			Set<GradoMateria> gradoMaterias) {
		this.descripcion = descripcion;
		this.activa = activa;
		this.notas = notas;
		this.gradoMaterias = gradoMaterias;
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

	@Column(name = "descripcion", nullable = false, length = 45)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "activa", nullable = false, length = 1)
	public String getActiva() {
		return this.activa;
	}

	public void setActiva(String activa) {
		this.activa = activa;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "materia")
	public Set<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(Set<Nota> notas) {
		this.notas = notas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "materia")
	public Set<GradoMateria> getGradoMaterias() {
		return this.gradoMaterias;
	}

	public void setGradoMaterias(Set<GradoMateria> gradoMaterias) {
		this.gradoMaterias = gradoMaterias;
	}
	
	public String toString(){
		return this.descripcion;
	}
}

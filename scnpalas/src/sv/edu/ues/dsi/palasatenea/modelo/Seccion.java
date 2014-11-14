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
	private String grado;
	private String seccion;
	private Set<Grado> grados = new HashSet<Grado>(0);

	public Seccion() {
		this.ident = 0;
		this.grado = "";
		this.seccion = "";
	}

	public Seccion(String grado, String seccion) {
		this.grado = grado;
		this.seccion = seccion;
	}

	public Seccion(String grado, String seccion, Set<Grado> grados) {
		this.grado = grado;
		this.seccion = seccion;
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

	@Column(name = "grado", nullable = false, length = 45)
	public String getGrado() {
		return this.grado;
	}

	public void setGrado(String grado) {
		this.grado = grado;
	}

	@Column(name = "seccion", nullable = false, length = 45)
	public String getSeccion() {
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "seccion")
	public Set<Grado> getGrados() {
		return this.grados;
	}

	public void setGrados(Set<Grado> grados) {
		this.grados = grados;
	}

}

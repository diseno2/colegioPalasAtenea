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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Periodo generated by hbm2java
 */
@Entity
@Table(name = "periodo", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Periodo.findByAll", query = "SELECT c FROM Periodo c "),
	@NamedQuery(name = "Periodo.findByIdent", query = "SELECT c FROM Periodo c WHERE ident = :id")
})
public class Periodo implements java.io.Serializable {

	private Integer ident;
	private int anio;
	private Date inicio;
	private Date fin;
	private Set<Nota> notas = new HashSet<Nota>(0);
	private Set<Grado> grados = new HashSet<Grado>(0);

	public Periodo() {
	}

	public Periodo(int anio, Date inicio, Date fin) {
		this.anio = anio;
		this.inicio = inicio;
		this.fin = fin;
	}

	public Periodo(int anio, Date inicio, Date fin, Set<Nota> notas,
			Set<Grado> grados) {
		this.anio = anio;
		this.inicio = inicio;
		this.fin = fin;
		this.notas = notas;
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

	@Column(name = "anio", nullable = false)
	public int getAnio() {
		return this.anio;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "inicio", nullable = false, length = 10)
	public Date getInicio() {
		return this.inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fin", nullable = false, length = 10)
	public Date getFin() {
		return this.fin;
	}

	public void setFin(Date fin) {
		this.fin = fin;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "periodo")
	public Set<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(Set<Nota> notas) {
		this.notas = notas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "periodo")
	public Set<Grado> getGrados() {
		return this.grados;
	}

	public void setGrados(Set<Grado> grados) {
		this.grados = grados;
	}

}

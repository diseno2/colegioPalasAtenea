package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-21-2014 05:34:49 PM by Hibernate Tools 4.0.0

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
 * Subperiodo generated by hbm2java
 */
@Entity
@Table(name = "subperiodo", catalog = "scnpalas")
public class SubPeriodo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private Periodo periodo;
	private String descripcion;
	private String estado;
	private Date inicio;
	private Date fin;

	public SubPeriodo() {
		this.ident = 0;
		this.descripcion = "";
		this.estado = "E"; 
	}

	public SubPeriodo(Periodo periodo, String descripcion, String estado,
			Date inicio, Date fin) {
		this.periodo = periodo;
		this.descripcion = descripcion;
		this.estado = estado;
		this.inicio = inicio;
		this.fin = fin;
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
	@JoinColumn(name = "periodo", nullable = false)
	public Periodo getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	@Column(name = "descripcion", nullable = false, length = 45)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "estado", nullable = false, length = 1)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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

	public String toString(){
		return descripcion;
	}
}

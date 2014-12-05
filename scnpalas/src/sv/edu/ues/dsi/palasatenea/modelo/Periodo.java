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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Periodo generated by hbm2java
 */
@Entity
@Table(name = "periodo", catalog = "scnpalas")
public class Periodo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private int anio;
	private Date inicio;
	private Date fin;
	private String estado;

	public Periodo() {
		this.ident = 0;
		
		Calendar fecha = new GregorianCalendar();
		this.anio = fecha.get(Calendar.YEAR);
		
		fecha = new GregorianCalendar(this.anio, Calendar.JANUARY,1);
		this.inicio = fecha.getTime();
		
		fecha = new GregorianCalendar(this.anio, Calendar.DECEMBER,31);
		this.fin = fecha.getTime();
		
		this.estado = "E"; 
	}

	public Periodo(int anio, Date inicio, Date fin) {
		this.anio = anio;
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
	
	@Column(name = "estado", length = 1)
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String toString(){
		return Integer.toString(anio);
	}
}

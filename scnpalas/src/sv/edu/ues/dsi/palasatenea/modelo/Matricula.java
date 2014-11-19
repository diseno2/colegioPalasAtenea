package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Matricula generated by hbm2java
 */
@Entity
@Table(name = "matricula", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Matricula.findByAll", query = "SELECT c FROM Matricula c "),
	@NamedQuery(name = "Matricula.findByIdent", query = "SELECT c FROM Matricula c WHERE ident = :id")
})
public class Matricula implements java.io.Serializable {

	private Integer ident;
	private Alumno alumno;
	private Seccion seccion;
	private String estado;
	private Date fecha;

	public Matricula() {
		this.ident = 0;
	}

	public Matricula(Alumno alumno, Seccion seccion, String estado, Date fecha) {
		this.alumno = alumno;
		this.seccion = seccion;
		this.estado = estado;
		this.fecha = fecha;
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
	@JoinColumn(name = "alumno", nullable = false)
	public Alumno getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "seccion", nullable = false)
	public Seccion getSeccion() {
		return this.seccion;
	}

	public void setSeccion(Seccion seccion) {
		this.seccion = seccion;
	}

	@Column(name = "estado", nullable = false, length = 1)
	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", nullable = false, length = 10)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public String toString(){
		return this.alumno.toString()+" "+
			   this.seccion.toString();
	}
}

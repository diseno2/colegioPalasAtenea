package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-21-2014 05:34:49 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Familiares generated by hbm2java
 */
@Entity
@Table(name = "familiares", catalog = "scnpalas")
public class Familiares implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer ident;
	private Alumno alumno;
	private Familiar familiar;
	private String parentesco;

	public Familiares() {
		this.ident = 0;
	}

	public Familiares(Alumno alumno, Familiar familiar, String parentesco) {
		this.alumno = alumno;
		this.familiar = familiar;
		this.parentesco = parentesco;
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
	@JoinColumn(name = "familiar", nullable = false)
	public Familiar getFamiliar() {
		return this.familiar;
	}

	public void setFamiliar(Familiar familiar) {
		this.familiar = familiar;
	}

	@Column(name = "parentesco", nullable = false, length = 1)
	public String getParentesco() {
		return this.parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public String toString(){
		return this.alumno.toString()+" "+
			   this.familiar.toString()+" "+
			   this.parentesco;
	}
}

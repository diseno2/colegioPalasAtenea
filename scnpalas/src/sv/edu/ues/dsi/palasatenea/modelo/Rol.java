package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-21-2014 05:34:49 PM by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Rol generated by hbm2java
 */
@Entity
@Table(name = "rol", catalog = "scnpalas")
public class Rol implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private int ident;
	private String descripcion;
	private String tipo;

	public Rol() {
		this.ident = 0;
	}

	public Rol(int ident, String tipo) {
		this.ident = ident;
		this.tipo = tipo;
	}

	public Rol(int ident, String descripcion, String tipo) {
		this.ident = ident;
		this.descripcion = descripcion;
		this.tipo = tipo;
	}

	@Id
	@Column(name = "Ident", unique = true, nullable = false)
	public int getIdent() {
		return this.ident;
	}

	public void setIdent(int ident) {
		this.ident = ident;
	}

	@Column(name = "Descripcion", length = 25)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "tipo", nullable = false, length = 45)
	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String toString(){
		return this.descripcion;
	}
}

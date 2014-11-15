package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * Rol generated by hbm2java
 */
@Entity
@Table(name = "rol", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "Rol.findByAll", query = "SELECT c FROM Rol c "),
	@NamedQuery(name = "Rol.findByIdent", query = "SELECT c FROM Rol c WHERE ident = :id")
})
public class Rol implements java.io.Serializable {

	private int ident;
	private String descripcion;
	private Set<RolOpciones> rolOpcioneses = new HashSet<RolOpciones>(0);
	private Set<Usuario> usuarios = new HashSet<Usuario>(0);

	public Rol() {
	}

	public Rol(int ident) {
		this.ident = ident;
	}

	public Rol(int ident, String descripcion, Set<RolOpciones> rolOpcioneses,
			Set<Usuario> usuarios) {
		this.ident = ident;
		this.descripcion = descripcion;
		this.rolOpcioneses = rolOpcioneses;
		this.usuarios = usuarios;
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

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "rol")
	public Set<RolOpciones> getRolOpcioneses() {
		return this.rolOpcioneses;
	}

	public void setRolOpcioneses(Set<RolOpciones> rolOpcioneses) {
		this.rolOpcioneses = rolOpcioneses;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "rol")
	public Set<Usuario> getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
	public String toString(){
		return this.descripcion;
	}
}

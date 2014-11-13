package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 11-12-2014 09:30:17 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 * LogDetalle generated by hbm2java
 */
@Entity
@Table(name = "log_detalle", catalog = "scnpalas")
@NamedQueries({
	@NamedQuery(name = "LogDetalle.findByAll", query = "SELECT c FROM LogDetalle c "),
	@NamedQuery(name = "LogDetalle.findByIdent", query = "SELECT c FROM LogDetalle c WHERE ident = :id")
})
public class LogDetalle implements java.io.Serializable {

	private Integer ident;
	private Log log;
	private String campo;
	private String valorOriginal;
	private String valorModificado;

	public LogDetalle() {
	}

	public LogDetalle(Log log, String campo, String valorOriginal,
			String valorModificado) {
		this.log = log;
		this.campo = campo;
		this.valorOriginal = valorOriginal;
		this.valorModificado = valorModificado;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "log", nullable = false)
	public Log getLog() {
		return this.log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	@Column(name = "campo", nullable = false, length = 45)
	public String getCampo() {
		return this.campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}

	@Column(name = "valor_original", nullable = false, length = 1000)
	public String getValorOriginal() {
		return this.valorOriginal;
	}

	public void setValorOriginal(String valorOriginal) {
		this.valorOriginal = valorOriginal;
	}

	@Column(name = "valor_modificado", nullable = false, length = 1000)
	public String getValorModificado() {
		return this.valorModificado;
	}

	public void setValorModificado(String valorModificado) {
		this.valorModificado = valorModificado;
	}

}

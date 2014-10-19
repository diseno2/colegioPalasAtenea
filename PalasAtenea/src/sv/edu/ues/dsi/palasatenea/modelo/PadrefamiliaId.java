package sv.edu.ues.dsi.palasatenea.modelo;

// Generated 10-18-2014 06:33:11 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * PadrefamiliaId generated by hbm2java
 */
@Embeddable
public class PadrefamiliaId implements java.io.Serializable {

	private String ucarnetusuario;
	private String pacarnetpa;

	public PadrefamiliaId() {
	}

	public PadrefamiliaId(String ucarnetusuario, String pacarnetpa) {
		this.ucarnetusuario = ucarnetusuario;
		this.pacarnetpa = pacarnetpa;
	}

	@Column(name = "UCARNETUSUARIO", nullable = false, length = 8)
	public String getUcarnetusuario() {
		return this.ucarnetusuario;
	}

	public void setUcarnetusuario(String ucarnetusuario) {
		this.ucarnetusuario = ucarnetusuario;
	}

	@Column(name = "PACARNETPA", nullable = false, length = 8)
	public String getPacarnetpa() {
		return this.pacarnetpa;
	}

	public void setPacarnetpa(String pacarnetpa) {
		this.pacarnetpa = pacarnetpa;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PadrefamiliaId))
			return false;
		PadrefamiliaId castOther = (PadrefamiliaId) other;

		return ((this.getUcarnetusuario() == castOther.getUcarnetusuario()) || (this
				.getUcarnetusuario() != null
				&& castOther.getUcarnetusuario() != null && this
				.getUcarnetusuario().equals(castOther.getUcarnetusuario())))
				&& ((this.getPacarnetpa() == castOther.getPacarnetpa()) || (this
						.getPacarnetpa() != null
						&& castOther.getPacarnetpa() != null && this
						.getPacarnetpa().equals(castOther.getPacarnetpa())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getUcarnetusuario() == null ? 0 : this.getUcarnetusuario()
						.hashCode());
		result = 37
				* result
				+ (getPacarnetpa() == null ? 0 : this.getPacarnetpa()
						.hashCode());
		return result;
	}

}

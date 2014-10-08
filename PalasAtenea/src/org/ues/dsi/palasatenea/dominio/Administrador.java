package org.ues.dsi.palasatenea.dominio;

public class Administrador {
	private String uCarnetUsuario;
	private String aCarnet;
	
	public String getuCarnetUsuario() {
		return uCarnetUsuario;
	}
	
	public void setuCarnetUsuario(String uCarnetUsuario) {
		this.uCarnetUsuario = uCarnetUsuario;
	}
	
	public String getaCarnet() {
		return aCarnet;
	}
	
	public void setaCarnet(String aCarnet) {
		this.aCarnet = aCarnet;
	}

	public Administrador(String uCarnetUsuario, String aCarnet) {
		super();
		this.uCarnetUsuario = uCarnetUsuario;
		this.aCarnet = aCarnet;
	}

	public Administrador() {
		super();
	}
	
}

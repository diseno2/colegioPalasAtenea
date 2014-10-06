package sv.edu.ues.igf115.asignatura.dominio;

public class Asignatura {
private String nombre ;
private int alumnosPorAula ;
private int alumnosMatriculados ;
public Asignatura(String nombre, int alumnosPorAula) {
this.nombre = nombre ;
this.alumnosPorAula = alumnosPorAula ;
alumnosMatriculados = 0 ;
}
public String getNombre() {
return nombre;
}
public void matricula(int alumnosAMatricular) {
this.alumnosMatriculados += alumnosAMatricular ;
}
public int getNumeroAulas() {
if (alumnosMatriculados%alumnosPorAula == 0)
return (alumnosMatriculados/alumnosPorAula) ;
else
return (alumnosMatriculados/alumnosPorAula) + 1 ;
}
}
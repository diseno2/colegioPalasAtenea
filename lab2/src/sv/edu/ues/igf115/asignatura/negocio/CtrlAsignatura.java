package sv.edu.ues.igf115.asignatura.negocio;
import sv.edu.ues.igf115.asignatura.dominio.*;
public class CtrlAsignatura { 
public int iniciaAsignatura(String nombre, int numAlumnosPorAula, int numAlumnosIniciar) { 
Asignatura asignatura = new Asignatura(nombre, numAlumnosPorAula) ; 
asignatura.matricula(numAlumnosIniciar) ; 
return asignatura.getNumeroAulas() ; 
}
}

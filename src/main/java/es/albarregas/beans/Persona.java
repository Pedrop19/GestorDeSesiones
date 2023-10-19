/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package es.albarregas.beans;

import es.albarregas.enums.tipo_Identificacion;
import java.util.Date;

/**
 *
 * @author Pedro Lazaro
 */
public class Persona {
    private int id;
    private String nombre;
    private Date fecha;
    private tipo_Identificacion tipo_identificacion;
    private String identificacion;

    public Persona(int id, String nombre, Date fecha, tipo_Identificacion tipo_identificacion,
            String identificacion) {
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
        this.tipo_identificacion = tipo_identificacion;
        this.identificacion = identificacion;
    }

    public Persona() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public tipo_Identificacion getTipo_identificacion() {
        return tipo_identificacion;
    }

    public void setTipo_identificacion(tipo_Identificacion tipo_identificacion) {
        this.tipo_identificacion = tipo_identificacion;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }
}

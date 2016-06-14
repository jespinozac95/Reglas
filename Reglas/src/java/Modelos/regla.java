/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Josue
 */
public class regla {
    private int id;
    private String nombre;
    private String definicionFormal;
    private String definicionInformal;
    private String tipo;
    private String sql;
    private String entidad;
    private String atributo;

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

    public String getDefinicionFormal() {
        return definicionFormal;
    }

    public void setDefinicionFormal(String definicionFormal) {
        this.definicionFormal = definicionFormal;
    }

    public String getDefinicionInformal() {
        return definicionInformal;
    }

    public void setDefinicionInformal(String definicionInformal) {
        this.definicionInformal = definicionInformal;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String getEntidad() {
        return entidad;
    }

    public void setEntidad(String entidad) {
        this.entidad = entidad;
    }

    public String getAtributo() {
        return atributo;
    }

    public void setAtributo(String atributo) {
        this.atributo = atributo;
    }
    
    
}

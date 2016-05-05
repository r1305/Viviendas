
package Entity;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.constructorParameterOrderType;


public class Catalogo {
    private String Codigo;
    private String Marca;
    private String Modelo;
    private String Tipo;
    private String Oferta;
    private String Es4G;
    private String Descripcion;

    public Catalogo() {
    }
    
    
    
    public Catalogo(String Codigo, String Marca, String Modelo , String Tipo, String Oferta, String Es4G, String Descripcion){
        this.Codigo = Codigo;
        this.Marca = Marca;
        this.Modelo = Modelo;
        this.Tipo = Tipo;
        this.Oferta = Oferta;
        this.Es4G = Es4G;
        this.Descripcion = Descripcion;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getOferta() {
        return Oferta;
    }

    public void setOferta(String Oferta) {
        this.Oferta = Oferta;
    }

    public String getEs4G() {
        return Es4G;
    }

    public void setEs4G(String Es4G) {
        this.Es4G = Es4G;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
}



package model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author eddunic
 */
@Entity
public class Doador extends Usuario {
    


    public Doador() {
    }

    public Doador(String email, String nome, String senha, String cpf_cnpj, String dataNasc, String telefone, String bairro, byte[] foto) {
	super(email, nome, senha, cpf_cnpj, dataNasc, telefone, bairro, foto);
    }    

}
package br.com.fiap.login.model;

import br.com.fiap.login.util.CriptografiaUtils;

public class Usuario {

    private int codigo;
    private String nome;
    private String apelido;
    private String email;
    private String celular;
    private String cpf;
    private String senha;
    private double saldo;

    public Usuario() {
    }

    public Usuario(int codigo) {
        this.codigo = codigo;
    }

    public Usuario(String email) {
        this.email = email;
    }

    public Usuario(String email, String senha) {
        super();
        this.email = email;
        setSenha(senha);
    }

    public Usuario(int codigo, String nome, String apelido, String email, String celular, String cpf, String senha) {
        this.codigo = codigo;
        this.nome = nome;
        this.apelido = apelido;
        this.email = email;
        this.celular = celular;
        this.cpf = cpf;
        this.senha = senha;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        try {
            this.senha = CriptografiaUtils.criptografar(senha);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

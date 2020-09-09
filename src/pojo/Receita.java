package pojo;

import java.time.LocalDate;

public class Receita {
	String descricao = "";
	LocalDate data;
	String tipo = "";
	double valor;
	int idReceita;
	double valorSoma;
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public int getIdReceita() {
		return idReceita;
	}
	public void setIdReceita(int idReceita) {
		this.idReceita = idReceita;
	}
	public double getValorSoma() {
		return valorSoma;
	}
	public void setValorSoma(double valorSoma) {
		this.valorSoma = valorSoma;
	}
	
	

}

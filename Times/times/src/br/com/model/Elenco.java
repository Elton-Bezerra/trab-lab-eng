package br.com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name="idElenco", sequenceName="seqElenco")
public class Elenco {
	@Id
	@GeneratedValue(generator="idElenco", strategy = GenerationType.IDENTITY)
	private int id;
	private String nome;
	private String posicao;
	@ManyToOne
	@JoinColumn(name="idTime")
	private Times time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getPosicao() {
		return posicao;
	}
	public void setPosicao(String posicao) {
		this.posicao = posicao;
	}
	public Times getTime() {
		return time;
	}
	public void setTime(Times time) {
		this.time = time;
	}
	
	
}

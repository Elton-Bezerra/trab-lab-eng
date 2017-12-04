package br.com.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@SequenceGenerator(name="idTime",sequenceName="seqTimes")
public class Times {
	@Id
	@GeneratedValue(generator="idTime", strategy=GenerationType.IDENTITY)
	private int id;
	private String nome;
	@Temporal(TemporalType.DATE)
	private Date dataFundacao;
	@Column(columnDefinition = "decimal(15,2)")
	private double patrimonio;
	private String estadio;
	private int qtdSocios;
	private String cidade;
	@OneToMany(mappedBy="time", targetEntity= Elenco.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<String> elenco;
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
	public Date getDataFundacao() {
		return dataFundacao;
	}
	public void setDataFundacao(Date dataFundacao) {
		this.dataFundacao = dataFundacao;
	}
	public double getPatrimonio() {
		return patrimonio;
	}
	public void setPatrimonio(double patrimonio) {
		this.patrimonio = patrimonio;
	}
	public int getQtdSocios() {
		return qtdSocios;
	}
	public void setQtdSocios(int qtdSocios) {
		this.qtdSocios = qtdSocios;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstadio() {
		return estadio;
	}
	public void setEstadio(String estadio) {
		this.estadio = estadio;
	} 
	
	
	
}

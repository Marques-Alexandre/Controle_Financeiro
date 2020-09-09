package banco_de_dados;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

import pojo.Receita;

public class ReceitaDao {
	
	public void inserir (Receita r) {
		Conexao con = new Conexao();
		try {
			String sql = "INSERT INTO receita "
					+ "(descricao, dataReceita, tipo, valor)"
					+ "VALUES  (?, ?, ?, ?)";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setString(1, r.getDescricao());
			prep.setDate(2, java.sql.Date.valueOf(r.getData()));
			prep.setString(3, r.getTipo());
			prep.setDouble(4, r.getValor());
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		con.desconecta();
	}
	public LinkedList<Receita> listar(){
		Conexao con = new Conexao();
		LinkedList<Receita> lista = new LinkedList<Receita>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			String sql = "SELECT * FROM receita";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Receita r = new Receita();
				r.setDescricao(res.getString("descricao"));
				r.setData(LocalDate.parse(res.getString("dataReceita"), formatter));
				r.setTipo(res.getString("tipo"));
				r.setValor(res.getDouble("valor"));
				r.setIdReceita(res.getInt("idreceita"));
				lista.add(r);
				
			}
			res.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		
		return lista;
	}
	public void excluir(int idReceita) {
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM receita WHERE idreceita = ?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setInt(1, idReceita);
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	public void alterar (Receita r) {
		Conexao con = new Conexao();
		try {
			String sql = "UPDATE receita SET descricao=?, dataReceita=?, tipo=?, valor=? WHERE idreceita=?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setString(1, r.getDescricao());
			prep.setDate(2, java.sql.Date.valueOf(r.getData()));
			prep.setString(3, r.getTipo());
			prep.setDouble(4, r.getValor());
			prep.setInt(5, r.getIdReceita());
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	public Receita consultar(int idreceita) {
		Receita r = new Receita();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM receita WHERE idreceita = " + idreceita;
			Statement sta = con.getConexao().createStatement();
			ResultSet res = sta.executeQuery(sql);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			if(res.next()) {
				r.setDescricao(res.getString("descricao"));
				r.setData(LocalDate.parse(res.getString("dataReceita"), formatter));
				r.setTipo(res.getString("tipo"));
				r.setValor(res.getDouble("valor"));
				r.setIdReceita(res.getInt("idreceita"));
			}
			res.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return r;
	}
	public Receita somarReceita(Receita r) {
		Conexao con = new Conexao();
		try {
			String sql = "SELECT SUM(valor) AS somaReceita FROM receita";
			Statement sta = con.getConexao().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if(res.next()) {
				r.setValorSoma(res.getDouble("somaReceita"));
			}
			res.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return r;
	}

}

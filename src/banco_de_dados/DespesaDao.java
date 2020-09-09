package banco_de_dados;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

import pojo.Despesa;
import pojo.Receita;

public class DespesaDao {
	
	public void inserir(Despesa d) {
		Conexao con = new Conexao();
		try {
			String sql = "INSERT INTO despesa "
					+ "(descricao, dataDespesa, tipo, valor)"
					+ "VALUES (?, ?, ?, ?)";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setString(1, d.getDescricao());
			prep.setDate(2, java.sql.Date.valueOf(d.getData()));
			prep.setString(3, d.getTipo());
			prep.setDouble(4, d.getValor());
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	public LinkedList<Despesa> listar(){
		Conexao con = new Conexao();
		LinkedList<Despesa> lista = new LinkedList<Despesa>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			String sql = "SELECT * FROM despesa";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Despesa d = new Despesa();
				d.setDescricao(res.getString("descricao"));
				d.setData(LocalDate.parse(res.getString("dataDespesa"), formatter));
				d.setTipo(res.getString("tipo"));
				d.setValor(res.getDouble("valor"));
				d.setIdDespesa(res.getInt("iddespesa"));
				lista.add(d);
			}
			res.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		
		return lista;
	}
	public void excluir(int idDespesa) {
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM despesa WHERE iddespesa = ?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setInt(1, idDespesa);
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	public void alterar (Despesa d) {
		Conexao con = new Conexao();
		try {
			String sql = "UPDATE despesa SET descricao=?, dataDespesa=?, tipo=?, valor=? WHERE iddespesa=?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setString(1, d.getDescricao());
			prep.setDate(2, java.sql.Date.valueOf(d.getData()));
			prep.setString(3, d.getTipo());
			prep.setDouble(4, d.getValor());
			prep.setInt(5, d.getIdDespesa());
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	public Despesa consultar(int iddespesa) {
		Despesa d = new Despesa();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM despesa WHERE iddespesa = " + iddespesa;
			Statement sta = con.getConexao().createStatement();
			ResultSet res = sta.executeQuery(sql);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			if(res.next()) {
				d.setDescricao(res.getString("descricao"));
				d.setData(LocalDate.parse(res.getString("dataDespesa"), formatter));
				d.setTipo(res.getString("tipo"));
				d.setValor(res.getDouble("valor"));
				d.setIdDespesa(res.getInt("iddespesa"));
			}
			res.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return d;
	}
	public Despesa somarDespesa(Despesa d) {
		Conexao con = new Conexao();
		try {
			String sql = "SELECT SUM(valor) AS somaDespesa FROM despesa";
			Statement sta = con.getConexao().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if(res.next()) {
				d.setValorSoma(res.getDouble("somaDespesa"));
			}
			res.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return d;
	}


}

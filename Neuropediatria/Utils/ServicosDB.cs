using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Utils
{
    public class ServicosDB
    {
        private static ServicosDB instancia;
        public static ServicosDB Instancia
        {
            get
            {
                if (instancia == null)
                    instancia = new ServicosDB();

                return instancia;
            }
        }

        private ServicosDB()
        {

        }

        public static string StringConexao
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            }
        }

        public SqlConnection CriarConexao()
        {
            SqlConnection con = new SqlConnection(StringConexao);
            con.Open();
            return con;
        }

        public SqlCommand CriarComando(string strCmd)
        {
            return CriarComando(CriarConexao(), strCmd);
        }

        public SqlCommand CriarComando(SqlConnection con, string strCmd)
        {
            SqlCommand cmd = new SqlCommand(strCmd, con);
            return cmd;
        }

        public SqlDataReader ExecutarSelect(string oSelect)
        {
            SqlCommand cmd = CriarComando(oSelect);
            return cmd.ExecuteReader();
        }
        public int ExecutarProcedure(string procedure, Dictionary<string, dynamic> parameters )
        {
            SqlCommand cmd = CriarComando(procedure);
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (var parameter in parameters)
            {
                cmd.Parameters.AddWithValue(parameter.Key, parameter.Value);
            }

            return cmd.ExecuteNonQuery();
        }

        public List<Dictionary<string, string>> ExecutarSelectRetornList(string oSelect)
        {
            List<Dictionary<string, string>> listaGenerica = new List<Dictionary<string, string>>();

            SqlCommand cmd = CriarComando(oSelect);
            SqlDataReader sqlReader = cmd.ExecuteReader();

            if (sqlReader.HasRows)
            {
                while (sqlReader.Read())
                {
                    var colunas = new Dictionary<string, string>();
                    for (int i = 0; i < sqlReader.FieldCount; i++)
                        colunas.Add(sqlReader.GetName(i), sqlReader[i].ToString());

                    listaGenerica.Add(colunas);
                }
            }

            return listaGenerica;
        }

        public int ExecutarAtualizacao(string oComando)
        {
            SqlCommand cmd = CriarComando(oComando);
            return cmd.ExecuteNonQuery();
        }
    }
}
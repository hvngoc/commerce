using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// Summary description for DataProvider
/// </summary>
public class DataProvider
{
    private static SqlConnection _con = null;

	static DataProvider()
	{
		//Get connection string from web.conf or app.conf
        string strConnection = ConfigurationManager.ConnectionStrings["ConnectionStringShoping"].ConnectionString;
        _con = new SqlConnection(strConnection);
	}

    public static DataTable ExecuteQuery(string strQuery)
    {
        DataTable resTable = new DataTable();

        try
        {
            _con.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(strQuery, _con);
            
            adapter.Fill(resTable);
        }
        catch (Exception ex)
        {
            throw new Exception("Loi khi thuc thi lenh SQL: " + ex.Message);
        }
        finally
        {
            _con.Close();
        }

        return resTable;
    }

    public static DataTable ExecuteStoreProc(string storeProcName, List<string> arrParameterName, List<object> arrParameterValue)
    {
        DataTable resTable = new DataTable();

        try
        {
            _con.Open();

            SqlCommand cmd = new SqlCommand(storeProcName, _con); 
            cmd.CommandType = CommandType.StoredProcedure;

            //Lay so parameter
            int N = arrParameterName.Count;
            for (int i = 0; i < N; i++)
            {
                SqlParameter sqlParam = new SqlParameter(arrParameterName[i], arrParameterValue[i]);
                cmd.Parameters.Add(sqlParam);
           }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(resTable);
        }
        catch (Exception ex)
        {
            throw new Exception("Loi khi thuc thi store procedure: " + ex.Message);
        }
        finally
        {
            _con.Close();
        }

        return resTable;
    }
}

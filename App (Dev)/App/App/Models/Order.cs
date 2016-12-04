using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace App.Models
{
    public class Order
    {
        public int transactionID { get; set; }
        public int docuID { get; set; }
        public int orderID { get; set; }
    }

    class orderManager
    {
            private DatabaseConnector db = new DatabaseConnector();

            public void saveOrder(Order temp)
            {
                    Order or = temp;
                    MySqlConnection conn = new MySqlConnection(db.getConnString());

                    MySqlDataAdapter adapter = new MySqlDataAdapter();

                    using(conn)
                    {
                            using(adapter)
                            {
                                    adapter.SelectCommand = new MySqlCommand("SELECT * FROM requestdocdb.order", conn);

                                    adapter.InsertCommand = new MySqlCommand("insert into requestdocdb.order"
                                                             + " (transactionID, docuID, orderID) "
                                                             + "VALUES (@transactionID, @docuID, @orderID)", conn);

                                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("transactionID", MySqlDbType.Int32, 11, "transactionID"));
                                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("docuID", MySqlDbType.Int32, 11, "docuID"));
                                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("orderID", MySqlDbType.Int32, 11, "orderID"));

                                    using (DataSet dataSet = new DataSet())
                                    {
                                        adapter.Fill(dataSet, "order");

                                        DataRow newRow = dataSet.Tables[0].NewRow();

                                        newRow["transactionID"] = or.transactionID;
                                        newRow["docuID"] = or.docuID;
                                        newRow["orderID"] = or.orderID;

                                        dataSet.Tables[0].Rows.Add(newRow);

                                        adapter.Update(dataSet, "order");
                                    }
                            }
                    }
            }

            //returns list of orders for that transaction
            public List<Order> getOrder(int transactionID)
            {
                    List<Order> listOr = new List<Order>();
                    MySqlConnection conn = null;

                    using (conn = new MySqlConnection(db.getConnString()))
                    {
                        conn.Open();
                        using (MySqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandText = "SELECT * FROM order WHERE transactionID LIKE '" + transactionID + "';";

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    Order or = new Models.Order();
                                    or.transactionID = reader.GetInt32(0);
                                    or.docuID = reader.GetInt32(1);
                                    or.orderID = reader.GetInt32(2);

                                    listOr.Add(or);
                                    or = new Models.Order();
                                }

                                if (!reader.HasRows)
                                {
                                    listOr = null;
                                }
                            }
                        }
                    }
                    
                    conn.Close();
                    return listOr;
            }
    }
}
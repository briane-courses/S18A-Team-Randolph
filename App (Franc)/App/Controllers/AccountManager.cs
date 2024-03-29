﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using App.Models;

namespace App.Controllers
{
    public class AccountManager
    {
        private DatabaseController db = new DatabaseController();

        public Account getAccount(string email, string password)
        {
            Account account = new Models.Account();
            MySqlConnection conn = null;

            using (conn = new MySqlConnection(db.getConnString()))
            {
                conn.Open();
                using (MySqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = "SELECT * FROM user WHERE email LIKE '" + email + "' and password like '" + password + "';";

                    //cmd.CommandText = "SELECT * FROM user WHERE userID LIKE '11425598';";
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            account.userID = reader.GetInt32(0);
                            account.lastName = reader.GetString(1);
                            account.firstName = reader.GetString(2);
                            account.middleName = reader.GetString(3);
                            account.gender = reader.GetChar(4);
                            account.birthYear = reader.GetInt32(5);
                            account.birthMonth = reader.GetInt32(6);
                            account.birthDay = reader.GetInt32(7);
                            account.citizenship = reader.GetString(8);
                            account.email = reader.GetString(13);
                            account.password = reader.GetString(15);
                        }

                        if (!reader.HasRows)
                        {
                            account = null;
                        }
                    }
                }
            }

           

            conn.Close();
            return account;
        }

        public void saveAccount(Account acc)
        {
            Account account = acc;
            MySqlConnection conn = new MySqlConnection(db.getConnString());
            
            MySqlDataAdapter adapter = new MySqlDataAdapter();



            using (conn)
            {
                using (adapter)
                {
                    adapter.SelectCommand = new MySqlCommand("SELECT * FROM requestdocdb.user", conn);

                    adapter.InsertCommand = new MySqlCommand("insert into requestdocdb.user"
                                                             + " (userID, lastName, firstName, middleName, gender, birthYear, birthMonth,"
                                                             + " birthDay, citizenship, placeOfBirth, currentAddress, phoneNo,"
                                                             + " alternatePhoneNo, email, alternateEmail, password) "  
                                                             + "VALUES (@userID, @lastName, @firstName, @middleName, @gender, @birthYear, @birthMonth, "
                                                             + "@birthDay, @citizenship, @placeOfBirth, @currentAddress, @phoneNo, "
                                                             + "@alternatePhoneNo, @email, @alternateEmail, @password)", conn);


                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("userID", MySqlDbType.Int32, 11, "userId"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("lastName", MySqlDbType.VarChar, 100, "lastName"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("firstName", MySqlDbType.VarChar, 100, "firstName"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("middleName", MySqlDbType.VarChar, 100, "middleName"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("gender", MySqlDbType.VarChar, 1, "gender"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("birthYear", MySqlDbType.Int32, 11, "birthYear"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("birthMonth", MySqlDbType.Int32, 11, "birthMonth"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("birthDay", MySqlDbType.Int32, 11, "birthDay"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("citizenship", MySqlDbType.VarChar, 100, "citizenship"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("placeOfBirth", MySqlDbType.VarChar, 500, "placeOfBirth"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("currentAddress", MySqlDbType.VarChar, 500, "currentAddress"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("phoneNo", MySqlDbType.VarChar, 50, "phoneNo"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("alternatePhoneNo", MySqlDbType.VarChar, 50, "alternatePhoneNo"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("email", MySqlDbType.VarChar, 100, "email"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("alternateEmail", MySqlDbType.VarChar, 100, "alternateEmail"));
                    adapter.InsertCommand.Parameters.Add(new MySqlParameter("password", MySqlDbType.VarChar, 100, "password"));

                    using (DataSet dataSet = new DataSet())
                    {
                        adapter.Fill(dataSet, "user");

                        Console.WriteLine("There are {0} rows in the table", dataSet.Tables[0].Rows.Count);

                        DataRow newRow = dataSet.Tables[0].NewRow();

                        newRow["userID"] = acc.userID;
                        newRow["lastName"] = acc.lastName;
                        newRow["firstName"] = acc.firstName;
                        newRow["middleName"] = acc.middleName;
                        newRow["gender"] = acc.gender;
                        newRow["birthYear"] = acc.birthYear;
                        newRow["birthMonth"] = acc.birthMonth;
                        newRow["birthDay"] = acc.birthDay;
                        newRow["citizenship"] = acc.citizenship;
                        newRow["placeOfBirth"] = acc.placeOfBirth;
                        newRow["currentAddress"] = acc.currentAddress;
                        newRow["phoneNo"] = acc.phoneNo;
                        newRow["alternatePhoneNo"] = acc.alternatePhoneNo;
                        newRow["email"] = acc.email;
                        newRow["alternateEmail"] = acc.alternateEmail;
                        newRow["password"] = acc.password;

                        dataSet.Tables[0].Rows.Add(newRow);

                        adapter.Update(dataSet, "user");
                    }
                }
            }

            /*
            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM requestdocdb.user", conn);

            MySqlCommandBuilder builder = new MySqlCommandBuilder(adapter);

            /*
            using (conn)
            {
                conn.Open();
                using (insert = conn.CreateCommand())
                {
                    insert.CommandText = " INSERT INTO user (userID, lastName, firstName, middleName, gender, birthYear, birthMonth,"
                                                        + " birthDate, citizenship, placeOfBirth, currentAddress, phoneNo,"
                                                        + " alternatePhoneNo, email, alternateEmail, password) " 
                                                        + "VALUES ( " + acc.userID + ", " + acc.lastName + ", " + acc.firstName + ", " + acc.middleName + ", " + acc.gender + ", " + acc.birthYear + ", " + acc.birthMonth + ","
                                                        + " " + acc.birthDay + ", " + acc.citizenship + ", " + acc.placeOfBirth + ", " + acc.currentAddress + ", " + acc.phoneNo + ","
                                                        + " " + acc.alternatePhoneNo + ", " + acc.email + ", " + acc.alternateEmail + ", " + acc.password + ") ";

                    adapter.InsertCommand = insert;
                    adapter.Update(dataset, "user");
                    dataset.AcceptChanges();
                }
            }
            */


            conn.Close();
        }
    }
}
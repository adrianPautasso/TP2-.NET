﻿using System;
using System.Collections.Generic;
using System.Text;
using Business.Entities;
using System.Data.SqlClient;
using System.Data;

namespace Data.Database
{
    public class PersonaAdapter : Adapter
    {
        public List<Persona> GetAll()
        {
            List<Persona> personas = new List<Persona>();
            this.OpenConnection();
            SqlCommand cmdPersonas = new SqlCommand("select * from personas", this.sqlConn);
            SqlDataReader drPersonas = cmdPersonas.ExecuteReader();
            while (drPersonas.Read())
            {
                Persona persona = new Persona();

                persona.ID = (int)drPersonas["id_persona"];
                persona.Nombre = (string)drPersonas["nombre"];
                persona.Apellido = (string)drPersonas["apellido"];
                persona.Direccion = (string)drPersonas["direccion"];
                persona.Email = (string)drPersonas["email"];
                persona.Telefono = (string)drPersonas["telefono"];
                persona.FechaNacimiento = (DateTime)drPersonas["fecha_nac"];
                persona.Legajo = (int)drPersonas["legajo"];
                persona.IDPlan = (int)drPersonas["id_plan"];
                persona.IDTipoPersona = (int)drPersonas["id_tipo_persona"];

                personas.Add(persona);
            }
            this.CloseConnection();
            return personas;
        }

        public Persona GetOne(int id)
        {
            Persona persona = new Persona();
            try
            {
                this.OpenConnection();
                SqlCommand cmdPersona = new SqlCommand("select * from personas where id_persona=@id", this.sqlConn);
                cmdPersona.Parameters.Add("@id", SqlDbType.Int).Value = id;
                SqlDataReader drPersona = cmdPersona.ExecuteReader();
                while (drPersona.Read())
                {
                    persona.ID = (int)drPersona["id_persona"];
                    persona.Nombre = (string)drPersona["nombre"];
                    persona.Apellido = (string)drPersona["apellido"];
                    persona.Direccion = (string)drPersona["direccion"];
                    persona.Email = (string)drPersona["email"];
                    persona.Telefono = (string)drPersona["telefono"];
                    persona.FechaNacimiento = (DateTime)drPersona["fecha_nac"];
                    persona.Legajo = (int)drPersona["legajo"];
                    persona.IDPlan = (int)drPersona["id_plan"];
                    persona.IDTipoPersona = (int)drPersona["id_tipo_persona"];
                }
                this.CloseConnection();
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al recuperar datos de la persona", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
            return persona;
        }

        public void Delete(int id)
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdDelete = new SqlCommand("delete personas where id_persona=@id", sqlConn);
                cmdDelete.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmdDelete.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar eliminar la persona", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Update(Persona persona)
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdUpdate = new SqlCommand("UPDATE personas" +
                                                    "SET nombre=@nombre, apellido=@apellido," +
                                                         "direccion=@direccion, email=@email, id_persona=@id_persona" +
                                                         "telefono=@telefono, fecha_nac=@fecha_nac, legajo=@legajo, id_plan=@id_plan, id_tipo_persona=@id_tipo_persona" +
                                                    "WHERE id_persona=@id", sqlConn);
                cmdUpdate.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = persona.Nombre;
                cmdUpdate.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = persona.Apellido;
                cmdUpdate.Parameters.Add("@direccion", SqlDbType.Bit).Value = persona.Direccion;
                cmdUpdate.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = persona.Email;
                cmdUpdate.Parameters.Add("@id_persona", SqlDbType.Int).Value = persona.ID;
                cmdUpdate.Parameters.Add("@telefono", SqlDbType.VarChar, 50).Value = persona.Telefono;
                cmdUpdate.Parameters.Add("@fecha_nac", SqlDbType.VarChar, 50).Value = persona.FechaNacimiento;
                cmdUpdate.Parameters.Add("@legajo", SqlDbType.VarChar, 50).Value = persona.Legajo;
                cmdUpdate.Parameters.Add("@id_plan", SqlDbType.VarChar, 50).Value = persona.IDPlan;
                cmdUpdate.Parameters.Add("@id_tipo_persona", SqlDbType.VarChar, 50).Value = persona.IDTipoPersona;
                cmdUpdate.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar actualizar datos de la persona", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Insert(Persona persona)
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdInsert = new SqlCommand("INSERT into personas (nombre, apellido, direccion, email, telefono, fecha_nac, legajo, id_plan, id_tipo_persona)" +
                                                      "VALUES (@nombre,@clave,@habilitado,@nombre,@apellido,@email,@id_persona)" +
                                                      "select @@identity", sqlConn);
                cmdInsert.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = persona.Nombre;
                cmdInsert.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = persona.Apellido;
                cmdInsert.Parameters.Add("@direccion", SqlDbType.Bit).Value = persona.Direccion;
                cmdInsert.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = persona.Email;
                cmdInsert.Parameters.Add("@id_persona", SqlDbType.Int).Value = persona.ID;
                cmdInsert.Parameters.Add("@telefono", SqlDbType.VarChar, 50).Value = persona.Telefono;
                cmdInsert.Parameters.Add("@fecha_nac", SqlDbType.VarChar, 50).Value = persona.FechaNacimiento;
                cmdInsert.Parameters.Add("@legajo", SqlDbType.VarChar, 50).Value = persona.Legajo;
                cmdInsert.Parameters.Add("@id_plan", SqlDbType.VarChar, 50).Value = persona.IDPlan;
                cmdInsert.Parameters.Add("@id_tipo_persona", SqlDbType.VarChar, 50).Value = persona.IDTipoPersona;
                cmdInsert.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar insertar datos de la persona", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Save(Persona persona)
        {
            if (persona.State == BusinessEntity.States.New)
            {
                this.Insert(persona);
            }
            else if (persona.State == BusinessEntity.States.Deleted)
            {
                this.Delete(persona.ID);
            }
            else if (persona.State == BusinessEntity.States.Modified)
            {
                this.Update(persona);
            }
            persona.State = BusinessEntity.States.Unmodified;
        }

    }
}
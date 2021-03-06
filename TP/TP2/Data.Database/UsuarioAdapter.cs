using System;
using System.Collections.Generic;
using System.Text;
using Business.Entities;
using System.Data.SqlClient;
using System.Data;

namespace Data.Database
{
    public class UsuarioAdapter:Adapter
    {
        public List<Usuario> GetAll()
        {
            List<Usuario> usuarios = new List<Usuario>();
            this.OpenConnection();
            SqlCommand cmdUsuarios = new SqlCommand("select us.id_usuario, per.nombre, per.apellido, us.nombre_usuario, " + 
                                                    "per.email, us.habilitado, per.id_persona, us.clave " + 
                                                    "from personas per inner join usuarios us " +
                                                    "on per.id_persona = us.id_persona " +
                                                    "order by per.nombre asc ", this.sqlConn);
            SqlDataReader drUsuarios = cmdUsuarios.ExecuteReader();
            while (drUsuarios.Read())
            {
                Usuario usr = new Usuario();

                usr.ID = (int)drUsuarios["id_usuario"];
                usr.Nombre = (string)drUsuarios["nombre"];
                usr.Apellido = (string)drUsuarios["apellido"];
                usr.NombreUsuario = (string)drUsuarios["nombre_usuario"];
                usr.EMail = (string)drUsuarios["email"];
                usr.Habilitado = (bool)drUsuarios["habilitado"];
                usr.Clave = (string)drUsuarios["clave"];
                usr.IdPersona = (int)drUsuarios["id_persona"];
                usuarios.Add(usr);
            }
            this.CloseConnection();
            return usuarios;
        }

        public void Delete(int id) 
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdDelete = new SqlCommand("delete usuarios where id_usuario=@id", sqlConn);
                cmdDelete.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmdDelete.ExecuteNonQuery();                
            }
            catch(Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar eliminar el usuario", ex);
                throw ExcepcionManejada;
            }
            finally 
            {
                this.CloseConnection();
            }
        }

        public void Update(Usuario usuario)
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdUpdate = new SqlCommand("UPDATE usuarios "+
                                                    "SET nombre_usuario=@nombre_usuario, clave=@clave, " +
                                                         "habilitado=@habilitado, id_persona=@id_persona " +
                                                    "WHERE id_usuario=@id",sqlConn);
                cmdUpdate.Parameters.Add("@id", SqlDbType.Int).Value = usuario.ID;
                cmdUpdate.Parameters.Add("@nombre_usuario", SqlDbType.VarChar, 50).Value = usuario.NombreUsuario;
                cmdUpdate.Parameters.Add("@clave", SqlDbType.VarChar, 50).Value = usuario.Clave;
                cmdUpdate.Parameters.Add("@habilitado", SqlDbType.Bit).Value = usuario.Habilitado;
                cmdUpdate.Parameters.Add("@id_persona", SqlDbType.Int).Value = usuario.IdPersona;
                cmdUpdate.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar actualizar datos del usuario", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Insert(Usuario usuario)
        {
            try
            {
                this.OpenConnection();
                SqlCommand cmdInsert = new SqlCommand("INSERT into usuarios (nombre_usuario, clave, habilitado, id_persona)" +
                                                      "VALUES (@nombre_usuario,@clave,@habilitado,@id_persona)" +
                                                      "select @@identity", sqlConn);
                cmdInsert.Parameters.Add("@id", SqlDbType.Int).Value = usuario.ID;
                cmdInsert.Parameters.Add("@nombre_usuario", SqlDbType.VarChar, 50).Value = usuario.NombreUsuario;
                cmdInsert.Parameters.Add("@clave", SqlDbType.VarChar, 50).Value = usuario.Clave;
                cmdInsert.Parameters.Add("@habilitado", SqlDbType.Bit).Value = usuario.Habilitado;
                cmdInsert.Parameters.Add("@id_persona", SqlDbType.Int).Value = usuario.IdPersona;
                usuario.ID = Decimal.ToInt32((decimal)cmdInsert.ExecuteScalar());
            }
            catch (Exception ex)
            {
                Exception ExcepcionManejada =
                new Exception("Error al intentar crear un usuario", ex);
                throw ExcepcionManejada;
            }
            finally
            {
                this.CloseConnection();
            }
        }

        public void Save(Usuario usuario)
        {
            if (usuario.State == BusinessEntity.States.New)
            {
                this.Insert(usuario);
            }
            else if (usuario.State == BusinessEntity.States.Deleted)
            {
                this.Delete(usuario.ID);
            }
            else if (usuario.State == BusinessEntity.States.Modified)
            {
                this.Update(usuario);
            }
            usuario.State = BusinessEntity.States.Unmodified;
        }



    }
}
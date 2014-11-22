﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business.Entities;
using Business.Logic;

namespace UI.Web
{
    public partial class Personas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadGrilla();
            }
        }

        PersonaLogic _logic;

        private PersonaLogic Logic
        {
            get
            {
                if (_logic == null)
                {
                    _logic = new PersonaLogic();
                }
                return _logic;
            }
        }

        private void LoadGrilla()
        {
            this.GridViewPer.DataSource = this.Logic.GetAll();
            this.GridViewPer.DataBind();
        }

        private Persona Entity
        {
            get;
            set;
        }

        private int SelectedID
        {
            get
            {
                if (this.ViewState["SelectedID"] != null)
                {
                    return (int)this.ViewState["SelectedID"];
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                this.ViewState["SelectedID"] = value;
            }
        }

        private bool IsEntitySelected
        {
            get
            {
                return (this.SelectedID != 0);
            }
        }

        public enum FormModes
        {
            Alta,
            Baja,
            Modificacion
        }

        public FormModes FormMode
        {
            get { return (FormModes)this.ViewState["FormMode"]; }
            set { this.ViewState["FormMode"] = value; }
        }

        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SelectedID = (int)this.GridViewPer.SelectedValue;
        }

        protected void editarLinkButton_Click(object sender, EventArgs e)
        {
            if (this.IsEntitySelected)
            {
                this.formPanelPer.Visible = true;
                this.formActionPanel.Visible = true;
                this.gridActionPanel.Visible = false;
                this.FormMode = FormModes.Modificacion;
                this.EnableForm(true);
                this.LoadForm(this.SelectedID);

            }
        }

        private void LoadForm(int id)
        {
            this.Entity = this.Logic.GetOne(id);
            this.txtApellido.Text = this.Entity.Apellido;
            this.txtNombre.Text = this.Entity.Nombre;
            this.txtEmail.Text = this.Entity.Email;
            this.txtFecNac.Text = Convert.ToString(Entity.FechaNacimiento);
            this.txtDireccion.Text = this.Entity.Direccion;
            this.txtTelefono.Text = this.Entity.Telefono;
            this.txtLegajo.Text = Convert.ToString(Entity.Legajo);
        }

        private void EnableForm(bool enable)
        {
            this.txtApellido.Visible = enable;
            this.txtNombre.Visible = enable;
            this.txtEmail.Visible = enable;
            this.txtFecNac.Visible = enable;
            this.txtDireccion.Visible = enable;
            this.txtTelefono.Visible = enable;
            this.txtLegajo.Visible = enable;
            this.dblPlan.Visible = enable;
            this.dblTipoPersona.Visible = enable;
        }

        protected void eliminarLinkButton_Click(object sender, EventArgs e)
        {
            if (this.IsEntitySelected)
            {
                this.formPanelPer.Visible = false;
                this.formActionPanel.Visible = true;
                this.gridActionPanel.Visible = false;
                this.FormMode = FormModes.Baja;
                this.EnableForm(false);
                this.LoadForm(this.SelectedID);
            }
        }

        private void DeleteEntity(int id)
        {
            this.Logic.Delete(id);
        }

        protected void aceptarLinkButton_Click(object sender, EventArgs e)
        {
            switch (this.FormMode)
            {
                case FormModes.Baja:
                    this.DeleteEntity(this.SelectedID);
                    this.LoadGrilla();
                    this.gridActionPanel.Visible = true;
                    this.formActionPanel.Visible = false;
                    break;
                case FormModes.Modificacion:
                    this.Entity = new Persona();
                    this.Entity.ID = this.SelectedID;
                    this.Entity.State = BusinessEntity.States.Modified;
                    this.LoadEntity(this.Entity);
                    this.SaveEntity(this.Entity);
                    this.LoadGrilla();
                    this.gridActionPanel.Visible = true;
                    this.formActionPanel.Visible = false;
                    break;
                case FormModes.Alta:
                    this.Entity = new Persona();
                    this.LoadEntity(this.Entity);
                    this.SaveEntity(this.Entity);
                    this.LoadGrilla();
                    this.gridActionPanel.Visible = true;
                    this.formActionPanel.Visible = false;
                    break;
                default:
                    break;
            }

            this.formPanelPer.Visible = false;
        }

        private void LoadEntity(Persona persona)
        {
            persona.Apellido = this.txtApellido.Text;
            persona.Nombre = this.txtNombre.Text;
            persona.Email = this.txtEmail.Text;
            persona.Telefono = this.txtTelefono.Text;
            persona.Direccion = this.txtDireccion.Text;
            persona.FechaNacimiento = Convert.ToDateTime(this.txtFecNac.Text);
            persona.Legajo = int.Parse(this.txtLegajo.Text);
            persona.IDPlan = int.Parse(this.dblPlan.SelectedValue);
            persona.IDTipoPersona = int.Parse(this.dblTipoPersona.SelectedValue);
        }

        protected void nuevoLinkButton_Click(object sender, EventArgs e)
        {
            this.formPanelPer.Visible = true;
            this.gridActionPanel.Visible = false;
            this.formActionPanel.Visible = true;
            this.FormMode = FormModes.Alta;
            this.ClearForm();
            this.EnableForm(true);
        }

        private void ClearForm()
        {
            this.txtApellido.Text = string.Empty;
            this.txtNombre.Text = string.Empty;
            this.txtEmail.Text = string.Empty;
            this.txtFecNac.Text = string.Empty;
            this.txtDireccion.Text = string.Empty;
            this.txtTelefono.Text = string.Empty;
            this.txtLegajo.Text = string.Empty;
        }

        private void SaveEntity(Persona persona)
        {
            this.Logic.Save(persona);
        }

        protected void cancelarLinkButton_Click(object sender, EventArgs e)
        {
            this.formPanelPer.Visible = false;
            this.formActionPanel.Visible = false;
            this.gridActionPanel.Visible = true;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

    }
}
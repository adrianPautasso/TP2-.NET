﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Business.Entities;
using Data.Database;
using System.Data.SqlClient;
using System.Data;

namespace Business.Logic
{
    public class EspecialidadLogic : BusinessLogic
    {
        private EspecialidadAdapter especialidadData;

        public EspecialidadLogic()
        {
            especialidadData = new EspecialidadAdapter();
        }

        public EspecialidadAdapter EspecialidadData
        {
            get { return especialidadData; }
            set { especialidadData = value; }
        }

        public List<Especialidad> GetAll()
        {
            return especialidadData.GetAll();
        }

        public Especialidad GetOne(int id)
        {
            try
            {
                Especialidad especialidad = new Especialidad();
                foreach (var esp in this.EspecialidadData.GetAll())
                    if (esp.ID == id)
                        especialidad = esp;
                return especialidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void Save(Especialidad especialidad)
        {
            especialidadData.Save(especialidad);
        }

        public void Delete(int id)
        {
            especialidadData.Delete(id);
        }

    }
}

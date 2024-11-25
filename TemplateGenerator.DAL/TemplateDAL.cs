using System;
using System.Collections.Generic;
using System.Data;
using TemplateGenerator.DTO;

namespace TemplateGenerator.DAL
{
    public class TemplateDAL : DALBASE
    {

        public TemplateDTO GetFestivalByMonthID(int id)
        {
            TemplateDTO templateDTO = new TemplateDTO();
            templateDTO.FestivalList = new List<TemplateDTO.Festival>();

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "GetFestivalsByMonth");
                    db.AddInParameter(command, "@MonID", DbType.Int32, id);

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            TemplateDTO.Festival festival = new TemplateDTO.Festival
                            {
                                FestivalID = reader.GetInt32(reader.GetOrdinal("FestivalID")),
                                FestivalName = reader.GetString(reader.GetOrdinal("FestivalName")),
                                Day = reader.GetInt32(reader.GetOrdinal("Day"))
                            };
                            templateDTO.FestivalList.Add(festival);
                        }
                    }
                }
                templateDTO.message = templateDTO.FestivalList.Count > 0 ? "success" : "false";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                templateDTO.message = "Internal Server Error";
                templateDTO.ErrorCode = 500;
            }

            return templateDTO;
        }

        public TemplateDTO GetClassicByDefault()
        {
            TemplateDTO templateDTO = new TemplateDTO();
            templateDTO.ClassicList = new List<TemplateDTO.Classic>();

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "GetAllClassicTemplates");

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            TemplateDTO.Classic classic = new TemplateDTO.Classic
                            {
                                ClassicID = reader.GetInt32(reader.GetOrdinal("ClassicID")),
                                ClassicName = reader.GetString(reader.GetOrdinal("ClassicName"))
                            };
                            templateDTO.ClassicList.Add(classic);
                        }
                    }
                }

                templateDTO.message = templateDTO.ClassicList.Count > 0 ? "success" : "false";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                templateDTO.message = "Internal Server Error";
                templateDTO.ErrorCode = 500;
            }

            return templateDTO;
        }
        public TemplateDTO GetFestivalsByDefault()
        {
            TemplateDTO templateDTO = new TemplateDTO();
            templateDTO.FestivalList = new List<TemplateDTO.Festival>();

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "GetAllFestivalTemplates");
                   

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            TemplateDTO.Festival festival = new TemplateDTO.Festival
                            {
                                /*FestivalID = reader.GetInt32(reader.GetOrdinal("FestivalID"))*/
                                FestivalName = reader.GetString(reader.GetOrdinal("FestivalName")),
                                Day = reader.GetInt32(reader.GetOrdinal("Day")),
                                Month = reader.GetInt32(reader.GetOrdinal("MonthID")),
                            };
                            templateDTO.FestivalList.Add(festival);
                        }
                    }
                }
                templateDTO.message = templateDTO.FestivalList.Count > 0 ? "success" : "false";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                templateDTO.message = "Internal Server Error";
                templateDTO.ErrorCode = 500;
            }

            return templateDTO;
        }







        public TemplateDTO GetTemplateByClassicID(int id)
        {
            TemplateDTO templateDTO = new TemplateDTO();
            templateDTO.TemplateList = new List<TemplateDTO.Template>();

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "GetTemplateByClassicId");
                    db.AddInParameter(command, "@ClaID", DbType.Int32, id);

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            TemplateDTO.Template template = new TemplateDTO.Template
                            {
                                TemplateName = reader.GetString(reader.GetOrdinal("TemplateName")),
                                TemplateImagePath = reader.GetString(reader.GetOrdinal("TemplateImagePath")),
                                ClassicId = id
                            };
                            templateDTO.TemplateList.Add(template);
                        }
                    }

                    templateDTO.message = templateDTO.TemplateList.Count > 0 ? "success" : "false";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                templateDTO.message = "Internal Server Error";
                templateDTO.ErrorCode = 500;
            }

            return templateDTO;
        }

        public TemplateDTO GetTemplateByFestivalID(int id)
        {
            TemplateDTO templateDTO = new TemplateDTO();
            templateDTO.TemplateList = new List<TemplateDTO.Template>();

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "GetTemplateByFestivalId");
                    db.AddInParameter(command, "@FesID", DbType.Int32, id);

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            TemplateDTO.Template template = new TemplateDTO.Template
                            {
                                TemplateName = reader.GetString(reader.GetOrdinal("TemplateName")),
                                TemplateImagePath = reader.GetString(reader.GetOrdinal("TemplateImagePath")),
                                Day = reader.GetInt32(reader.GetOrdinal("Day")),
                                FestivalId = id
                            };
                            templateDTO.TemplateList.Add(template);
                        }
                    }

                    templateDTO.message = templateDTO.TemplateList.Count > 0 ? "success" : "false";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                templateDTO.message = "Internal Server Error";
                templateDTO.ErrorCode = 500;
            }

            return templateDTO;
        }

        // Save the image
        public string SaveImageDetails(int day, int monthId, string templateName, string templateImagePath)
        {

            string resultMessage = "Error";

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "InsertTemplateWithFestival");
                    db.AddInParameter(command, "@day", DbType.Int32, day);
                    db.AddInParameter(command, "@FestivalName", DbType.String, templateName);
                    db.AddInParameter(command, "@TemplateName", DbType.String, templateName);
                    db.AddInParameter(command, "@TemplateImagePath", DbType.String, templateImagePath);
                    db.AddInParameter(command, "@MonID", DbType.Int32, monthId);

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        if (reader.Read())
                        {
                            string retval = reader["Retval"].ToString();
                            resultMessage = reader["Message"].ToString();

                            if (retval == "Success")
                            {
                                resultMessage = retval;
                                return resultMessage;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return resultMessage;
            }

            return resultMessage;
        }

        public string SaveImageDetails2(string templateName, string templateImagePath)
        {
            string resultMessage = "Error occurred while inserting the template.";

            try
            {
                using (command = db.GetStoredProcCommand("sp_Template"))
                {
                    db.AddInParameter(command, "@Action", DbType.String, "InsertTemplateClassic");
                    db.AddInParameter(command, "@TemplateName", DbType.String, templateName);
                    db.AddInParameter(command, "@TemplateImagePath", DbType.String, templateImagePath);

                    using (IDataReader reader = db.ExecuteReader(command))
                    {
                        if (reader.Read())
                        {
                            string retval = reader["Retval"].ToString();
                            resultMessage = reader["Message"].ToString();

                            if (retval == "Success")
                            {
                                resultMessage = retval;
                                return resultMessage;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return resultMessage;
            }

            return resultMessage;
        }
    }
}

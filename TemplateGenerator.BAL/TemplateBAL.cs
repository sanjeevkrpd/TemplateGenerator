using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TemplateGenerator.DAL;
using TemplateGenerator.DTO;

namespace TemplateGenerator.BAL
{
    public class TemplateBAL
    {
        TemplateDTO objtemplateDTO = new TemplateDTO();
        TemplateDAL objTemplateDAL = new TemplateDAL();


        public TemplateDTO GetFestivalByMonthID(int id) 
        {

            return objTemplateDAL.GetFestivalByMonthID(id);

        }

        public TemplateDTO GetTemplateByClassicID(int id) { 
        
            
            return objTemplateDAL.GetTemplateByClassicID((id));
        }

        public String SaveImageDetails(int day ,int monthID,String TemplateName, String TemplateImagePath) 
        {
            return objTemplateDAL.SaveImageDetails(day ,monthID,TemplateName , TemplateImagePath);
        }

        public String SaveImageDetails2( String TemplateName , String TemplateImagePath)
        {
            return objTemplateDAL.SaveImageDetails2(TemplateName, TemplateImagePath);
        }

        public TemplateDTO GetTemplateByFestivalID(int id) 
        {
            return objTemplateDAL.GetTemplateByFestivalID(id);
        }

        public TemplateDTO GetClassicByDefault() 
        {
        
            return objTemplateDAL.GetClassicByDefault();
        }


        public TemplateDTO GetFestivalByDefault()
        {
            return objTemplateDAL.GetFestivalsByDefault();
        }


    }
}

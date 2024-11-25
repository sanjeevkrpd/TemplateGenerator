using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace TemplateGenerator.DTO
{
    public class TemplateDTO
    {

       public string message { get; set; }
       public int ErrorCode { get; set; }

        public class Festival
        {
            public int FestivalID { get; set; }
            public string FestivalName { get; set; }

            public int Day { get; set; }

            public int Month { get; set; }
            
        }

        public class Classic
        {

            public int ClassicID { get; set; }
            public string ClassicName { get; set; }

        }

        public class Template
        {
            
            public string TemplateName { get; set; }
            public int FestivalId { get; set; }
            public string TemplateImagePath { get; set; }
            public int Day { get; set; }
            public int ClassicId { get; set; }
        }

        public List<TemplateDTO.Festival> FestivalList { get; set; }

        public List<TemplateDTO.Template> TemplateList { get; set; }

        public List<TemplateDTO.Classic> ClassicList { get; set; }
       

    }   
}

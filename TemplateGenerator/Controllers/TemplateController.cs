using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TemplateGenerator.BAL;
using TemplateGenerator.DAL;
using TemplateGenerator.DTO;

namespace TemplateGenerator.Controllers
{
    public class TemplateController : Controller
    {

        TemplateDTO objtemplateDTO = new TemplateDTO();
        TemplateDAL objTemplateDAL = new TemplateDAL();
        TemplateBAL objTemplateBAL = new TemplateBAL();

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetFestivalByMonthID(int id)
        {
            if (id <= 0 || id > 12)
            {
                return Json(new { message = "Please provide a valid month id. 😢", success = false });
            }

            var data = objTemplateBAL.GetFestivalByMonthID(id);

            if(data.message == "success")
            {
                return Json(new { message = "Data retrieved successfully.", success = true, data.FestivalList });
            }
            if (data.message == "false")
            {
                return Json(new { message = "Template Doesn't Exists !", success = false });
            }

            return Json(new { message = "Something Went Wrong. Please Try After Sometime", success = false }); 
  

        }

        public JsonResult GetTemplateByFestivalID(int id)
        {

            var data = objTemplateBAL.GetTemplateByFestivalID(id);

            if (data.message == "success") {

                return Json(new { message = "Data retrieved successfully", success = true , data.TemplateList });
            }

            if (data.message == "false") 
            {
                return Json(new {message = "Template Doesn't Exists ! 😢", success = false});
            }

            return Json(new { message = "Something Went Wrong. Please Try After Sometime 😢", success = false });

        }


        public JsonResult GetClassicByDefault()
        {

            var data = objTemplateBAL.GetClassicByDefault();
            if (data.message == "success")
            {
                return Json(new { message = "Data retrieved successfully", success = true, data.ClassicList });
            }
            if (data.message == "false")
            {
                return Json(new { message = "Template Doesn't Exists ! 😢", success = false });
            }

            return Json(new { message = "Something Went Wrong. Please Try After Sometime 😢", success = false });


        }


        public JsonResult GetFestivalByDefault()
        {

            var data = objTemplateBAL.GetFestivalByDefault();
            if (data.message == "success")
            {
                return Json(new { message = "Data retrieved successfully", success = true, data.FestivalList });
            }
            if (data.message == "false")
            {
                return Json(new { message = "Template Doesn't Exists ! 😢", success = false });
            }

            return Json(new { message = "Something Went Wrong. Please Try After Sometime 😢", success = false });


        }




        public JsonResult GetTemplateByClassicID(int id) {
        
            
            if(id  == 0)
            {
                return Json(new {message = "Please provide the Id" , success = false});
            }

            var data = objTemplateBAL.GetTemplateByClassicID(id);
            if (data.message == "success") {
                return Json(new { message = "Data retrieved successfully", success = true, data.TemplateList });
            }
            if (data.message == "false")
            {
                return Json(new { message = "Template Doesn't Exists !😢", success = false });
            }

            return Json(new { message = "Something Went Wrong. Please Try After Sometime 😢", success = false });

        }



    }


}
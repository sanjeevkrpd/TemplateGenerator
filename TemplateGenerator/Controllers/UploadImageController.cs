using Antlr.Runtime.Tree;
using Microsoft.Ajax.Utilities;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TemplateGenerator.BAL;
using static TemplateGenerator.DTO.TemplateDTO;

namespace TemplateGenerator.Controllers
{
    public class UploadImageController : Controller
    {
        
        TemplateBAL objtemplateBAL = new TemplateBAL();

        public ActionResult Index()
        {
            return View();
        }




        public ClaimsPrincipal ValidateJwtToken(string token)
        {

            var secretKey = ConfigurationManager.AppSettings["JwtSecretKey"];
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var tokenHandler = new JwtSecurityTokenHandler();
            try
            {
                var clockSkew = TimeSpan.FromMinutes(15);
                var validationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = securityKey,
                    ClockSkew = clockSkew
                };

                ClaimsPrincipal principal = tokenHandler.ValidateToken(token, validationParameters, out SecurityToken validatedToken);
                return principal;
            }
            catch (SecurityTokenExpiredException)
            {

                return null;
            }
            catch (Exception)
            {

                return null;
            }
        }




        //login 


        public JsonResult Login(string username, string password)
        {
            if (username == "admin" && password == "admin")
            {
                var secretKey = ConfigurationManager.AppSettings["JwtSecretKey"];
                var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));
                var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                var claims = new[]
                {
                new Claim(ClaimTypes.Name, username)
                 };

                var token = new JwtSecurityToken(
                    claims: claims,
                    expires: DateTime.Now.AddDays(14),
                    signingCredentials: credentials
                );

                var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

                return Json(new { success = true, username, token = tokenString, msg = "Login Successfully" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { success = false, msg = "Bad Credentials" }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddFestivalImage()
        {

            string filePath = null;
            try
            {

                var authHeader = HttpContext.Request.Headers["Authorization"];
                string token = null;
                if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Bearer"))
                {
                    token = authHeader.Substring("Bearer ".Length).Trim();
                }

                if (string.IsNullOrEmpty(token))
                {
                    return Json(new { message = "Token is missing or invalid" }, JsonRequestBehavior.AllowGet);
                }


                var principal = ValidateJwtToken(token);

                if (principal == null)
                {
                    return Json(new { message = "Invalid Token" }, JsonRequestBehavior.AllowGet);
                }
                int monthId = int.Parse(Request.Form["monthId"]);
                int day = int.Parse(Request.Form["day"]);
                string folderType = Request.Form["folderType"];
                var imageFile = Request.Files["imageFile"];

                if (imageFile == null || monthId < 1 || monthId > 12 || day < 1 || day > 31 || folderType == null)
                {
                    return Json(new { message = "Invalid data provided.", success = false });
                }

              
                string baseFolder = Server.MapPath("~/Content/Images/Festivals");
                string folderPath = Path.Combine(baseFolder, folderType.ToLower());

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(imageFile.FileName);
                filePath = Path.Combine(folderPath, fileName);

                if (System.IO.File.Exists(filePath))
                {
                    return Json(new { message = "A file with this name already exists.", success = false });
                }

                imageFile.SaveAs(filePath);

               
                string relativePath = $"/Content/Images/Festivals/{folderType}/{fileName}";

                var message = objtemplateBAL.SaveImageDetails(day, monthId, folderType, relativePath);

                if (message == "Success")
                {
                    return Json(new { message = "Image uploaded and saved successfully.", success = true });
                }
                else
                {
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                    return Json(new { message = "Internal Server Error.", success = false });
                }
            }
            catch (Exception ex)
            {
                if (filePath != null && System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
                return Json(new { message = $"An error occurred: {ex.Message}", success = false });
            }
        }



        [HttpPost]

        public JsonResult AddClassicImage()
        {
            string filePath = null;
            try
            {

                var authHeader = HttpContext.Request.Headers["Authorization"];
                string token = null;
                if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Bearer"))
                {
                    token = authHeader.Substring("Bearer ".Length).Trim();
                }

                if (string.IsNullOrEmpty(token))
                {
                    return Json(new { message = "Token is missing or invalid" }, JsonRequestBehavior.AllowGet);
                }


                var principal = ValidateJwtToken(token);

                if (principal == null)
                {
                    return Json(new { message = "Invalid Token" }, JsonRequestBehavior.AllowGet);
                }

                string folderType = Request.Form["folderType"];
                var imageFile = Request.Files["imageFile"];

                if (string.IsNullOrEmpty(folderType) || imageFile == null )
                {
                    return Json(new { message = "Please provide all the required information.", success = false });
                }


                string baseFolder = Server.MapPath("~/Content/Images/Classics");
                string folderPath = Path.Combine(baseFolder, folderType.ToLower());

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(imageFile.FileName);
                filePath = Path.Combine(folderPath, fileName);

                if (System.IO.File.Exists(filePath))
                {
                    return Json(new { message = "A file with this name already exists.", success = false });
                }

                imageFile.SaveAs(filePath);

                string relativePath = $"/Content/Images/Classics/{folderType}/{fileName}";

                string message = objtemplateBAL.SaveImageDetails2(folderType, relativePath);

                if (message == "Success")
                {
                    return Json(new { message = "Image uploaded and saved successfully.", success = true });
                }
                else
                {
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                    return Json(new { message = "Internal Server Error.", success = false });
                }
            }
            catch (Exception ex)
            {
                if (filePath != null && System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
                return Json(new { message = $"An error occurred: {ex.Message}", success = false });
            }
        }


    }
}
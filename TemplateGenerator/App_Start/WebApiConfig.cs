﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace TemplateGenerator
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            
            var cors = new EnableCorsAttribute("*", "*", "Authorization, Content-Type, Accept");
            config.EnableCors(cors);

            
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}

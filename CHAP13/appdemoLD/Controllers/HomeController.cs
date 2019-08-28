using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using appdemoLD.Models;
using Microsoft.AspNetCore.Identity;
using LaunchDarkly.Client;

namespace appdemoLD.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            LdClient ldClient = new LdClient("sdk-xxx-xx--xxxxxxx");
            User user = LaunchDarkly.Client.User.WithKey(User.Identity.Name);
            bool showBoxHome = ldClient.BoolVariation("show-box-home", user, false);
            return View(new HomeModel{ShowBoxHome = showBoxHome});
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

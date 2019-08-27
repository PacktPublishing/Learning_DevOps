using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using appFeatureFlags.Models;

namespace appFeatureFlags.Controllers
{
    public class HomeController : Controller
    {
        private readonly ShowBoxHome showboxHome;
        public HomeController (ShowBoxHome showboxHome){
            this.showboxHome = showboxHome;
        }
        public IActionResult Index()
        {
            return View(new HomeModel{ShowBoxHome = this.showboxHome.Value});
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

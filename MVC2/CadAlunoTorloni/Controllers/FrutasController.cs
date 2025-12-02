using CadAlunoTorloni.Models;
using Microsoft.AspNetCore.Mvc;


namespace CadAlunoTorloni.Controllers
{
    
    public class FrutasController : Controller
    {
        private readonly ILogger<FrutasController> _logger;

        public FrutasController(ILogger<FrutasController> logger)
        {
            _logger = logger;
        }

        private List<Fruta> frutas = new List<Fruta>
        {
            new Fruta{Id = 1, Nome = "Maça", Cor = "Vermelha", Categoria = "Tropical" },
            new Fruta{Id = 2, Nome = "Banana", Cor = "Amarela", Categoria = "Tropical" },
            new Fruta{Id = 3, Nome = "Uva", Cor = "Roxa", Categoria = "Tropical"},
            new Fruta{Id = 4, Nome = "Limão", Cor = "Verde", Categoria = "Citrica"},
            new Fruta{Id = 5, Nome = "Abacaxi", Cor = "Amarelo", Categoria = "Citrica"}
        };

        public IActionResult Index()
        {
            return View(frutas);
        }
        public IActionResult FrutasCitricas()
        {
            return View();
        }
        public IActionResult FrutasTropicais()
        {
            return View();
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Fruta fruta)
        {
            fruta.Id = frutas.Max(f => f.Id) + 1;
            
            frutas.Add(fruta);

            return RedirectToAction("Index");
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}
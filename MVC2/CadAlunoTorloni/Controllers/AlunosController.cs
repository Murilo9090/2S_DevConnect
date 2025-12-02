
using CadAlunoTorloni.Models;
using Microsoft.AspNetCore.Mvc;


namespace CadAlunoTorloni.Controllers
{
    
    public class AlunoController : Controller
    {
        private readonly ILogger<AlunoController> _logger;

        public AlunoController(ILogger<AlunoController> logger)
        {
            _logger = logger;
        } 
        private static List<Alunos> alunos = new List<Alunos>
        {
            new Alunos{Id = 1, Nome = "Murilo", Idade = 16, Cpf = "476487874-25" },
            new Alunos{Id = 2, Nome = "Pedro", Idade = 17, Cpf = "476826474-25" },
            new Alunos{Id = 3, Nome = "Davi", Idade = 17, Cpf = "476801274-25"},
            new Alunos{Id = 4, Nome = "Henrique", Idade = 17, Cpf = "476982374-25"},
            new Alunos{Id = 5, Nome = "Samuel", Idade = 17, Cpf = "476492064-25"}
        };


        public IActionResult Index()
        {
            return View(alunos);
        }
        public IActionResult Create()
        {
            return View();
        }
         [HttpPost]
        public IActionResult Create(Alunos aluno)
        {
            aluno.Id = alunos.Max(f => f.Id) + 1;
            
            alunos.Add(aluno);

            return RedirectToAction("Index");
        }
        public IActionResult Aluno()
        {
            return View(alunos);
        }

      

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}
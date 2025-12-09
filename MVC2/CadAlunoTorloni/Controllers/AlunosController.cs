using System.Threading.Tasks;
using CadAlunoTorloni.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace CadAlunoTorloni.Controllers
{
public class AlunosController : Controller
{
    private readonly ILogger<AlunosController> _logger;


        // private static List<Aluno> Alunos = new List<Aluno> 
        // {
        //     new Aluno{ Id = 1, Nome = "Murilo", Idade = "17"},
        //     new Aluno{ Id = 2, Nome = "Davi", Idade = "14"},
        //     new Aluno{ Id = 3, Nome = "Maria", Idade = "42"},
        //     new Aluno{ Id = 4, Nome = "Nunes", Idade = "45"},
        //     new Aluno{ Id = 5, Nome = "Henrique", Idade = "26"},
        // };

        private readonly CadAlunoTorloniContext _context;
        private readonly CadAlunoTorloniContext _Logger;
        public AlunosController(ILogger<AlunosController> logger, CadAlunoTorloniContext context)
        {
            _logger = logger;
            _context = context;
        }
    
        //         public IActionResult Index()
        // {
        //         return View(Alunos);
        // }

        public async Task<IActionResult> Index()
        {
            var alunos = await _context.Alunos.ToListAsync();
            return View(alunos);
        }

        [HttpGet ]
        public async Task<IActionResult>  Create( )
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Aluno aluno)
        {
            // aluno.Id = Alunos.Max(a => a.Id) + 1;
            
            // Alunos.Add(aluno);
            _context.Add(aluno);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof (Index));
        }
}
}
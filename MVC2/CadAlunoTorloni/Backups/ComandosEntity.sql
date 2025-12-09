dotnet ef dbcontext scaffold "Server=NOTE14-S21\MSSQLSERVER1;User Id=sa; Password=Senai@134; Database=CadAlunoTorloni;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models -c CadAlunoTorloniContext --data-annotations -f


dotnet ef dbcontext scaffold "Server=(localdb)\\MSSQLLocalDB;Database=CadAlunoTorloni;Trusted_Connection=True;TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models -c CadAlunoTorloniContext --data-annotations -f
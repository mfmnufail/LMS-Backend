
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using LMSystem.Models;
using LMSystem.Repository;

namespace LMSystem.Application.Students
{
    public class List
    {

        public class Query : IRequest<List<Student>> { }

        public class Handler : IRequestHandler<Query, List<Student>>
        {
            private readonly AppDbContext _context;

            public Handler(AppDbContext context)
            {
                _context = context;
            }

            public async Task<List<Student>> Handle(Query request, CancellationToken cancellationToken)
            {
                var students = await _context.Students.ToListAsync();

                return students;
            }
        }
    }
}

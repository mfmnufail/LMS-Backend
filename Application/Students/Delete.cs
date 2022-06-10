using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using LMSystem.Models;
using LMSystem.Repository;

namespace LMSystem.Application.Students
{
    public class Delete
    {
        public class Command : IRequest<Student>
        {
            public string regNo { get; set; }

        }

        public class Handler : IRequestHandler<Command, Student>
        {
            private readonly AppDbContext _context;

            public Handler(AppDbContext context)
            {
                _context = context;
            }

            public async Task<Student> Handle(Command request, CancellationToken cancellationToken)
            {
                var student = _context.Students.FirstOrDefault(e => e.RegNo == request.regNo);

                if (student == null)
                    throw new Exception("Could not find student");

                _context.Students.Remove(student);

                var success = await _context.SaveChangesAsync() > 0;

                if (success) return student;

                throw new Exception("Problem saving changes");



            }
        }
    }
}

using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json.Serialization;
using System.Threading;
using System.Threading.Tasks;
// using LMSystem.Application.Errors;
using LMSystem.Models;
using LMSystem.Repository;
using Microsoft.VisualStudio.Web.CodeGeneration.Contracts.Messaging;
using Newtonsoft.Json;

namespace LMSystem.Application.Students
{
    public class Create
    {
        public class Command : IRequest<Student>
        {

            public string Name { get; set; }

            public string RegNo { get; set; }
            
            public int Batch { get; set; }


        }

        public class Handler : IRequestHandler<Command,Student>
        {
            private readonly AppDbContext _context;

            public Handler(AppDbContext context)
            {
                _context = context;
            }

            public async Task<Student> Handle(Command request, CancellationToken cancellationToken)
            {
                var existStudent =  _context.Students.FirstOrDefault(r => r.RegNo == request.RegNo);

                if (existStudent != null)
                {
                    throw new Exception("Registration number already exist");

                }

                var student = new Student
                {
                    Name = request.Name,
                    RegNo = request.RegNo,
                    Batch = request.Batch

                };

                _context.Students.Add(student);
                var success = await _context.SaveChangesAsync(cancellationToken) > 0;

                if (success) return student;

                throw new Exception("Problem saving changes");

            }
                
                
            
        }
    }
}
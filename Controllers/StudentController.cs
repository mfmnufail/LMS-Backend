using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LMSystem.Application.Students;
using LMSystem.Models;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMSystem.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IMediator _mediator;

        public StudentController(IMediator mediator)
        {
            _mediator = mediator;
        }


        // GET: api/Student
        [HttpGet]
        public async Task<ActionResult<List<Student>>> List()
        {
            return await _mediator.Send(new List.Query());
        }
        
        [HttpPost]
        public async Task<ActionResult<Student>> Create(Create.Command command)
        {
            return await _mediator.Send(command);
        }
        
        
        [HttpDelete("{id}")]
        public async Task<ActionResult<Student>> Delete(string id)
        {
            return await _mediator.Send(new Delete.Command { regNo = id });
        }



    }
}

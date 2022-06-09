using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LMSystem.Models;
using Microsoft.AspNetCore.Mvc;

namespace LMSystem.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
      

        // GET: api/Student
        [HttpGet]
        public async Task<ActionResult<List<Student>>> List()
        {
            return null;
        }
        
    }
}

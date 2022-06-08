using System;
using System.ComponentModel.DataAnnotations;

namespace LMSystem.Models
{
    public class Student
    {
        [Key]
        public Guid Id { get; set; }

        public string Name { get; set; }

        [Required]
        public string RegNo { get; set; }

        [Required]
        public int Batch { get; set; }
    }
}

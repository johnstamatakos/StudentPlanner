//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StudentPlanner.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Exam
    {
        public int Id { get; set; }
        public string ExamName { get; set; }
        public Nullable<int> Prepared { get; set; }
        public int CoursId { get; set; }
    
        public virtual Cours Cour { get; set; }
    }
}

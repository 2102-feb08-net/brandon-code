using System;
using System.Collections.Generic;

#nullable disable

namespace entity_framework_first_demo.Data
{
    public partial class Employee1
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? Ssn { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department Department { get; set; }
        public virtual EmpDetail EmpDetail { get; set; }
    }
}

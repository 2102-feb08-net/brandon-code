using System;
using System.Collections.Generic;

#nullable disable

namespace entity_framework_first_demo.Data
{
    public partial class Department
    {
        public Department()
        {
            Employee1s = new HashSet<Employee1>();
        }

        public int DepartmentId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }

        public virtual ICollection<Employee1> Employee1s { get; set; }
    }
}

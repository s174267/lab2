//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Anmälan
    {
        public int AnmId { get; set; }
        public System.DateTime Tidpunkt { get; set; }
    
        public virtual Alumn Alumn { get; set; }
        public virtual Erbjudande Erbjudande { get; set; }
        public virtual Aktivitet Aktivitet { get; set; }
    }
}

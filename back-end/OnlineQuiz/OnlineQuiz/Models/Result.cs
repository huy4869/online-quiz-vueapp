using System;
using System.Collections.Generic;

#nullable disable

namespace OnlineQuiz.Models
{
    public partial class Result
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public DateTime? FinishTime { get; set; }
        public double Score { get; set; }

        public virtual User User { get; set; }
    }
}

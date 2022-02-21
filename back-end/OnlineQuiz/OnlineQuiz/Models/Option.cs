using System;
using System.Collections.Generic;

#nullable disable

namespace OnlineQuiz.Models
{
    public partial class Option
    {
        public int Id { get; set; }
        public int? QuestionId { get; set; }
        public string Content { get; set; }
        public bool IsRight { get; set; }

        public virtual Question Question { get; set; }
    }
}

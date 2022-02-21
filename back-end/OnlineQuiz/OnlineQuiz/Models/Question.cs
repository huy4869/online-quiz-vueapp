using System;
using System.Collections.Generic;

#nullable disable

namespace OnlineQuiz.Models
{
    public partial class Question
    {
        public Question()
        {
            Options = new HashSet<Option>();
        }

        public int Id { get; set; }
        public string QuestionContent { get; set; }
        public DateTime? CreatedAt { get; set; }

        public virtual ICollection<Option> Options { get; set; }
    }
}

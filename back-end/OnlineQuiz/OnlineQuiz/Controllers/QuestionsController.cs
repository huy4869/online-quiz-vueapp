using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineQuiz.Models;
using PagedList;

namespace OnlineQuiz.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionsController : ControllerBase
    {
        private readonly OnlineQuizContext _context;

        public QuestionsController(OnlineQuizContext context)
        {
            _context = context;
        }
        [HttpGet("GetToTalQuestion")]
        public async Task<ActionResult<int>> GetToTalQuestion()
        {
            int questionSize = await _context.Questions.CountAsync();
            return questionSize;
        }

        [Authorize(Roles = "1")]
        [HttpGet("GetPagingQuestion")]
        public IEnumerable<Question> GetPagingQuestion(int? pageIndex, int pageSize)
        {
            if (pageIndex == null)
            {
                pageIndex = 1;
            }

            int pageNumber = (pageIndex ?? 1);
            IEnumerable<Question> questions = _context.Questions.ToPagedList(pageNumber, pageSize);
            return questions;
        }

        [HttpGet("GetQuestionCodes")]
        public IQueryable<int> GetQuestionCodes(int numberOfQuestion)
        {
            IQueryable<int> questionCodes = _context.Questions.Select(x => x.Id).OrderBy(s => Guid.NewGuid()).Take(numberOfQuestion);
            return questionCodes;
        }
        // GET: api/Questions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Question>>> GetQuestions()
        {
            return await _context.Questions.ToListAsync();
        }

        // GET: api/Questions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Question>> GetQuestion(int id)
        {
            var question = await _context.Questions.FindAsync(id);

            if (question == null)
            {
                return NotFound();
            }
           List<Option> options = _context.Options.Where(o => o.QuestionId == id).ToList();
            foreach(Option option in options)
            {
                question.Options.Add(option);
            }

            return question;
        }

        // PUT: api/Questions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutQuestion(int id, Question question)
        {
            if (id != question.Id)
            {
                return BadRequest();
            }

            _context.Entry(question).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuestionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }


        [HttpPost("GetMarkForQuestion")]
        public double GetMarkForQuestion(List<Question> questions)
        {
            int userRightAnswer = 0;
            int totalRightAnswer = 0;

            foreach (Question question in questions)
            {
                int totalAnswer = _context.Options.Where(a => a.QuestionId == question.Id && a.IsRight == true).Count();
                totalRightAnswer += totalAnswer;
                if (question.Options.Count <= totalAnswer && question.Options.Count > 0)
                {
                    foreach (Option answer in question.Options)
                    {
                        int isTrueAnswer = _context.Options.Where(a => a.QuestionId == question.Id && a.Id == answer.Id && a.IsRight == true).Count();
                        if (isTrueAnswer != 0)
                        {
                            userRightAnswer += isTrueAnswer;
                        }
                    }
                }
            }

            return (double)userRightAnswer / totalRightAnswer;
        }

        // POST: api/Questions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "1")]

        [HttpPost]
        public async Task<ActionResult<Question>> PostQuestion(Question question)
        {
            _context.Questions.Add(question);
            foreach (Option answer in question.Options)
            {
                _context.Options.Add(answer);
            }
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetQuestion", new { id = question.Id }, question);
        }

        // DELETE: api/Questions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteQuestion(int id)
        {
            var question = await _context.Questions.FindAsync(id);
            if (question == null)
            {
                return NotFound();
            }

            List<Option> answers = _context.Options.Where(a => a.QuestionId == id).ToList();
            foreach (Option a in answers)
            {
                _context.Remove(a);
            }
            _context.Questions.Remove(question);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool QuestionExists(int id)
        {
            return _context.Questions.Any(e => e.Id == id);
        }
    }
}

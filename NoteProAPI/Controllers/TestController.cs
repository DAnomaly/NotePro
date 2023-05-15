using Microsoft.AspNetCore.Mvc;

namespace NoteProAPI.Controllers
{
    [ApiController]
    [Route("Test")]
    public class TestController : ControllerBase
    {
        private readonly ILogger<TestController> _logger;

        public TestController(ILogger<TestController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "Connect")]
        public IEnumerable<string> Connect()
        {
            yield return "Success";
        }
    }
}
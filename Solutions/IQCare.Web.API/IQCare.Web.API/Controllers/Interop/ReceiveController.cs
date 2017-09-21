﻿using System.Collections.Generic;

using System.Web.Http;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IQCare.Web.API.Controllers.Interop
{
    [RoutePrefix("api/interop/{controller}")]
    public class ReceiveController : ApiController
    {
        // GET: api/values
        [System.Web.Http.HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
            //call incoming handlers
        }

        // PUT api/values/5
        [HttpGet]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpGet]
        public void Delete(int id)
        {
        }
    }
}

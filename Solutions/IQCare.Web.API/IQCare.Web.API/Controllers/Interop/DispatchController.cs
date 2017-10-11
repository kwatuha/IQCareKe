﻿using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http;
using IQCare.Events;
using System.Web.Script.Serialization;
using IQCare.WebApi.Logic.MessageHandler;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IQCare.Web.Api.Controllers.Interop
{
    [RoutePrefix("api/interop/{controller}/{Id}")]
    public class DispatchController : ApiController
    {
        private readonly IOutgoingMessageService _outgoingMessageService;
        public DispatchController()
        {
            _outgoingMessageService = new OutgoingMessageService();
        }

        // GET: api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public int Post([FromBody] MessageEventArgs message)
        {
            //call outgoing api logic
            //var dispatchedMessage = JsonConvert.DeserializeObject<MessageEventArgs>(message);
            //var dispatchedMessage = new JavaScriptSerializer().Deserialize<MessageEventArgs>(message);
            int result = _outgoingMessageService.Handle(message);
            return result;
        }

        // PUT api/values/5
        [HttpPut]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete]
        public void Delete(int id)
        {
        }
    }
}

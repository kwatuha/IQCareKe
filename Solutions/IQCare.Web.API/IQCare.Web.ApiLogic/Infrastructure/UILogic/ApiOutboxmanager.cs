﻿using System.Collections.Generic;
using IQCare.Web.ApiLogic.Infrastructure.Interface;
using IQCare.Web.ApiLogic.Model;

namespace IQCare.Web.ApiLogic.Infrastructure.UiLogic
{
    public class ApiOutboxmanager : IApiOutboxManager
    {
        private IApiOutboxManager _apiOutboxmanager = (IApiOutboxManager)Application.Presentation.ObjectFactory.CreateInstance("IQCare.Web.ApiLogic.Infrastructure.BusinessProcess.BPApiOutbox, IQCare.Web.ApiLogic");


        public int AddApiOutbox(ApiOutbox apiOutbox)
        {
            ApiOutbox outbox=new ApiOutbox()
            {
                DateRead = apiOutbox.DateRead,
                DateSent = apiOutbox.DateSent,
                RecepientId = apiOutbox.RecepientId,
                AttemptCount = 0,
                Message = apiOutbox.Message
            };
         return  _apiOutboxmanager.AddApiOutbox(outbox);
        }

        public int AddApiProcessed(ApiOutbox apiOutbox)
        {
            ApiOutbox outbox = new ApiOutbox()
            {
                Id = apiOutbox.Id,
                DateSent = apiOutbox.DateSent
                
            };

            return _apiOutboxmanager.AddApiProcessed(outbox);
        }

        public List<ApiOutbox> GetAllUnsentMessages()
        {
            return _apiOutboxmanager.GetAllUnsentMessages();
        }
    }
}


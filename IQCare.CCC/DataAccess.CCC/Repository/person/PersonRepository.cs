﻿using System.Collections.Generic;
using DataAccess.CCC.Interface.person;
using DataAccess.Context;
using Entities.Common;

namespace DataAccess.CCC.Repository.person
{
    public class PersonRepository:BaseRepository<Person>,IPersonRepository
    {
        private readonly PersonContext _context;

        public PersonRepository() : this(new PersonContext())
        {

        }   

        public override void Add(Person entity)
        {
            //do nothing
        }

        public override IEnumerable<Person> GetAll()
        {
            return base.GetAll();
        }

        public PersonRepository(PersonContext context) : base(context)
        {
            _context = context;
        }

        public override void Update(Person entity)
        {
           //do nothing
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.CCC.Lookup;

namespace Interface.CCC.Lookup
{
    public interface IFacilityList
    {
        List<FacilityList> GetFacilitiesList();
    }
}

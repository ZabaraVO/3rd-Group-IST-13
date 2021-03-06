﻿using IntellectualInformationalSystem.WorkingMemory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellectualInformationalSystem.KnowledgeBase
{
    class ConcreteValueForFact : Action
    {

        public ConcreteValueForFact(string factToChangeName, string value) : base(factToChangeName)
        {
            Value = value;
        }

        public string Value
        {
            get;
        }
    }
}

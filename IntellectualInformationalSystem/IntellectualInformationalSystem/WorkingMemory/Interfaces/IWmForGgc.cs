﻿using IntellectualInformationalSystem.HelpingClasses;
using IntellectualInformationalSystem.KnowledgeBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellectualInformationalSystem.WorkingMemory.Interfaces
{
    interface IWmForCgc
    {
        ElementGetterAdder<Rule> Rules { get; }
    }
}

﻿using IntellectualInformationalSystem.HelpingClasses;
using IntellectualInformationalSystem.WorkingMemory.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellectualInformationalSystem.WorkingMemory
{
    class WorkingMemory//: IWmForCgc, IWmForLom
    {

        public ElementGetterAdder<Rule> Facts
        {
            get;
        }
    }
}

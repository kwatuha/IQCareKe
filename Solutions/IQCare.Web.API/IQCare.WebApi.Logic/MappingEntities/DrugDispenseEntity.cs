﻿using System.Collections.Generic;
using IQCare.WebApi.Logic.MappingEntities.drugs;
using System;

namespace IQCare.WebApi.Logic.MappingEntities
{
    public class DrugDispenseEntity
    {
        public DrugDispenseEntity()
        {
            MESSAGE_HEADER = new MESSAGEHEADER();
            PATIENT_IDENTIFICATION = new PATIENTIDENTIFICATION();
            COMMON_ORDER_DETAILS = new COMMON_ORDER_DETAILS();
            PHARMACY_ENCODED_ORDER = new List<PHARMACY_ENCODED_ORDER_DISPENSE>();
            PHARMACY_DISPENSE = new List<PHARMACYDISPENSE>();
        }

        public MESSAGEHEADER MESSAGE_HEADER { get; set; }
        public PATIENTIDENTIFICATION PATIENT_IDENTIFICATION { get; set; }
        public COMMON_ORDER_DETAILS COMMON_ORDER_DETAILS { get; set; }
        public List<PHARMACY_ENCODED_ORDER_DISPENSE> PHARMACY_ENCODED_ORDER { get; set; }
        public List<PHARMACYDISPENSE> PHARMACY_DISPENSE { get; set; }
    }

    public class PHARMACYDISPENSE
    {
        public string DRUG_NAME { get; set; }
        public string CODING_SYSTEM { get; set; }
        public string ACTUAL_DRUGS { get; set; }
        public string STRENGTH { get; set; }
        public string DOSAGE { get; set; }
        public string FREQUENCY { get; set; }
        public int DURATION { get; set; }
        public int QUANTITY_DISPENSED { get; set; }
        public string DISPENSING_NOTES { get; set; }

    }

    public class PHARMACY_ENCODED_ORDER_DISPENSE
    {
        public string DRUG_NAME { get; set; }
        public string CODING_SYSTEM { get; set; }
        public string STRENGTH { get; set; }
        public string DOSAGE { get; set; }
        public string FREQUENCY { get; set; }
        public string DURATION { get; set; }
        public decimal QUANTITY_PRESCRIBED { get; set; }
        public string PRESCRIPTION_NOTES { get; set; }
    }

    public class CommonOrderDetailsDispenseEntity
    {
        public CommonOrderDetailsDispenseEntity()
        {
            PLACER_ORDER_NUMBER = new PLACER_ORDER_NUMBER();
            FILLER_ORDER_NUMBER = new PLACER_ORDER_NUMBER();
            ORDERING_PHYSICIAN = new ORDERING_PHYSICIAN();
        }

        public string OrderControl { get; set; }
        public PLACER_ORDER_NUMBER PLACER_ORDER_NUMBER { get; set; }
        public PLACER_ORDER_NUMBER FILLER_ORDER_NUMBER { get; set; }
        public string OrderStatus { get; set; }
        public ORDERING_PHYSICIAN ORDERING_PHYSICIAN { get; set; }
        public DateTime TransactionDatetime { get; set; }
        public string Notes { get; set; }
    }
}
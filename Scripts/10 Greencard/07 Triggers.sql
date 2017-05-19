-- Author:  <pwangoo>
-- Create date: <20042017>
-- Description: <Insert labresults to patientlab tracker>
-- =============================================


CREATE TRIGGER [dbo].[Insert_Results_LabTracker]
ON [dbo].[dtl_LabOrderTestResult]

 AFTER UPDATE
AS
    IF UPDATE(ResultValue) OR UPDATE(ResultText)
    BEGIN
      UPDATE c
            SET ResultValues = isnull(i.ResultValue,0),
          ResultTexts = i.ResultText,
		  ResultOptions = i.ResultOption,
	      ResultDate = i.StatusDate,
		  ResultUnits = i.ResultUnit,
          Results = 'Complete'    
        FROM PatientLabTracker AS c
          JOIN inserted AS i
            ON i.LabOrderTestId = c.LabOrderTestId     -- use the appropriate column for joining
          JOIN deleted AS d
            ON  i.Id = d.Id
            AND (( i.ResultValue <> d.ResultValue
         OR d.ResultValue IS NULL)
    OR ( i.ResultText <> d.ResultText
                  OR d.ResultText IS NULL)
    OR ( i.ResultOption <> d.ResultOption
                  OR d.ResultOption IS NULL)
         );
    END ;
GO
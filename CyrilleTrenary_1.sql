--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 1, CHAPTER 1 Assignment
--======================================================

--1--
SELECT donor.FIRSTNAME AS "First Name", donor.LASTNAME AS "Last Name", 
pledge.PLEDGEDATE AS "Pledge Date", pledge.PLEDGEAMT AS "Amount"
    FROM dd_donor donor, dd_pledge pledge, dd_status status
        WHERE status.IDSTATUS = 20
            AND pledge.PAYMONTHS = 0;

--2--
SELECT donor.FIRSTNAME AS "First Name", donor.LASTNAME AS "Last Name", 
pledge.PLEDGEDATE AS "Pledge Date", pledge.PLEDGEAMT AS "Amount"
    FROM dd_donor donor, dd_pledge pledge, dd_status status
        WHERE status.IDSTATUS = 10
            AND pledge.PAYMONTHS > 12;
            
--3--
SELECT UNIQUE proj.IDPROJ, proj.PROJNAME
    FROM dd_pledge pledge JOIN dd_project proj
        ON proj.IDPROJ = pledge.IDPROJ  
            ORDER BY proj.IDPROJ;
            
--4--
SELECT donor.iddonor AS "Donor ID", (NVL(donor.firstname,' ')) AS "First Name",
donor.lastname AS "Last Name", count(pledge.iddonor) AS "Amount of Pledges"
    FROM dd_donor donor JOIN dd_pledge pledge
        ON donor.iddonor = pledge.iddonor
            GROUP BY donor.iddonor, donor.firstname, donor.lastname
                ORDER BY "Amount of Pledges", donor.iddonor;

--5--
SELECT pledge.IDPLEDGE AS "Pledge ID", pledge.IDDONOR AS "Donor ID", pledge.PLEDGEDATE AS "Pledge Date",
pledge.PLEDGEAMT AS "Amount of Pledge", pledge.IDPROJ AS "Project ID", pledge.IDSTATUS AS "Status", 
pledge.WRITEOFF AS "Write Off", pledge.PAYMONTHS AS "Pay Months",
pledge.CAMPAIGN AS "Campaign",pledge.FIRSTPLEDGE AS "First Pledge"
    FROM dd_pledge pledge
        WHERE pledge.PLEDGEDATE < '08-MAR-12'
            ORDER by pledgedate;
   



	
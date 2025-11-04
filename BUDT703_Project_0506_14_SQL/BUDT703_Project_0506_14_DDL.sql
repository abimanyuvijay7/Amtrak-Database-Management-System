USE BUDT703_Project_0506_14;

DROP TABLE IF EXISTS [Amtrak.Pass];
DROP TABLE IF EXISTS [Amtrak.Ridership];
DROP TABLE IF EXISTS [Amtrak.Rewards];
DROP TABLE IF EXISTS [Amtrak.Employment];
DROP TABLE IF EXISTS [Amtrak.Procurements];
DROP TABLE IF EXISTS [Amtrak.Route];
DROP TABLE IF EXISTS [Amtrak.Budget];
DROP TABLE IF EXISTS [Amtrak.Station];
DROP TABLE IF EXISTS [Amtrak.State];


CREATE TABLE [Amtrak.State] (
    stateCode CHAR(2) NOT NULL,
    stateName VARCHAR(100),
    CONSTRAINT pk_State_stateCode PRIMARY KEY (stateCode)
);

CREATE TABLE [Amtrak.Station] (
    stationCode CHAR(3) NOT NULL,
    stationState VARCHAR(100),
    stationCity VARCHAR(100),
    stationInfoURL VARCHAR(255),
    stateCode CHAR(2),
    CONSTRAINT pk_Station_stationCode PRIMARY KEY (stationCode),
    CONSTRAINT fk_Station_stateCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Budget] (
    budgetId CHAR(4) NOT NULL,
    budgetType VARCHAR(100),
	budgetPlanYear VARCHAR(4),
	budgetStationName VARCHAR(100),
	budgetAmount DECIMAL(10, 2),
	budgetPriorYearValue VARCHAR(4),
    budgetYear VARCHAR(4),
	budgetValue DECIMAL(10, 2),
    stationCode CHAR(3),
    CONSTRAINT pk_Budget_budgetId PRIMARY KEY (budgetId),
    CONSTRAINT fk_Budget_stationCode FOREIGN KEY (stationCode)
        REFERENCES [Amtrak.Station](stationCode)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Route] (
    routeId CHAR(4) NOT NULL,
    routeName VARCHAR(100),
    routeType VARCHAR(100),
    routeFrequency VARCHAR(100),
    routeStationsList TEXT,
    routeHostRailroad VARCHAR(100),
    routePerformanceYear VARCHAR(4),
    routePerformanceValue DECIMAL(10, 2),
    stateCode CHAR(2),
    CONSTRAINT pk_Route_routeId PRIMARY KEY (routeId),
    CONSTRAINT fk_Route_stateCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Procurements] (
    procurementRecordId CHAR(6) NOT NULL,
    procurementState VARCHAR(100),
    procurementCity VARCHAR(100),
    procurementYear VARCHAR(4),
    procurementValue DECIMAL(15, 2),
    stateCode CHAR(2),
    CONSTRAINT pk_Procurements_procurementRecordId PRIMARY KEY (procurementRecordId),
    CONSTRAINT fk_Procurements_stationCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Employment] (
    employmentStateRecordId CHAR(4) NOT NULL,
    employmentCount VARCHAR(4),
    employmentTotalSalary DECIMAL(15, 2),
    employmentYear VARCHAR(4),
    stateCode CHAR(2),
    CONSTRAINT pk_Employment_employmentStateRecordId PRIMARY KEY (employmentStateRecordId),
    CONSTRAINT fk_Employment_stateCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Rewards] (
    rewardsId CHAR(5) NOT NULL,
    rewardsMemberCount INT,
    rewardsYear VARCHAR(4),
    stateCode CHAR(2),
    CONSTRAINT pk_Rewards_rewardsId PRIMARY KEY (rewardsId),
    CONSTRAINT fk_Rewards_stateCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Ridership] (
    ridershipRecordId CHAR(7) NOT NULL,
    ridershipCity VARCHAR(100),
    ridershipCityCount VARCHAR(20),
    ridershipYear VARCHAR(4),
    stationCode CHAR(3),
    CONSTRAINT pk_Ridership_ridershipRecordId PRIMARY KEY (ridershipRecordId),
    CONSTRAINT fk_Ridership_stationCode FOREIGN KEY (stationCode)
        REFERENCES [Amtrak.Station](stationCode)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE [Amtrak.Pass] (
    stateCode CHAR(2) NOT NULL,
    routeId CHAR(4) NOT NULL,
    stops TEXT,
    CONSTRAINT pk_Pass PRIMARY KEY (stateCode, routeId),
    CONSTRAINT fk_Pass_stateCode FOREIGN KEY (stateCode)
        REFERENCES [Amtrak.State](stateCode)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_Pass_routeId FOREIGN KEY (routeId)
        REFERENCES [Amtrak.Route](routeId)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

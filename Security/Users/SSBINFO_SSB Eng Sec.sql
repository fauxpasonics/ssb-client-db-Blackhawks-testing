IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SSBINFO\SSB Eng Sec')
CREATE LOGIN [SSBINFO\SSB Eng Sec] FROM WINDOWS
GO
CREATE USER [SSBINFO\SSB Eng Sec] FOR LOGIN [SSBINFO\SSB Eng Sec]
GO
GRANT VIEW DEFINITION TO [SSBINFO\SSB Eng Sec]
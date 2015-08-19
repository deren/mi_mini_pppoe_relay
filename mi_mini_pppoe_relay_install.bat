:: Include configurations
call mi_mini_pppoe_relay_config.cmd

:::::::::::::::::::::::::::::::::::::::::::::
:: Please update configurations above only ::
:::::::::::::::::::::::::::::::::::::::::::::

SET STORAGE_DIR=/extdisks/sda1/xiaomi_router
SET PROGRAM_DIR=%STORAGE_DIR%/pppoe_relay_mi_mini

:: router connection check
ping -n 1 %DEFAULT_IP% | find "TTL=" >nul
if errorlevel 1 (
    echo host not reachable
	goto PROGRAM_END
) else (
    echo host reachable
)

:: create target directory
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% mkdir -p %PROGRAM_DIR%

:: put all related file
pscp.exe -scp -pw %DEFAULT_PW% INSTALL.sh %DEFAULT_ID%@%DEFAULT_IP%:%PROGRAM_DIR%
pscp.exe -scp -pw %DEFAULT_PW% init.pppoe.relay.sh %DEFAULT_ID%@%DEFAULT_IP%:%PROGRAM_DIR%
pscp.exe -scp -pw %DEFAULT_PW% pppoe-relay %DEFAULT_ID%@%DEFAULT_IP%:%PROGRAM_DIR%
pscp.exe -scp -pw %DEFAULT_PW% startPPPoErelay.sh %DEFAULT_ID%@%DEFAULT_IP%:%PROGRAM_DIR%

:: chmod
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% chmod 755 %PROGRAM_DIR%/*

:: install to system
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% %PROGRAM_DIR%/INSTALL.sh

:: run program
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% /etc/init.pppoe.relay.sh

:: sync
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% sync

:: system reboot
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% reboot

echo.
echo.
echo Rebooting Xiaomi router now. Please wait.

echo.
echo.
echo Success

:PROGRAM_END
echo.
echo.
pause
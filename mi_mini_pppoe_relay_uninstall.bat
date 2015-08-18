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

:: Remove startup script
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% rm -f /etc/init.pppoe.relay.sh

:: Restart soft_fast_path
plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% /etc/init.d/soft_fast_path on

:: system reboot
::plink.exe -ssh -t -C -2 -pw %DEFAULT_PW% %DEFAULT_ID%@%DEFAULT_IP% reboot

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
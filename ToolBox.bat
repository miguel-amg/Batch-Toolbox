@echo off
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: WARNING: Please run in fullscreen.                                                    ::
echo :: WARNING: Please run the program as admin for the full experience.                     ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: TIP : Do ctrl+c to stop the current command and return to the main menu               ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause
title Batch ToolBox

:: Variables
set host=%COMPUTERNAME%

:: Used ascii fonts (Label3d)/(banner3d) e (aligator2) https://onlineasciitools.com/convert-text-to-ascii-art, https://patorjk.com
:inicio
cls
echo. 
echo :::::::::::::::::::::::::::::::::::::::::::
echo :: Created by: Miguel Guimaraes.         ::
echo :: Created at: 28/05/2020.               ::
echo :::::::::::::::::::::::::::::::::::::::::::
echo.
echo - Current computer: %host%       
echo - Current date: %TIME%
echo.
pause
cls
echo. 
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo :: UPDATES:                                   ::
echo :: 29/07/2023 - Added saving to some commands ::
echo :: 17/07/2023 - Full english translation and  ::
echo :: overall polish                             ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause

:: MAIN MENU 
:base
cls
color 7
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo '########::'#######:::'#######::'##::::::::::'########:::'#######::'##::::'##:::
echo ... ##..::'##.... ##:'##.... ##: ##:::::::::: ##.... ##:'##.... ##:. ##::'##::::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##::. ##'##:::::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ########:: ##:::: ##:::. ###::::::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##.... ##: ##:::: ##::: ## ##:::::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##:: ##:. ##::::
echo ::: ##::::. #######::. #######:: ########:::: ########::. #######:: ##:::. ##:::
echo :::..::::::.......::::.......:::........:::::........::::.......:::..:::::..::::
echo.
echo.
echo ::::::::::::::::::::::::::::::::::::::::  :::::::::::::::::::::::::::::::::::::: 
echo ::            NETWORK TOOLS           ::  ::          PINGING TOOLS           ::
echo ::....................................::  ::..................................::
echo ::                                    ::  ::                                  ::
echo ::  1- Stored wifi network info       ::  ::  6- Execute ping                 ::
echo ::  2- IP info                        ::  ::  7- Trace route ping             ::
echo ::  3- Get ip adress from a website   ::  ::                                  ::
echo ::  4- DNS flush                      ::  :::::::::::::::::::::::::::::::::::::: 
echo ::  5- Close pc on the same network   :: 
echo ::                                    :: 
echo ::::::::::::::::::::::::::::::::::::::::  
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo ::                                 SYSTEM TOOLS                               ::
echo ::............................................................................:: 
echo ::                                                                            ::
echo ::  8-  Full drivers list                                                     ::
echo ::  9-  Full computer info                                                    ::
echo ::  10- List of all opened programs                                           ::
echo ::  11- Force kill program                                                    ::
echo ::  12- Repair corrupt files                                         [ADMIN]  :: 
echo ::  13- Search battery problems                                      [ADMIN]  ::  
echo ::  14- Check and repair disk problems                               [ADMIN]  ::     
echo ::                                                                            ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo ::                                 OTHER TOOLS                                ::
echo ::............................................................................:: 
echo ::                                                                            ::
echo ::  15- Pendrive virus removal tool                                  [ADMIN]  ::  
echo ::                                                                            :: 
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo Write the corresponding option number.
Set /p escolhax=" Select: "
echo.
pause
If /I "%escolhax%"=="1" goto passwifi
If /I "%escolhax%"=="2" goto qualip 
If /I "%escolhax%"=="3" goto websiteip  
If /I "%escolhax%"=="4" goto dnsflushing
If /I "%escolhax%"=="5" goto desligar
If /I "%escolhax%"=="6" goto pingstart
If /I "%escolhax%"=="7" goto pingtracar
If /I "%escolhax%"=="8" goto driverstart
If /I "%escolhax%"=="9" goto infosys
If /I "%escolhax%"=="10" goto programasstart
If /I "%escolhax%"=="11" goto programamatar
If /I "%escolhax%"=="12" goto scanficheiros
If /I "%escolhax%"=="13" goto batscan
If /I "%escolhax%"=="14" goto discoscan
If /I "%escolhax%"=="15" goto viruspen
If /I "%escolhax%"=="exit" exit
goto fail


:::::::::::::::::::: SAVING MODULE :::::::::::::::::::: 
:gravar
echo Save output on .txt file?
Set /p escolhatxt="(y/n): "
If /I "%escolhatxt%"=="y" goto txtgravar
If /I "%escolhatxt%"=="n" goto base
pause
cls
Echo Error: Option not recognized.
echo.
pause
cls
goto gravar

:txtgravar
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo :: Admin privileges will be required!  ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
echo.
echo Where will the .txt be saved?
echo Ex:(C:\Users\Utilizador\Desktop\)
Set /p caminho="Caminho: "
cd %caminho%

:: Gravar dependendo do comando que foi executado
If /I "%escolhax%"=="ip" ipconfig > Ipconfig.txt
If /I "%escolhax%"=="drivers" driverquery > Drivers.txt
If /I "%escolhax%"=="infosis" systeminfo > PCInfo.txt

goto base

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

:passwifi
cls
echo.
echo '##:::::'##:'####:'########:'####::::'####:'##::: ##:'########::'#######::
echo  ##:'##: ##:. ##:: ##.....::. ##:::::. ##:: ###:: ##: ##.....::'##.... ##:
echo  ##: ##: ##:: ##:: ##:::::::: ##:::::: ##:: ####: ##: ##::::::: ##:::: ##:
echo  ##: ##: ##:: ##:: ######:::: ##:::::: ##:: ## ## ##: ######::: ##:::: ##:
echo  ##: ##: ##:: ##:: ##...::::: ##:::::: ##:: ##. ####: ##...:::: ##:::: ##:
echo  ##: ##: ##:: ##:: ##:::::::: ##:::::: ##:: ##:. ###: ##::::::: ##:::: ##:
echo . ###. ###::'####: ##:::::::'####::::'####: ##::. ##: ##:::::::. #######::
echo :...::...:::....::..::::::::....:::::....::..::::..::..:::::::::.......:::    
echo.  
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
NETSH WLAN SHOW PROFILE 
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo Inser the network between quotes like the following example: "network_name".
Set /p passescolha= "Select the network: "
echo. 
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
NETSH WLAN SHOW PROFILE ""%passescolha%"" KEY=CLEAR 
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
goto base

:qualip
cls
echo.
echo '####:'########:::::'####:'##::: ##:'########::'#######::
echo . ##:: ##.... ##::::. ##:: ###:: ##: ##.....::'##.... ##:
echo : ##:: ##:::: ##::::: ##:: ####: ##: ##::::::: ##:::: ##:
echo : ##:: ########:::::: ##:: ## ## ##: ######::: ##:::: ##:
echo : ##:: ##.....::::::: ##:: ##. ####: ##...:::: ##:::: ##:
echo : ##:: ##:::::::::::: ##:: ##:. ###: ##::::::: ##:::: ##:
echo '####: ##:::::::::::'####: ##::. ##: ##:::::::. #######::
echo ....::..::::::::::::....::..::::..::..:::::::::.......:::      
echo.                       
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ipconfig
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
goto gravar


:websiteip
cls
echo '##:::::'##:'########:'########:::'######::'####:'########:'########::::'####:'########::
echo  ##:'##: ##: ##.....:: ##.... ##:'##... ##:. ##::... ##..:: ##.....:::::. ##:: ##.... ##:
echo  ##: ##: ##: ##::::::: ##:::: ##: ##:::..::: ##::::: ##:::: ##::::::::::: ##:: ##:::: ##:
echo  ##: ##: ##: ######::: ########::. ######::: ##::::: ##:::: ######::::::: ##:: ########::
echo  ##: ##: ##: ##...:::: ##.... ##::..... ##:: ##::::: ##:::: ##...:::::::: ##:: ##.....:::
echo  ##: ##: ##: ##::::::: ##:::: ##:'##::: ##:: ##::::: ##:::: ##::::::::::: ##:: ##::::::::
echo . ###. ###:: ########: ########::. ######::'####:::: ##:::: ########::::'####: ##::::::::
echo :...::...:::........::........::::......:::....:::::..:::::........:::::....::..:::::::::
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Write the website name:
Set /p escolhaweb="Select: "
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Website ip adress: %escolhaweb% 
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
nslookup %escolhaweb%
echo.
pause
goto base

:pingstart
cls
echo Write the ip adress to ping:
Set /p escolhaping="Select: "
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Website ip adress: %escolhaweb% 
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
ping %escolhaping%
echo.
pause
goto base

:driverstart
cls
echo '########::'########::'####:'##::::'##:'########:'########:::'######::
echo  ##.... ##: ##.... ##:. ##:: ##:::: ##: ##.....:: ##.... ##:'##... ##:
echo  ##:::: ##: ##:::: ##:: ##:: ##:::: ##: ##::::::: ##:::: ##: ##:::..::
echo  ##:::: ##: ########::: ##:: ##:::: ##: ######::: ########::. ######::
echo  ##:::: ##: ##.. ##:::: ##::. ##:: ##:: ##...:::: ##.. ##::::..... ##:
echo  ##:::: ##: ##::. ##::: ##:::. ## ##::: ##::::::: ##::. ##::'##::: ##:
echo  ########:: ##:::. ##:'####:::. ###:::: ########: ##:::. ##:. ######::
echo ........:::..:::::..::....:::::...:::::........::..:::::..:::......:::
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                          All intalled drivers                               ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
driverquery
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause
goto gravar

:programasstart
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                           All running programs                              ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
tasklist
echo.
pause
goto base

:programamatar
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                           All running programs                              ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
tasklist
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Insert the PID of the program to be terminated
Set /p pidmatar="PID: "
cls
echo Kill the following program:
echo.
tasklist /fi "pid eq %pidmatar%" 
echo.
taskkill /pid %pidmatar%
pause
goto base

:infosys
cls 
echo '########:::'######:::::'####:'##::: ##:'########::'#######::
echo  ##.... ##:'##... ##::::. ##:: ###:: ##: ##.....::'##.... ##:
echo  ##:::: ##: ##:::..:::::: ##:: ####: ##: ##::::::: ##:::: ##:
echo  ########:: ##::::::::::: ##:: ## ## ##: ######::: ##:::: ##:
echo  ##.....::: ##::::::::::: ##:: ##. ####: ##...:::: ##:::: ##:
echo  ##:::::::: ##::: ##::::: ##:: ##:. ###: ##::::::: ##:::: ##:
echo  ##::::::::. ######:::::'####: ##::. ##: ##:::::::. #######::
echo ..::::::::::......::::::....::..::::..::..:::::::::.......:::
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
msinfo32
systeminfo
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
goto gravar

:pingtracar
cls 
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Set /p tracarpingip="Write IP: "
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
cls
pathping %tracarpingip%
pause
goto base

:desligar
cls 
echo :::::::::::::::::::::::::::::::::::::::::
echo ::          Dialog box opened          ::
echo :::::::::::::::::::::::::::::::::::::::::
shutdown -i
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::          Dialog box closed          ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
goto base

:scanficheiros
cls 
echo :::::::::::::::::::::::::::::::::::::::::
echo :: Admin privileges will be required!  ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::           Starting scan             ::
echo :::::::::::::::::::::::::::::::::::::::::
echo.
sfc /scannow
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::           Scan terminated           ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
goto base

:dnsflushing
cls 
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: The dns flush command helps solve some conectivity problems. ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Starting dns flush          ::
echo :::::::::::::::::::::::::::::::::::::::::
echo.
ipconfig /flushdns
echo.
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Dns flush finished          ::
echo :::::::::::::::::::::::::::::::::::::::::
pause 
cls
goto base

:viruspen
cls 
echo :::::::::::::::::::::::::::::::::::::::::
echo :: Admin privileges will be required!  ::
echo :::::::::::::::::::::::::::::::::::::::::
echo.
pause 
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Pendrive virus removal tool.                                         ::
echo :: Before starting the procedure i will explain how it will be executed ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause 
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Most pendrive viruses are hidden from the user.                                 ::
echo :: These viruses make the pendrive seem empty almost like all content got deleted. ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause 
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: To remove the virus we will take the following steps:                             ::
echo :: 1 - Identify the pendrive (The pendrive path).                                    ::
echo :: 2 - Show the files inside the pendrive to check if the files were deleted.        ::
echo :: 3 - Make all files inside the pendrive visible again.                             ::
echo :: 4 - Identify and delete the cause of the problem (virus).                         ::
echo ::                                                                                   ::
echo :: The process above has been simplified and every step will be explained further.   ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: First step: Identify the pendrive (The pendrive path).     ::
echo ::                                                            ::
echo :: What is the path to the pendrive? (ex:  D: , E: , etc...)  ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
Set /p caminho="Write the path: "
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Path registered: %caminho%
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%caminho%
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Second step: Show the files inside the pendrive.                 ::
echo ::                                                                  ::
echo :: With this step we are going to check if any files were deleted.  ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause
cls
attrib
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Third step: Make all files inside the pendrive visible.  ::    
echo :: This step will be executed automatically.                ::
echo ::                                                          ::
echo :: Warning: Administrator privileges are needed.            ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause
cls
attrib -r -a -s -h *.*
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Command executed!           ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Fourth step: Identify and delete the virus.                            ::
echo ::                                                                        ::
echo :: Explanation: Now we are going to hunt the virus.                       ::
echo :: All files inside the pendrive will be listed on this terminal and now  ::
echo :: we are going to try and find any suspicious files inside the pendrive. ::
echo ::                                                                        ::
echo :: This step wont be automatic as viruses come with various names.        ::
echo :: So you will need to find it and write its name in here so we can force ::
echo :: delete it.                                                             ::
echo ::                                                                        ::
echo :: Examples of virus names: Autorun.inf , Ravmon.exe, New folder.exe      ::
echo :: , svchost.exe, Heap41a, and many more...                               ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo
pause
cls 
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: File list:                                                             ::
echo ::                                                                        ::
echo :: The virus may have one of the following names:                         ::
echo :: Ex: Autorun.inf , Ravmon.exe, New folder.exe, svchost.exe, Heap41a, .. ::
echo ::                                                                        ::
echo :: Skip this step when ready.                                             ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
attrib
pause 
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: Now we are going to force delete the virus.                             ::
echo :: Insert the full virus name including its extension name Ex: exemple.exe ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Set /p virus="Complete virus name: "
pause 
cls 
del %virus%
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Command executed!           ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                 FINISHED!                                ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                          ::
echo :: Now all files are visible again and the virus was removed.               ::
echo :: In some cases this tool might not work because viruses are in constant   ::
echo :: evolution.                                                               ::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
cls
goto base

:batscan
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo :: Admin privileges will be required!  ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
powercfg /energy
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Command executed!           ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
goto base

:discoscan
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo :: Admin privileges will be required!  ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
chkdsk
pause
cls
echo :::::::::::::::::::::::::::::::::::::::::
echo ::         Command executed!           ::
echo :::::::::::::::::::::::::::::::::::::::::
pause
cls
goto base

:fail
cls
color C
echo :::::::::: :::::::::  :::::::::   ::::::::  :::::::::  ::: 
echo :+:        :+:    :+: :+:    :+: :+:    :+: :+:    :+: :+: 
echo +:+        +:+    +:+ +:+    +:+ +:+    +:+ +:+    +:+ +:+ 
echo +#++:++#   +#++:++#:  +#++:++#:  +#+    +:+ +#++:++#:  +#+ 
echo +#+        +#+    +#+ +#+    +#+ +#+    +#+ +#+    +#+ +#+ 
echo #+#        #+#    #+# #+#    #+# #+#    #+# #+#    #+#     
echo ########## ###    ### ###    ###  ########  ###    ### ###  
echo __________________________________________________________
echo Command not recognized!
echo Write the number before the option.
echo __________________________________________________________
echo. 
pause
goto base
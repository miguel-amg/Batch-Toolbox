@echo off
pause
title ToolBox

::variaveis
set host=%COMPUTERNAME%

::Fonte ascii (Label3d) e (aligator2) https://onlineasciitools.com/convert-text-to-ascii-art
:inicio
cls
echo. 
echo .####.##....##.####..######..####..#######.
echo ..##..###...##..##..##....##..##..##.....##
echo ..##..####..##..##..##........##..##.....##
echo ..##..##.##.##..##..##........##..##.....##
echo ..##..##..####..##..##........##..##.....##
echo ..##..##...###..##..##....##..##..##.....##
echo .####.##....##.####..######..####..#######.
echo ____________________________________________
echo Por: Miguel Guimaraes
echo Criado em: 28/05/2020.
echo ____________________________________________
echo PC atual: %host%
echo Data: %TIME%
echo.
echo AVISO: E recomendado executar em tela cheia.
echo _____________________________________________
echo.
pause

:: MENU PRINCIPAL
:base
cls
color 7
echo '########::'#######:::'#######::'##::::::::::'########:::'#######::'##::::'##:
echo ... ##..::'##.... ##:'##.... ##: ##:::::::::: ##.... ##:'##.... ##:. ##::'##::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##::. ##'##:::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ########:: ##:::: ##:::. ###::::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##.... ##: ##:::: ##::: ## ##:::
echo ::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##:: ##:. ##::
echo ::: ##::::. #######::. #######:: ########:::: ########::. #######:: ##:::. ##:
echo :::..::::::.......::::.......:::........:::::........::::.......:::..:::::..::                                      
echo ______________________________________________________________________________   
echo.                            
echo \--------------------------\ Ferramentas de rede: \--------------------------\
echo.
echo -Palavras-passe wifi armazenadas                                      (chaves)
echo -Informacoes IP                                                           (ip)
echo -Obter ip de um website                                                (webip)
echo -Flush de DNS                                                            (dns)
echo -Encerrar um Pc na mesma rede                                         (pcshut)
echo.
echo \--------------------------\ Ferramentas de Ping: \--------------------------\
echo.
echo -Fazer ping a um ip                                                   (pingip)
echo -Tracar ping                                                        (pingtrac)
echo.
echo \--------------------------\ Informacoes do sistema: \-----------------------\
echo.
echo -Listar todos os Drivers                                             (drivers)
echo -Informacoes do sistema                                              (infosis)
echo -Listar programas abertos                                          (programas)
echo -Matar programa                                                    (progmatar)
echo -Reparar ficheiros corruptos                               [ADMIN]  (filescan) 
echo -Procurar problemas de bateria                             [ADMIN]   (bateria) 
echo -Verificar e reparar problemas de disco                    [ADMIN]     (disco) 
echo.
echo \--------------------------\ Anti-Virus (Ferramentas): \---------------------\
echo.
echo -Remocao de virus comuns de pendrive                       [ADMIN]  (penvirus)
echo.
echo ______________________________________________________________________________
echo.
echo Digitar a (chave) da opcao:
Set /p escolhax=" Selecionar: "
echo.
pause
If /I "%escolhax%"=="chaves" goto passwifi
If /I "%escolhax%"=="ip" goto qualip 
If /I "%escolhax%"=="webip" goto websiteip  
If /I "%escolhax%"=="pingip" goto pingstart
If /I "%escolhax%"=="drivers" goto driverstart
If /I "%escolhax%"=="programas" goto programasstart
If /I "%escolhax%"=="progmatar" goto programamatar
If /I "%escolhax%"=="pingtrac" goto pingtracar
If /I "%escolhax%"=="infosis" goto infosys
If /I "%escolhax%"=="pcshut" goto desligar
If /I "%escolhax%"=="filescan" goto scanficheiros
If /I "%escolhax%"=="dns" goto dnsflushing
If /I "%escolhax%"=="penvirus" goto viruspen
If /I "%escolhax%"=="bateria" goto batscan
If /I "%escolhax%"=="disco" goto discoscan
If /I "%escolhax%"=="sair" exit
goto fail

:passwifi
cls
echo ########::'########:'########::'########::'######::
echo ##.... ##: ##.....:: ##.... ##: ##.....::'##... ##:
echo ##:::: ##: ##::::::: ##:::: ##: ##::::::: ##:::..::
echo ########:: ######::: ##:::: ##: ######:::. ######::
echo ##.. ##::: ##...:::: ##:::: ##: ##...:::::..... ##:
echo ##::. ##:: ##::::::: ##:::: ##: ##:::::::'##::: ##:
echo ##:::. ##: ########: ########:: ########:. ######::
echo ..:::::..::........::........:::........:::......:::            
echo _________________________________________________________________________________
NETSH WLAN SHOW PROFILE 
echo _________________________________________________________________________________
echo.
echo As vezes e preciso por "rede"
Set /p passescolha= "Selecionar rede: "
echo. 
pause
cls
echo _________________________________________________________________________________
NETSH WLAN SHOW PROFILE ""%passescolha%"" KEY=CLEAR 
echo _________________________________________________________________________________
pause
goto base

:qualip
cls
echo.
echo '####:'##::: ##:'########::'#######:::::'########::'########:'########::'########:
echo . ##:: ###:: ##: ##.....::'##.... ##:::: ##.... ##: ##.....:: ##.... ##: ##.....::
echo : ##:: ####: ##: ##::::::: ##:::: ##:::: ##:::: ##: ##::::::: ##:::: ##: ##:::::::
echo : ##:: ## ## ##: ######::: ##:::: ##:::: ########:: ######::: ##:::: ##: ######:::
echo : ##:: ##. ####: ##...:::: ##:::: ##:::: ##.. ##::: ##...:::: ##:::: ##: ##...::::
echo : ##:: ##:. ###: ##::::::: ##:::: ##:::: ##::. ##:: ##::::::: ##:::: ##: ##:::::::
echo '####: ##::. ##: ##:::::::. #######::::: ##:::. ##: ########: ########:: ########:
echo ....::..::::..::..:::::::::.......::::::..:::::..::........::........:::........::                               
echo _________________________________________________________________________________
ipconfig
echo _________________________________________________________________________________
echo.
echo.
:denovotxt
echo Gravar informacoes em documento de texto?
Set /p escolhatxt="(s/n): "
If /I "%escolhatxt%"=="s" goto txtgravar
If /I "%escolhatxt%"=="n" goto base
pause
cls
Echo Erro opcao nao reconhecida
echo.
pause
cls
goto denovotxt

:txtgravar
echo.
echo Onde quer gravar o ficheiro .txt?
echo Ex:(C:\Users\Utilizador\Desktop\)
Set /p caminho="Caminho: "
cd %caminho%
ipconfig > Ipconfig.txt
gotobase

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
echo _________________________________________________________________________________________
echo Digitar o link do website:
Set /p escolhaweb="Selecionar: "
cls
echo _________________________________________________________________________________
echo Ip do Website %escolhaweb% 
echo _________________________________________________________________________________
echo.
nslookup %escolhaweb%
echo.
pause
goto base

:pingstart
cls
echo Digitar o ip para fazer ping:
Set /p escolhaping="Selecionar: "
cls
echo _________________________________________________________________________________
echo Ip do Website %escolhaweb% 
echo _________________________________________________________________________________
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
echo _________________________________________________________________________________
echo Lista de todos os drivers instalados:
echo _________________________________________________________________________________
echo.
driverquery
echo.
pause
goto base

:programasstart
cls
echo _________________________________________________________________________________
echo Lista de todos os programas abertos:
echo _________________________________________________________________________________
tasklist
echo.
pause
goto base

:programamatar
cls
echo _________________________________________________________________________________
echo Lista de todos os programas abertos:
echo _________________________________________________________________________________
tasklist
echo.
echo _________________________________________________________________________________
echo Inserir PID do programa a ser terminado:
Set /p pidmatar="PID: "
cls
echo Matar o seguinte processo:
echo.
tasklist /fi "pid eq %pidmatar%" 
echo.
taskkill /pid %pidmatar%
pause
goto base

:infosys
cls 
echo _________________________________________________________________________________
echo Informacoes do PC
echo _________________________________________________________________________________
msinfo32
systeminfo
pause
goto base

:pingtracar
cls 
echo _________________________________________________________________________________
Set /p tracarpingip="Digitar Ip: "
echo _________________________________________________________________________________
pause
cls
pathping %tracarpingip%
pause
goto base

:desligar
cls 
echo ________________
echo Iniciando...
echo ________________
shutdown -i
cls
echo ________________
echo Dialogo fechado.
echo ________________
pause
cls
goto base

:scanficheiros
cls 
echo Este comando necessita de permissao de administrador!
pause
cls
echo ___________________
echo Iniciando o scan...
echo ___________________
echo.
sfc /scannow
pause
cls
echo ________________
echo Scan terminado.
echo ________________
pause
cls
goto base

:dnsflushing
cls 
echo O flush de DNS ajuda a resolver de problemas de conetividade a internet.
pause
cls
echo ______________________
echo Iniciando o flush dns.
echo ______________________
ipconfig /flushdns
cls
echo ______________________
echo Flush dns terminado.
echo ______________________
pause 
cls
goto base

:viruspen
cls 
echo _______________________________________________________
echo Sera necessaria permissao de administrador!
echo _______________________________________________________
echo.
pause 
cls
echo _________________________________________________________________________
echo Ferramenta de remocao de virus de pen.
echo Antes de iniciarmos o procedimento temos uma pequena explicacao do mesmo.
echo _________________________________________________________________________
echo.
pause 
cls
echo ________________________________________________________________________________________________________
echo Os virus mais comuns de pendrive geralmente encontram-se escondidos do utilizador (hidden).
echo Estes virus podem fazer com que uma pen inteira pareca vazia e que todos os ficheiros foram eliminados.
echo No entanto os ficheiros do utilizador podem estar apenas escondidos do mesmo.
echo ________________________________________________________________________________________________________
echo.
pause 
cls
echo __________________________________________________________________________
echo O procedimento para remover o virus sera o seguinte:
echo - Primeiro: Indentificar o pendrive. (O caminho para o pendrive)
echo - Segundo: Listar os ficheiros dentro da pen.
echo - Terceiro: Colocar todos os ficheiros dentro da pen visiveis.
echo - Quarto: Identificar e eleminar o virus.
echo.
echo - Todo o processo foi simplificado.
echo __________________________________________________________________________
echo.
pause
cls
echo __________________________________________________________________________
echo Primeiro passo: Indentificar o Pendrive
echo.
echo Qual e o caminho da pen? (ex:  D: , E: , etc...)
echo __________________________________________________________________________
echo.
Set /p caminho="Selecionar caminho: "
pause
cls
echo __________________________________________________________________________
echo Caminho da pen registado: %caminho%
echo __________________________________________________________________________
%caminho%
pause
cls
echo __________________________________________________________________________
echo Segundo passo: Listar os ficheiros dentro da pen
echo.
echo Explicacao:
echo -Com este passo vamos verificar os ficheiros que se encontram efetivamente
echo dentro da pen (mesmo estando ocultos)
echo -Este passo serve apenas para ter a certeza que o virus nao eleminou ficheiros
echo ___________________________________________________________________________
echo.
pause
cls
attrib
pause
cls
echo __________________________________________________________________________
echo Terceiro passo: Colocar todos os ficheiros dentro da pen visiveis.
echo -Este passo sera automatico..
echo.
echo Atencao: Sera necessaria a permisssao de administrador!
echo __________________________________________________________________________
echo.
pause
cls
attrib -r -a -s -h *.*
pause
cls
echo __________________
echo Comando executado
echo __________________
pause
cls
echo __________________________________________________________________________
echo Quarto passo: Identificar e eleminar o virus
echo.
echo Explicacao: Agora vamos procurar o virus. 
echo Para isso iremos listar tudo o que se encontra dentro da pen.
echo Para este passo resultar sera necessario procurar o virus em si.
echo Caso algum ficheiro pareca suspeito teremos que eliminar a seguir.
echo.
echo Este passo nao podera ser automatizado pois depende de caso para caso 
echo.
echo Exemplos: Autorun.inf , Ravmon.exe, New folder.exe, svchost.exe, Heap41a
echo , entre outros...
echo __________________________________________________________________________
echo.
echo
pause
cls 
echo __________________________________________________________________________
echo Lista de ficheiros:
echo.
echo O ficheiro malicioso podera ter os seguintes nomes: 
echo Ex: Autorun.inf , Ravmon.exe, New folder.exe, svchost.exe, Heap41a, ...
echo. 
echo Avancar para o proximo passo quando tiver a certeza.
echo __________________________________________________________________________
echo.
attrib
pause 
cls
echo __________________________________________________________________________
echo Agora vamos eleminar o ficheiro malicioso
echo Inserir o nome do virus incluindo a extencao. Ex: exemplo.exe
echo __________________________________________________________________________
Set /p virus="Nome do virus completo: "
pause 
cls 
del %virus%
echo __________________
echo Comando executado
echo __________________
pause
cls
echo ___________________________________________________________________________
echo Processo terminado
echo.
echo Agora os ficheiros encontram-se visiveis e o virus foi removido.
echo Em certos casos esta ferramenta podera nao funcionar pois os virus
echo estao em constante evolucao e a ferramenta podera ser obsoleta para estes.
echo ___________________________________________________________________________
pause
cls
goto base

:batscan
cls
echo _______________________________________________________
echo Este comando necessita de permissao de administrador!
echo _______________________________________________________
pause
cls
echo __________________
echo Commando executado
echo __________________
powercfg /energy
pause
cls
goto base

:discoscan
cls
echo _______________________________________________________
echo Este comando necessita de permissao de administrador!
echo _______________________________________________________
pause
cls
chkdsk
pause
cls
echo __________________
echo Commando executado
echo __________________
pause
cls
goto base

:fail
cls
color C
echo :::::::::: :::::::::  :::::::::   ::::::::  
echo :+:        :+:    :+: :+:    :+: :+:    :+: 
echo +:+        +:+    +:+ +:+    +:+ +:+    +:+ 
echo +#++:++#   +#++:++#:  +#++:++#:  +#+    +:+ 
echo +#+        +#+    +#+ +#+    +#+ +#+    +#+ 
echo #+#        #+#    #+# #+#    #+# #+#    #+# 
echo ########## ###    ### ###    ###  ########  
echo ___________________________________________
echo Comando nao reconhecido!
echo Digitar a opcao dentro dos parenteses (...)
echo ___________________________________________
echo. 
pause
goto base
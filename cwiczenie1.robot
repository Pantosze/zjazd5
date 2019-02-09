***settings***
Library    SSHLibrary
Library    Selenium2Library

***Variables***
${moja zmienna} zmienna1
${REMOTE_HOST}    127.0.0.1
${REMOTE_USERNAME}    tester
${REMOTE_PASSWORD}    tester    
${Login}  //*[@id="login"]        
${Haslo}  //*[@id="password"]
${PB_logowanie}    //*[@id="btnSubmit"]

*** Test Cases ***
elokwentna nazwa cwiczenia
    Log to Console   Hello, test 1
elokwenta nazwa cwiczenia 2
    My log
elokwentna nazwa cwiczenia 3
    My log
Wywolanie komendy uname 
    otworz polaczenie do zdalnego komputera
    zaloguj sie
    wywolanie komendy i sprawdzenie poprawnosci jej dzialania
    zamkniecie polaczenia
Logowanie do poczty Selenium
    Otworzenie przegladarki 
    Wchodzimy na strone poczta.wp.pl
    Wprowadz poprawny login
    Zalogowanie sie
    Sprawdzenie czy zostalismy zalogowani
    Wylaczenie przegladarki
    

*** Keyword ***
My log 
    Log to console    Hello, test 1
My log 2
    [Arguments]   ${moja zmienna}
    Log to console   ${moja zmienna}
otworz polaczenie do zdalnego komputera
    Open Connection    ${REMOTE_HOST}
zaloguj sie
    Login    ${REMOTE_USERNAME}    ${REMOTE_PASSWORD}
wywolanie komendy i sprawdzenie poprawnosci jej dzialania
    ${rc}=    Execute Command    uname -a
    Should Not Be Empty    0    
zamkniecie polaczenia
    Close All Connections


Otworzenie przegladarki
    Open Browser    https://profil.wp.pl/login.html?zaloguj=poczta
Wchodzimy na strone poczta.wp.pl
    Go To    https://profil.wp.pl/login.html?zaloguj=poczta
Wprowadz poprawny Login
    Input Text    ${Login}    testerwsb_t1
    Input Text    ${Haslo}    adam1234
Zalogowanie sie
    Click Button    ${PB_logowanie}
Sprawdzenie czy zostalismy zalogowani
    Page Should Contain    Odebrane    
    Sleep    10
Wylaczenie przegladarki
    Close Browser        

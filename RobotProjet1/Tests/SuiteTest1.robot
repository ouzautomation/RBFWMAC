*** Settings ***
Library    SeleniumLibrary  
Library    SikuliLibrary
#Library    AppiumLibrary    
#Suite Setup    Open Browser    https://www.katalon.com/    safari
#Suite Teardown    Close Browser
#Resource    seleniumLibrary.robot
#Suite Setup  AppiumLibrary.Open Application  localhost:4723/wd/hub
#
#            ...  platformName=Android
#           ...  deviceName=Pixel C API 27
#          ...  udid=Pixel_C_API_27
#         ...  app=/Users/sane028711/Desktop/app-debug.apk
#Suite Teardown  AppiumLibrary.Close Application

*** Variable ***
${url_espaceclient}    https://espaceclient.orange.sn
${intrancom_prod}    https://intracom.orange-sonatel.com/
${intracom_recette}    http://intracom.rec.orange-sonatel.com/    


#${DEV.APPIUM_SERVER}  http://127.0.0.1:4723/wd/hub
#${DEV.PLATFORM_VERSION}  8.1
#${DEV.PLATFORM_NAME}    app-debug
#${DEV.DEVICE_NAME}     Pixel_2_XL_API_27
#${DEV.PACKAGE_NAME}    com.android.calculator2
#${DEV.ACTIVITY_NAME}   com.android.calculator2.Calculator
#${EQUALS_SIGN}      xpath=//*[contanis(@text,'=')]
#${DISPLAYED_RESULT}    xpath=//*[contanis(@resource-id,'id/result')]
#${td_Digit1}  5
#${td_Digit2}   2
#${td_Expected_Addition_Result}   7
#${td_Expected_Subtraction_Result}    3  
${undefined}    https://www.katalon.com/             
*** Test Cases ***
#Test0
 #  AppiumLibrary.Open Application  http://localhost:4723/wd/hub
  #           ...  platformName=Android
   #          ...  platformVersion=8.1  
    #         ...  automationName=uiautomator2
     #        ...  deviceName=Pixel C API 27
      #       ...  udid=Pixel_C_API_27
       #      ...  app=/Users/sane028711/Desktop/app-debug.apk
 # AppiumLibrary.Close Application
    
Test1
    [Documentation]    connexion avec des params invalides sur l'espace client d'orange
    Open Browser       ${url_espaceclient}     safari
    Maximize Browser Window
    Sleep    2 
    LOG KO
    Page Should Contain    Mot de   
    Sleep    3
   # Log     utilisateur inexistant
    Close Browser
Test2
    [Documentation]    connexion valide sur l'espace client d'orange
    Open Browser      ${url_espaceclient}     safari
    Maximize Browser Window
    sleep   3
    LOG OK
    Page Should Contain    Bienvenue    
    sleep    3
  #  SeleniumLibrary.Click Element    xpath=//*[@id="o_navigation"]/ul/li/ul/li[2]/a
   # sleep   2
  #  SeleniumLibrary.Input Text        name=prenom  ${EMPTY}
   # sleep   2
   # SeleniumLibrary.Input Text        name=prenom   Ousin
   # en bas bouton modifier
   # SeleniumLibrary.Click Button      name=envoyer
   # sleep   2
    # en bas pour deconnexion
    SeleniumLibrary.Click Element     xpath=//*[@id="post-658"]/div/div/table/tbody/tr/td/a/b
    sleep   2
    Close Browser
Test3
     #Test formulaire de déclaration de perte sur intracom
     #Se connecter à intracom
     Open Browser    ${intrancom_prod}   safari
     Maximize Browser Window
     Sleep       5
     # boutton pour se connecter ne marche toujours pas
     # SeleniumLibrary. est du au fait que Appium aussi a le mot clé Click Element
     SeleniumLibrary.Click Element    xpath=/html/body/nav/div/div/div/ul/li/a
     sleep    3
     SeleniumLibrary.Input Text    id=edit-name-or-mail    sane028711
     SeleniumLibrary.Input Password     id=edit-pass  ousinPWD-7531
     SeleniumLibrary.Click Button    id=edit-submit
     sleep  3
    #Open Browser    http://intracom.orange-sonatel.com/form/declaration-de-perte  safari
    #Title Should Be     ****
    SeleniumLibrary.Click Element    xpath=//*[@id="main-navigation"]/div/ul/li[2]/a
    sleep  2
    SeleniumLibrary.Input Text    id=edit-titre    Perte Argent
    SeleniumLibrary.Click Element   xpath=//*[@id="edit-type-d-objet"]/div[1]/label
    SeleniumLibrary.Input Text   id=edit-description    Perte somme argent de 45000FCFA CECI EST UN TEST MERCI IGNORE
   # Click Element   id=edit-image-upload    /Users/sane028711/Desktop/ouz.gpeg
    #choix date ici
    SeleniumLibrary.Click Element    id=edit-date
    SeleniumLibrary.Click Element     xpath=//*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[2]/a
    SeleniumLibrary.Input Text    id=edit-site    ACAD
    SeleniumLibrary.Input Text    id=edit-telephone    774590750
    SeleniumLibrary.Click Button    id=edit-submit
    sleep  3
    Close Browser
    
Test4
    [Documentation]    declaration de perte d'objet
     Open Browser    ${intracom_recette}   safari
     Maximize Browser Window
     Sleep       5
     # boutton pour se connecter ne marche toujours pas
     SeleniumLibrary.Click Element    xpath=/html/body/nav/div/div/div/ul/li/a
     sleep    3
     # Se connecter avec de bons paramètre
     GOOD LOGIN
     sleep  3
    # Cliquer sur l'onglet Objets Perdus
    SeleniumLibrary.Click Element    xpath=//*[@id="main-navigation"]/div/ul/li[2]/a
    sleep  2
    DECLARATION PERTE ARGENT
    sleep  3
    Close Browser
    
#Test5  
 #   Log    "Entrer deux elements a additionner"
  #  Enter digit and Operator   ${td_Digit1}   ${td_Digit2}  +
   # Log   visualiser le resultat
    #view results   
    #Log    verifier result
    #verify results  ${td_Expected_Addition_Result}
    
    
*** Keywords ***
GOOD LOGIN
     SeleniumLibrary.Input Text    id=edit-name-or-mail    sane028711
     SeleniumLibrary.Input Password     id=edit-pass  ousinPWD-7531
     SeleniumLibrary.Click Button    id=edit-submit
     
LOG KO
    SeleniumLibrary.Input Text        name=login   moussa
    SeleniumLibrary.Input Password    name=pwd     12345
    SeleniumLibrary.Click Button      name=envoyer
    
LOG OK
    SeleniumLibrary.Input Text        name=login   774590750
    SeleniumLibrary.Input Password    name=pwd     ousinpwd7531
    SeleniumLibrary.Click Button      name=envoyer
    
DECLARATION PERTE ARGENT
    SeleniumLibrary.Input Text    id=edit-titre    Perte Argent
    SeleniumLibrary.Click Element   xpath=//*[@id="edit-type-d-objet"]/div[1]/label
    SeleniumLibrary.Input Text   id=edit-description    Perte somme argent de 45000FCFA CECI EST UN TEST MERCI IGNORE
    SeleniumLibrary.Click Element    id=edit-date
    SeleniumLibrary.Click Element     xpath=//*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[2]/a
    SeleniumLibrary.Input Text    id=edit-site    ACAD
    SeleniumLibrary.Input Text    id=edit-telephone    774590750
    SeleniumLibrary.Click Button    id=edit-submit
    
        
 Open Calculator App
    AppiumLibrary.Open Application    ${DEV.APPIUM_SERVER}    platformName=${DEV.PLATFORM_NAME}  platformVersion=${DEV.PLATFORM_VERSION}   deviceName=${DEV.DEVICE_NAME}  appPackage=${DEV.PACKAGE_NAME}    appActivity=${DEV.ACTIVITY_NAME}   
 Enter digit and Operator  
    [Arguments]    ${digit1}  ${digit2}  ${operator}
    AppiumLibrary.Click Element    xpath=//*[contanis(@text,'${digit1}')]
    AppiumLibrary.Click Element    xpath=//*[contanis(@text,'${operator}')]
    AppiumLibrary.Click Element    xpath=//*[contanis(@text,'${digit2}')]
    
view results
    AppiumLibrary.Click Element   ${EQUALS_SIGN} 
    
verify results
    [Arguments]     ${expected_result}
    ${displayed_result}=  AppiumLibrary.Get Element Attribute   ${DISPLAYED_RESULT}  text              
     Should Be Equal    ${displayed_result}  ${expected_result}
    
   
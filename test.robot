*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
test login

   Ouvrir Application


    Input Text   //android.widget.EditText[@content-desc="test-Username"]    standard_user
    Input Text   //android.widget.EditText[@content-desc="test-Password"]   secret_sauce
    Click Element  //android.view.ViewGroup[@content-desc="test-LOGIN"]
    Wait Until Element Is Visible  //android.widget.TextView[@text="ADD TO CART"][1]    3s
    Click Element    //android.widget.TextView[@text="ADD TO CART"][1]
    Click Element    //android.view.ViewGroup[@content-desc="test-Cart"]/android.view.ViewGroup/android.widget.ImageView
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
    Click Element    //android.widget.TextView[@text="CHECKOUT"]
    Wait Until Element Is Visible    //android.widget.TextView[@text="CHECKOUT: INFORMATION"]
    Input Text    //android.widget.EditText[@content-desc="test-First Name"]    soumia
    Input Text    //android.widget.EditText[@content-desc="test-Last Name"]   TARA
    Input Text    //android.widget.EditText[@content-desc="test-Zip/Postal Code"]    92220

    
test login invalid
    Ouvrir Application    

    Input Text   //android.widget.EditText[@content-desc="test-Username"]    standard_user12
    Input Text   //android.widget.EditText[@content-desc="test-Password"]   secret_sauce 
    Click Element  //android.view.ViewGroup[@content-desc="test-LOGIN"] 
    Wait Until Element Is Visible    //android.widget.TextView[@text="Username and password do not match any user in this service."] 
    Element Text Should Be    //android.widget.TextView[@text="Username and password do not match any user in this service."]    Username and password do not match any user in this service.

*** Keywords ***

Ouvrir Application
    Open Application      http://127.0.0.1:4723      	platformName=Android    
    ...    	platformVersion=15      deviceName=emulator-5554    appPackage=com.swaglabsmobileapp   
    ...      appActivity=com.swaglabsmobileapp.MainActivity     automationName=UiAutomator2
    

   

*** Settings ***
Documentation  ...
Library  SeleniumLibrary
Library  contextlib
Variables  ../TestCases/Locators.py
#Variables   ../TestCases/extraKeyWords.py
Variables  ../TestCases/url.py
Library           OperatingSystem
Library     Collections
Library  ../TestCases/extraKeyWords.py
Library    ExcelLibrary

*** Variables ***

${excel_file}     ../Downloads/login_creds.xlsx
${sheet_name}     Sheet1
*** Keywords ***

Launch E-Com WebSite
#    Log to console  Launching E-Com WebSite
    Open Browser    ${Loginurl}  Chrome
    maximize browser window
    sleep       2

Home Page contents
#    make_excel_file         Test1.xlsx

    @{Radio}=    Create List
    #@{Radio} = []
#    [E,G,P,V]

    FOR  ${i}   IN RANGE   4


         ${text}=    get text   //label[@for="pollanswers-${${i}+1}"]
         click element     //label[@for="pollanswers-${${i}+1}"]
         wait until element is visible   ${vote}
         click element                   ${vote}

         sleep  3
        wait until element is visible   ${alert_Mes}
        ${message}=     get text        ${alert_Mes}
         Log    ${text}

         append to list   ${Radio}    ${text}
         # 1 - [E]
         # 2 - [E, G]
         # 3 - [E,G,P]
         # 4 - [E,G,P,V] - 1 Dimensional list
         # 2D list [[E,G,P,V] - Customer service list, [E,G,P,V], [E,G,P,V], [E,G,P,V] ]
         Log   ${Radio}

   END

   Set Suite Variable   ${Radio}
   Log   ${Radio}[0]
   Log   ${Radio}[1]
   Log   ${Radio}[2]
   Log   ${Radio}[3]

    wait until element is visible   ${excellent_radio}
    click element                   ${excellent_radio}
    wait until element is visible   ${vote}
    click element                   ${vote}

    wait until element is visible   ${alert_Mes}
    ${message}=     get text        ${alert_Mes}

    sleep  2
    Log      ${message}

    ${footer_service}=  get element count   ${Customer_Service}
    Log     ${footer_service}

    @{footer_text}=     Create List
    @{foo1}=    Create List
    FOR     ${i}    IN RANGE  ${footer_service}

            ${foo_txt}=     get text     ${Customer_Service} [${${i}+1}]
            Log     ${foo_txt}
            append to list  ${footer_text}  ${foo_txt}

    END
    append to list  ${foo1}     ${footer_text}

    Log     ${footer_text}
    Set Suite Variable  ${foo1}


    Set Suite Variable  ${footer_text}

     ${info_foo}=  get element count   ${Info_Ser}
    Log     ${info_foo}

    @{info_footer}=     Create List

    FOR     ${i}    IN RANGE  ${info_foo}

            ${foo1_txt}=     get text     ${Info_Ser} [${${i}+1}]
            Log     ${foo1_txt}
            append to list  ${info_footer}  ${foo1_txt}

    END
    append to list  ${foo1}     ${info_footer}

    Log     ${info_footer}
    Set Suite Variable  ${foo1}

    log     ${foo1}
    Set Suite Variable  ${foo1}

    @{myAcc_list}=  Create list
    ${Myacc_cnt}=   get element count   ${MyAcc_ser}

    FOR     ${i}    IN RANGE    ${Myacc_cnt}

       ${foo3_txt}=  get text    ${MyAcc_ser} [${${i}+1}]

            append to list  ${myAcc_list}   ${foo3_txt}

    END

    Log     ${myAcc_list}

    append to list  ${foo1}     ${myAcc_list}

    Log     ${foo1}
    Set Suite Variable  ${myAcc_list}


Generate Excel File
    @{columns}    Create List    Information    Customer service    My account

    add_to_excel    Foote3.xlsx     footer_list     ${foo1}      ${columns}


Login link Test
    wait until element is visible      ${Login_Xpath}
    click element                   ${Login_Xpath}
    Capture Page Screenshot
    Capture Element Screenshot      ${Login_Xpath}
    element should be visible       ${Login_Xpath}
    ${get_text}=  get text        ${Login_Xpath}
    set Test variable  ${get_text_log}    Capture title: ${get_text}
    Log       ${get_text_log}

Click On Login Link
    wait until element is visible      ${Login_Xpath}
    click element                   ${Login_Xpath}

Enter Email Id
    wait until element is visible      ${Email_id}
    Input Text      ${Email_id}     vageesha.jm@gmail.com

Enter Password
    wait until element is visible      ${password_txt}
    Input Text      ${password_txt}     1234567890

Click On Login Button
    wait until element is visible      ${Login_btn}
    click element       ${Login_btn}

validate Login Error Msg
    wait until element is visible      ${Login_Error_msg}
   ${Login_Message}=  Get Text      ${Login_Error_msg}
   Log    Login Error Message: ${Login_Message}

Read Login Data from Excel



   ${data}     Get Row    ${sheet_name}    row=1
    ${email}    Set Variable    ${data}[0]
    ${password}    Set Variable    ${data}[1]

    # Enter email and password into the text input fields
    Input Text    ${Email_id}   ${email}
    Input Text    ${password_txt}    ${password}

    # Submit the form
    Click Button    ${Login_btn}


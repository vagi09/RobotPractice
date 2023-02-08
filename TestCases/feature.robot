*** Settings ***
Documentation  This is first program in robot framework
...            E-Commerece Website

Library  SeleniumLibrary
Variables   ../TestCases/extraKeyWords.py
Resource  ../TestCases/stepDef.robot
Library  String
Library  Collections
Library  DateTime
Library    ExcelLibrary

#Suite Setup  Run Keywords  Get Build Version  E-comeerce Website

Force Tags  robot:recursive-continue-on-failure

*** Variables ***

${excel_file}     C:/Users/manas/Downloads/login_creds.xlsx
${sheet_name}     Sheet1

*** Test Cases ***

To get build version
    Get build version


To Test Home Page Contents
    Test Home Page Elements
    Log  home page test===\n${Radio}\n===\n${footer_text}\n
    log list    ${foo1}[0]
    log list    ${foo1}[1]
    log list    ${foo1}[2]

To Test Login Page
    Login Page Test

To Verify LogIn Credentials
    Test Login Credentials

*** Settings ***
Documentation   Suite description
Resource    ../TestCases/KeyWords.robot
#Library  SeleniumLibrary
Variables  ../TestCases/Locators.py
Variables   ../TestCases/extraKeyWords.py
Variables  ../TestCases/url.py
Library    ExcelLibrary

*** Keywords ***

Get build version
    [Documentation]  This keyword gets build version
    Launch E-Com WebSite

Test Home Page Elements
    Home Page contents
    Generate Excel File

Login Page Test
    Login link Test

Test Login Credentials
     Click On Login Link
     Enter Email Id
     Enter Password
     Click On Login Button
#    Read Login Data from Excel
    validate Login Error Msg





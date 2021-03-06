#NoEnv  ; Performance and compatibility with future AutoHotkey releases.
#SingleInstance force

#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; For new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ----------------------------------------------------------------------------
; snipping-tool-new.ahk
; https://github.com/caglartoklu/ahk-scripts
; License:
; 2-clause license ("Simplified BSD License" or "FreeBSD License")
; See the LICENSE file at home page.
; ----------------------------------------------------------------------------

; >>>>>>>>>>( Window Title & Class )<<<<<<<<<<<
; Snipping Tool
; ahk_class Microsoft-Windows-Tablet-SnipperToolbar
; ahk_class Microsoft-Windows-Tablet-SnipperEditor

; windows + printscreen
#printscreen::
    className =

    currentClassName := "Microsoft-Windows-Tablet-SnipperToolbar"
    If WinExist("ahk_class" . currentClassName)
    {
        className = %currentClassName%
    }

    currentClassName := "Microsoft-Windows-Tablet-SnipperEditor"
    If WinExist("ahk_class" . currentClassName)
    {
        className = %currentClassName%
    }

    if className =
    {
        ; window not found

        ; "%windir%\system32\SnippingTool.exe"
        exepath := A_Windir . "\system32\SnippingTool.exe"
        Run, %exepath%
        WinWait, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
    }

    WinActivate
    Click 63, 63 ; New
Return

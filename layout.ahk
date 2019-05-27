#NoTrayIcon
LShift & LAlt::SwitchLayout()
LAlt & LShift::SwitchLayout()

SwitchLayout()
{
    CurrentLayout := GetLayout()
    if (CurrentLayout = 0x4190419)      ; Russian -> US English
        SetLayout(0x0409)
    else 
        SetLayout(0x0419)               ; Other layout -> Russian
} 

GetLayout()
{
    SetFormat, Integer, H
    WinGet,    WinID, , A
    ThreadID        := DllCall("GetWindowThreadProcessId", "UInt", WinID,    "UInt", 0)
    InputLocaleID   := DllCall("GetKeyboardLayout",        "UInt", ThreadID, "UInt")
    return InputLocaleID
}

SetLayout(Layout)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Layout, %CtrlInFocus%
}
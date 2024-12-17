#Requires AutoHotkey v2.0
#Include ./Gdip_All.ahk

;^+s:: ; Press Ctrl + Shift + S
!PrintScreen:: ; Alt + PrintScreen
{
    ; Start GDI+
    if !pToken := Gdip_Startup()
    {
        MsgBox "Failed to start GDI+."
        return
    }

    ; Load image from clipboard
    pBitmap := Gdip_CreateBitmapFromClipboard()
    if (pBitmap = -1)
    {
        MsgBox "Clipboard does not contain an image."
        Gdip_Shutdown(pToken)
        return
    }

    ; Set output file path
    FilePath := "C:\Users\bendl\OneDrive\문서\스크린샷\" FormatTime(, "yyyyMMdd_HHmmss") ".png"

    ; Save the clipboard image
    if !Gdip_SaveBitmapToFile(pBitmap, FilePath)
    ;    MsgBox "Image saved to: " FilePath
    ;else
    ;    MsgBox "Failed to save the image."

    ; Cleanup
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)
}
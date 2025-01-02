Improved error handling using `On Error GoTo` and explicit error checking.

```vbscript
Function GetLateBoundObject(objName)
  On Error GoTo ErrHandler
  Set GetLateBoundObject = GetObject(objName)
  Exit Function
ErrHandler:
  If Err.Number <> 0 Then
    ' Handle the error appropriately
    Debug.Print "Error creating object: " & Err.Description
    Err.Clear
    Set GetLateBoundObject = Nothing
  End If
End Function

Dim obj As Object
Set obj = GetLateBoundObject("someInvalidObject.txt")
If Not obj Is Nothing Then
  ' Access object properties safely
  Debug.Print obj.SomeProperty
Else
  Debug.Print "Object not found or could not be created."
End If
```

This improved version includes error handling, making the code more robust and less prone to unexpected crashes.  The error is caught and reported, preventing further attempts to access properties of a nonexistent object.
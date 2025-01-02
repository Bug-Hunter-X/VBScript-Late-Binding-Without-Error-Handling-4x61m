Function using late binding without error handling

```vbscript
Function GetLateBoundObject(objName)
  On Error Resume Next
  Set GetLateBoundObject = GetObject(objName)
  If Err.Number <> 0 Then
    Err.Clear
  End If
End Function

Dim obj As Object
Set obj = GetLateBoundObject("someInvalidObject.txt")
If Not obj Is Nothing Then
  ' This will cause a runtime error if 'someInvalidObject.txt' is not a valid COM object
  Debug.Print obj.SomeProperty
End If
```

This code attempts to access a COM object. If the object doesn't exist, it will lead to runtime errors.

The problem is the function does not handle errors when it cannot create the object. Thus, it can return `Nothing` and continue. However, if it returns `Nothing`, the code further tries to access its properties.
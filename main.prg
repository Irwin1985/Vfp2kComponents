*-----------------------------------------------------------------------------------------------------*
* Programa principal.
* Clase VFP 2k Components v 0.1.1
* Creada por Irwin Rodríguez
* Barquisimeto - Venezuela
* Agosto 15 2016 Hora: 20:36
* Cualquier sugerencia escribir al grupo de VFP bajo el tema: VFP 2KComponents
* o enviar un email a rodriguez.irwin@gmail.com
*-----------------------------------------------------------------------------------------------------*
Set Bell Off
Set Hours To 24
Local lcPath
m.lcPath = Addbs(Justpath(Sys(16,1)))
Set Default To (m.lcPath)
Set Classlib To Clases\VfpRibbonTab
Set Classlib To Clases\VfpRibbonTemplates Additive

If Vartype(_Screen.oSettings) = 'O'
	_Screen.RemoveObject('oSettings')
Else &&Vartype(_Screen.oSettings) = 'O'
Endif &&Vartype(_Screen.oSettings) = 'O'
_Screen.Newobject("oSettings", "__RibbonTabSettings")

&& Utilidades del sistema
If Vartype(_Screen.oUtility) = 'O'
	_Screen.RemoveObject('oUtility')
Else &&Vartype(_Screen.oUtility) = 'O'
Endif &&Vartype(_Screen.oUtility) = 'O'
_Screen.Newobject("oUtility", "__Utility")

&& Variables Globales del Sistema
If Vartype(_Screen.oGlobal) = 'O'
	_Screen.RemoveObject('oGlobal')
Else &&Vartype(_Screen.oUtility) = 'O'
Endif &&Vartype(_Screen.oUtility) = 'O'
_Screen.Newobject("oGlobal", "__VarSystem")

&& Rutas del sistema
_Screen.oSettings.System_Main_Path = lcPath
_Screen.oSettings.System_Image_Path = Addbs(_Screen.oSettings.System_Main_Path + "Imagenes")

Set Date Dmy
Set Century On

On Error Do ErrorHandler With Program(),Lineno(),Error(),Message()

Do Form Forms\Main
Read Events

Release Classlib Clase\vfpRibbonTab.vcx, Clase\VfpRibbonTemplates.vcx
Close Databases All
Clear All

Procedure ErrorHandler
Parameters Programa, Linea, NumError, Mensaje
Messagebox("ERROR "+Str(NumError,2)+" "+Mensaje + " " + Programa + Str(Linea))
Endproc
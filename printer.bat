:: list all printers installed locally or from AD
wmic printer list brief / format

:: get default printer
wmic printer get name, default

:: set default printer by share name
wmic printer where ShareName="PrinterShareName" call setdefaultprinter

:: set default printer by name
wmic printer where name="PrinterName" call setdefaultprinter

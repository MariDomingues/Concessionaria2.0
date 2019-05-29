object DM: TDM
  OldCreateOrder = False
  Height = 268
  Width = 367
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=DESKTOP-A6VV89B\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DESKTOP-A6VV89B\SQLEXPRESS'
      'DATABASE=ConcessionariaII'
      'MARS=yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Transaction = Trans
    Left = 88
    Top = 48
  end
  object Trans: TFDTransaction
    Connection = FDConnection1
    Left = 120
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 120
    Top = 184
  end
end

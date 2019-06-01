inherited FrmFabricante: TFrmFabricante
  Caption = 'Manuten'#231#227'o no Cadastro de Fabricante'
  ClientHeight = 368
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 349
    ExplicitTop = 349
  end
  inherited PanelEntrada: TPanel
    inherited CheckHabilita: TDBCheckBox
      DataField = 'Status'
    end
  end
  inherited PnlFicha: TPanel
    Height = 251
    ExplicitHeight = 251
    object Label1: TLabel
      Left = 25
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Raz'#227'o Social:'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 14
      Top = 45
      Width = 75
      Height = 13
      Caption = 'Nome Fantasia:'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 60
      Top = 74
      Width = 29
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 372
      Top = 74
      Width = 23
      Height = 13
      Caption = 'Pa'#237's:'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 40
      Top = 104
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 52
      Top = 133
      Width = 37
      Height = 13
      Caption = 'Cidade:'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 363
      Top = 133
      Width = 32
      Height = 13
      Caption = 'Bairro:'
      FocusControl = DBEdit7
    end
    object Label9: TLabel
      Left = 66
      Top = 161
      Width = 23
      Height = 13
      Caption = 'CEP:'
      FocusControl = DBEdit8
    end
    object Label10: TLabel
      Left = 349
      Top = 161
      Width = 46
      Height = 13
      Caption = 'Telefone:'
      FocusControl = DBEdit9
    end
    object Label11: TLabel
      Left = 57
      Top = 191
      Width = 32
      Height = 13
      Caption = 'E-mail:'
      FocusControl = DBEdit10
    end
    object Label12: TLabel
      Left = 36
      Top = 220
      Width = 53
      Height = 13
      Caption = 'Nro Conta:'
      FocusControl = DBEdit11
    end
    object DBEdit1: TDBEdit
      Left = 95
      Top = 13
      Width = 543
      Height = 21
      DataField = 'RazaoSocial'
      DataSource = DataSource1
      TabOrder = 0
      OnExit = DBEdit1Exit
    end
    object DBEdit2: TDBEdit
      Left = 95
      Top = 44
      Width = 543
      Height = 21
      DataField = 'NomeFantasia'
      DataSource = DataSource1
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 95
      Top = 71
      Width = 238
      Height = 21
      DataField = 'CNPJ'
      DataSource = DataSource1
      TabOrder = 2
      OnExit = DBEdit3Exit
    end
    object DBEdit4: TDBEdit
      Left = 400
      Top = 71
      Width = 238
      Height = 21
      DataField = 'Pais'
      DataSource = DataSource1
      TabOrder = 3
      OnExit = DBEdit4Exit
    end
    object DBEdit5: TDBEdit
      Left = 95
      Top = 101
      Width = 543
      Height = 21
      DataField = 'Endereco'
      DataSource = DataSource1
      TabOrder = 4
      OnExit = DBEdit5Exit
    end
    object DBEdit6: TDBEdit
      Left = 95
      Top = 130
      Width = 238
      Height = 21
      DataField = 'Cidade'
      DataSource = DataSource1
      TabOrder = 5
      OnExit = DBEdit6Exit
    end
    object DBEdit7: TDBEdit
      Left = 400
      Top = 130
      Width = 238
      Height = 21
      DataField = 'Bairro'
      DataSource = DataSource1
      TabOrder = 6
      OnExit = DBEdit7Exit
    end
    object DBEdit8: TDBEdit
      Left = 95
      Top = 158
      Width = 121
      Height = 21
      DataField = 'CEP'
      DataSource = DataSource1
      TabOrder = 7
      OnExit = DBEdit8Exit
    end
    object DBEdit9: TDBEdit
      Left = 401
      Top = 158
      Width = 186
      Height = 21
      DataField = 'Telefone'
      DataSource = DataSource1
      TabOrder = 8
      OnExit = DBEdit9Exit
    end
    object DBEdit10: TDBEdit
      Left = 95
      Top = 188
      Width = 314
      Height = 21
      DataField = 'Email'
      DataSource = DataSource1
      TabOrder = 9
      OnExit = DBEdit10Exit
    end
    object DBEdit11: TDBEdit
      Left = 95
      Top = 217
      Width = 160
      Height = 21
      DataField = 'NroConta'
      DataSource = DataSource1
      TabOrder = 10
      OnExit = DBEdit11Exit
    end
  end
  inherited ImageList4: TImageList
    Left = 608
    Top = 357
  end
  inherited ImageList3: TImageList
    Left = 576
    Top = 360
  end
  inherited ImageList2: TImageList
    Left = 544
    Top = 360
  end
  inherited ImageList1: TImageList
    Left = 512
    Top = 360
  end
  inherited PopupMenu1: TPopupMenu
    Top = 357
  end
  inherited FDStatus: TFDCommand
    Left = 680
    Top = 154
  end
  inherited FDTabela: TFDTable
    IndexFieldNames = 'Codigo'
    UpdateOptions.UpdateTableName = 'ConcessionariaII.dbo.Fabricante'
    TableName = 'ConcessionariaII.dbo.Fabricante'
    Left = 680
    object FDTabelaCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTabelaRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Origin = 'RazaoSocial'
      Required = True
      Size = 150
    end
    object FDTabelaNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Origin = 'NomeFantasia'
      Required = True
      Size = 150
    end
    object FDTabelaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;1;_'
      Size = 18
    end
    object FDTabelaPais: TStringField
      FieldName = 'Pais'
      Origin = 'Pais'
      Required = True
      Size = 50
    end
    object FDTabelaEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'Endereco'
      Required = True
      Size = 100
    end
    object FDTabelaCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Required = True
      Size = 50
    end
    object FDTabelaBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Required = True
      Size = 50
    end
    object FDTabelaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object FDTabelaTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'Telefone'
      Required = True
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 14
    end
    object FDTabelaEmail: TStringField
      FieldName = 'Email'
      Origin = 'Email'
      Required = True
      Size = 100
    end
    object FDTabelaNroConta: TStringField
      FieldName = 'NroConta'
      Origin = 'NroConta'
      Required = True
      Size = 12
    end
    object FDTabelaStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      FixedChar = True
      Size = 1
    end
  end
  inherited DataSource1: TDataSource
    Top = 360
  end
end

inherited FrmConsultaVenda: TFrmConsultaVenda
  Caption = 'Consulta Venda'
  ClientWidth = 1076
  ExplicitWidth = 1084
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1076
    inherited Label1: TLabel
      Left = 483
      ExplicitLeft = 483
    end
  end
  inherited DBGrid: TDBGrid
    Width = 1076
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ClienteNome'
        Title.Caption = 'Cliente'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FuncionarioNome'
        Title.Caption = 'Funcion'#225'rio'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtVen'
        Title.Caption = 'Data Venda'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdParcela'
        Title.Caption = 'Qtd. Parcela'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValTotal'
        Title.Caption = 'Valor Total'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  inherited StatusBar1: TStatusBar
    Width = 1076
    Panels = <
      item
        Width = 50
      end
      item
        Text = 'Todas as vendas cadastradas!'
        Width = 250
      end
      item
        Width = 50
      end>
  end
  inherited FDTabelaConsulta: TFDTable
    IndexFieldNames = 'Codigo'
    UpdateOptions.UpdateTableName = 'ConcessionariaII.dbo.Venda'
    TableName = 'ConcessionariaII.dbo.Venda'
    object FDTabelaConsultaCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTabelaConsultaCliente: TIntegerField
      FieldName = 'Cliente'
      Origin = 'Cliente'
    end
    object FDTabelaConsultaFuncionario: TIntegerField
      FieldName = 'Funcionario'
      Origin = 'Funcionario'
    end
    object FDTabelaConsultaDtVen: TSQLTimeStampField
      FieldName = 'DtVen'
      Origin = 'DtVen'
    end
    object FDTabelaConsultaValTotal: TBCDField
      FieldName = 'ValTotal'
      Origin = 'ValTotal'
      Precision = 9
      Size = 2
    end
    object FDTabelaConsultaQtdParcela: TIntegerField
      FieldName = 'QtdParcela'
      Origin = 'QtdParcela'
    end
    object FDTabelaConsultaStatus: TStringField
      FieldName = 'Status'
      Origin = 'Status'
      OnGetText = FDTabelaConsultaStatusGetText
      FixedChar = True
      Size = 1
    end
    object FDTabelaConsultaClienteNome: TStringField
      FieldKind = fkLookup
      FieldName = 'ClienteNome'
      LookupDataSet = FDQuery1
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object FDTabelaConsultaFuncionarioNome: TStringField
      FieldKind = fkLookup
      FieldName = 'FuncionarioNome'
      LookupDataSet = FDQuery2
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'Funcionario'
      Lookup = True
    end
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'select cliente.codigo, cliente.nome from venda inner join client' +
        'e on venda.cliente = cliente.codigo')
    Left = 688
    Top = 120
  end
  object FDQuery2: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'select funcionario.codigo, funcionario.nome from venda inner joi' +
        'n funcionario on venda.funcionario = funcionario.codigo')
    Left = 688
    Top = 168
  end
end

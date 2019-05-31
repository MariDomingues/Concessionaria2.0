inherited FrmRelVenda: TFrmRelVenda
  Caption = 'Impress'#227'o Venda'
  ClientHeight = 339
  ExplicitHeight = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 192
      Caption = 'Relat'#243'rio de Vendas'
      ExplicitWidth = 192
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 263
    Top = 243
    ExplicitLeft = 263
    ExplicitTop = 243
  end
  object Lb_NVenda: TLabeledEdit [2]
    Left = 184
    Top = 152
    Width = 121
    Height = 27
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' da Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 4
  end
  inherited BitBtn2: TBitBtn
    Left = 360
    Top = 243
    ExplicitLeft = 360
    ExplicitTop = 243
  end
  inherited StatusBar1: TStatusBar
    Top = 320
    ExplicitTop = 320
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      
        'SELECT        Venda.Codigo AS Cod_Venda, Venda.DtVen AS DataVend' +
        'a, Venda.ValTotal AS ValorTotal, Venda.QtdParcela, Funcionario.N' +
        'ome AS NomeFunc, Cliente.Nome AS NomeClient, Veiculo.Modelo'
      'FROM            Cliente INNER JOIN'
      
        '                         Funcionario ON Cliente.Codigo = Funcion' +
        'ario.Codigo INNER JOIN'
      
        '                         Veiculo ON Cliente.Codigo = Veiculo.Cli' +
        'ente INNER JOIN'
      '                         Venda ON Cliente.Codigo = Venda.Codigo')
    Left = 24
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 32
    Top = 264
  end
  object FDQuery2: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'Cod_Venda'
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'SELECT        Venda_Itens.ValTotVei, Venda_Itens.DescUnit, Veicu' +
        'lo.Modelo, Veiculo.Cor, Veiculo.Placa, Veiculo.Ano, Veiculo.TpVe' +
        'i, Modelo.Descricao'
      'FROM            Modelo INNER JOIN'
      
        '                         Veiculo ON Modelo.Codigo = Veiculo.Mode' +
        'lo INNER JOIN'
      
        '                         Venda ON Modelo.Codigo = Venda.Codigo I' +
        'NNER JOIN'
      
        '                         Venda_Itens ON Modelo.Codigo = Venda_It' +
        'ens.Codigo'
      'WHERE Venda_Itens.Codigo = :ID')
    Left = 88
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end

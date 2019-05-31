inherited FrmRelCadastros: TFrmRelCadastros
  Caption = 'Impress'#227'o do Relat'#243'rio de Cadastros'
  ClientHeight = 450
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup [0]
    Left = 40
    Top = 308
    Width = 393
    Height = 63
    Caption = 'Ordena'#231#227'o'
    Columns = 3
    Items.Strings = (
      'Codigo-ID'
      'Nome'
      'Cidade')
    TabOrder = 9
  end
  object edtCidade: TLabeledEdit [1]
    Left = 98
    Top = 262
    Width = 335
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade:'
    LabelPosition = lpLeft
    TabOrder = 8
  end
  object RadioGroup2: TRadioGroup [2]
    Left = 40
    Top = 80
    Width = 393
    Height = 66
    BiDiMode = bdLeftToRight
    Caption = 'Gerar Relat'#243'rio de: '
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Funcion'#225'rio'
      'Cliente'
      'Usu'#225'rio'
      'Fabricante'
      'Veiculo'
      'Vendas')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 10
  end
  object edtNomeAte: TLabeledEdit [3]
    Left = 98
    Top = 235
    Width = 335
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome At'#233':'
    LabelPosition = lpLeft
    TabOrder = 7
  end
  object edtCodigoAte: TLabeledEdit [4]
    Left = 245
    Top = 168
    Width = 55
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo At'#233':'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 5
  end
  object edtNomeDe: TLabeledEdit [5]
    Left = 98
    Top = 208
    Width = 335
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome De:'
    LabelPosition = lpLeft
    TabOrder = 6
  end
  object edtCodigoDe: TLabeledEdit [6]
    Left = 98
    Top = 168
    Width = 55
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo de:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 4
  end
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 218
      Caption = 'Relat'#243'rio de Cadastros'
      ExplicitWidth = 218
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 261
    Top = 393
    OnClick = BitBtn1Click
    ExplicitLeft = 261
    ExplicitTop = 393
  end
  inherited BitBtn2: TBitBtn
    Left = 358
    Top = 393
    OnClick = BitBtn2Click
    ExplicitLeft = 358
    ExplicitTop = 393
  end
  inherited StatusBar1: TStatusBar
    Top = 431
    ExplicitTop = 531
  end
  inherited FDQuery1: TFDQuery
    Active = True
    SQL.Strings = (
      'Select * From Cargo')
    Left = 24
    Top = 379
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 24
    Top = 432
  end
  object FDQryDetalhe: TFDQuery
    Active = True
    Filtered = True
    MasterSource = DataSource1
    MasterFields = 'Codigo'
    DetailFields = 'Codigo'
    Connection = DM.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'Select * From Funcionario F where F.Cargo = :Codigo')
    Left = 92
    Top = 432
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 1
      end>
  end
end

object FrmPadrao2: TFrmPadrao2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  BorderWidth = 1
  Caption = 'FrmBasico2'
  ClientHeight = 361
  ClientWidth = 737
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 41
    Align = alTop
    Color = clMenuHighlight
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 936
    object Label1: TLabel
      Left = 283
      Top = 10
      Width = 154
      Height = 18
      Caption = 'Consulta Registros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 737
    Height = 447
    Align = alTop
    DataSource = DSConsulta
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Yu Gothic UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'NomeFantasia'
        Title.Caption = 'Nome Fantasia'
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
        FieldName = 'CNPJ'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pais'
        Title.Caption = 'Pa'#237's'
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
        FieldName = 'CEP'
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
        FieldName = 'Email'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Yu Gothic UI'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 737
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = -157
    ExplicitTop = 480
    ExplicitWidth = 1093
  end
  object DSConsulta: TDataSource
    DataSet = FDTabelaConsulta
    Left = 480
    Top = 192
  end
  object FDTabelaConsulta: TFDTable
    Connection = DM.FDConnection1
    Left = 416
    Top = 192
  end
end

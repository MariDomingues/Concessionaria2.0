unit UnitCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ToolWin;

type
  TFrmCadPerfil = class(TFrmPadrao1)
    PanelSup: TPanel;
    Label4: TLabel;
    DBCheckBox5: TDBCheckBox;
    DBEdit1: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Movimentação: TTabSheet;
    Relatório: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    DBCheckBox41: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPerfil: TFrmCadPerfil;

implementation

{$R *.dfm}

end.

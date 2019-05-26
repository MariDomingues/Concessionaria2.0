unit UnitPadrao2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPadrao2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid: TDBGrid;
    StatusBar1: TStatusBar;
    DSConsulta: TDataSource;
    FDTabelaConsulta: TFDTable;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao2: TFrmPadrao2;

implementation

{$R *.dfm}

procedure TFrmPadrao2.FormActivate(Sender: TObject);
begin
  FDTabelaConsulta.Close;
  FDTabelaConsulta.Open();
end;

end.

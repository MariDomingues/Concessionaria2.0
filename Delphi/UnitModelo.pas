unit UnitModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmModelo = class(TFrmPadrao1)
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaDescricao: TStringField;
    FDTabelaObs: TStringField;
    FDTabelaStatus: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    procedure btn_SalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModelo: TFrmModelo;

implementation

{$R *.dfm}

procedure TFrmModelo.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Descrição" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmModelo.DBEdit1Exit(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Descrição" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

end.

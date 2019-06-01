unit UnitCargo;

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
  TFrmCargo = class(TFrmPadrao1)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaDescricao: TStringField;
    FDTabelaSalBase: TBCDField;
    FDTabelaStatus: TStringField;
    FDTabelaObs: TStringField;
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargo: TFrmCargo;

implementation

{$R *.dfm}

procedure TFrmCargo.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCargo.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  ValorCampo.SetFocus;
end;

procedure TFrmCargo.btn_InserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCargo.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Descrição" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort;
    end;

  if (DBEdit2.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Salário Base" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmCargo.DBEdit1Exit(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Descrição" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmCargo.DBEdit2Exit(Sender: TObject);
begin
  if (DBEdit2.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Salário Base" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort;
    end;
  inherited;
end;

end.

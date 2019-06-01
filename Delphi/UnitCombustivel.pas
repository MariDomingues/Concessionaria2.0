unit UnitCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, Vcl.Menus,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmCombustivel = class(TFrmPadrao1)
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaDescricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    FDTabelaStatus: TStringField;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCombustivel: TFrmCombustivel;

implementation

{$R *.dfm}

procedure TFrmCombustivel.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCombustivel.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  ValorCampo.SetFocus;
end;

procedure TFrmCombustivel.btn_InserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCombustivel.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Descrição" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCombustivel.DBEdit1Exit(Sender: TObject);
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

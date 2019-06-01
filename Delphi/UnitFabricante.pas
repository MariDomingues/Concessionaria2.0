unit UnitFabricante;

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
  TFrmFabricante = class(TFrmPadrao1)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaRazaoSocial: TStringField;
    FDTabelaNomeFantasia: TStringField;
    FDTabelaCNPJ: TStringField;
    FDTabelaPais: TStringField;
    FDTabelaEndereco: TStringField;
    FDTabelaCidade: TStringField;
    FDTabelaBairro: TStringField;
    FDTabelaCEP: TStringField;
    FDTabelaTelefone: TStringField;
    FDTabelaEmail: TStringField;
    FDTabelaNroConta: TStringField;
    FDTabelaStatus: TStringField;
    procedure btn_SalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFabricante: TFrmFabricante;

implementation

{$R *.dfm}

procedure TFrmFabricante.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Razão Social" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;

  if (DBEdit2.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nome Fantasia" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;

  if (DBEdit3.Text = '  .   .   /    -  ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CNPJ" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;

  if (DBEdit10.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Email" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort
    end;

  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "País" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;

  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;

  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;

  if (DBEdit7.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;

  if (DBEdit8.Text = '      -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;

  if (DBEdit11.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit11.SetFocus;
      Abort
    end;

  if (DBEdit9.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit9.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit10Exit(Sender: TObject);
begin
  if (DBEdit10.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Email" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit11Exit(Sender: TObject);
begin
  if (DBEdit11.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit11.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit1Exit(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Razão Social" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit2Exit(Sender: TObject);
begin
  if (DBEdit2.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nome Fantasia" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit3Exit(Sender: TObject);
begin
  if (DBEdit3.Text = '  .   .   /    -  ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CNPJ" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit4Exit(Sender: TObject);
begin
  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "País" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit5Exit(Sender: TObject);
begin
  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit6Exit(Sender: TObject);
begin
  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit7Exit(Sender: TObject);
begin
  if (DBEdit7.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit8Exit(Sender: TObject);
begin
  if (DBEdit8.Text = '      -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFabricante.DBEdit9Exit(Sender: TObject);
begin
  if (DBEdit9.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit9.SetFocus;
      Abort
    end;
  inherited;
end;

end.

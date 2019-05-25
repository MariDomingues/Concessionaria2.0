unit UnitFuncionario;

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
  TFrmFuncionario = class(TFrmPadrao1)
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaNome: TStringField;
    FDTabelaCPF: TStringField;
    FDTabelaEndereco: TStringField;
    FDTabelaCidade: TStringField;
    FDTabelaBairro: TStringField;
    FDTabelaCEP: TStringField;
    FDTabelaTelefone: TStringField;
    FDTabelaNroConta: TStringField;
    FDTabelaCargo: TIntegerField;
    FDTabelaStatus: TStringField;
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
    FDQueryCargo: TFDQuery;
    DSCargo: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure btn_SalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionario: TFrmFuncionario;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmFuncionario.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nome" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;

  if (DBEdit2.Text = '   .   .   -  ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CPF" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;

  if (varisnull(DBLookupComboBox3.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cargo" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox3.SetFocus;
      Abort;
    end;

  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;

  if (DBEdit6.Text = '     -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;

  if (DBEdit3.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;

  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;

  if (DBEdit7.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;

  if (DBEdit8.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit1Exit(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nome" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit2Exit(Sender: TObject);
begin
  if (DBEdit2.Text = '   .   .   -  ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CPF" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit3Exit(Sender: TObject);
begin
  if (DBEdit3.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit4Exit(Sender: TObject);
begin
  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit5Exit(Sender: TObject);
begin
  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit6Exit(Sender: TObject);
begin
  if (DBEdit6.Text = '     -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit7Exit(Sender: TObject);
begin
  if (DBEdit7.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmFuncionario.DBEdit8Exit(Sender: TObject);
begin
  if (DBEdit8.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;
  inherited;
  inherited;
end;

procedure TFrmFuncionario.DBLookupComboBox1Exit(Sender: TObject);
begin
  if (varisnull(DBLookupComboBox3.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cargo" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox3.SetFocus;
      Abort;
    end;
  inherited;
end;

end.

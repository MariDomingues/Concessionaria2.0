unit UnitCliente;

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
  TFrmCliente = class(TFrmPadrao1)
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaNome: TStringField;
    FDTabelaCPF: TStringField;
    FDTabelaCNH: TStringField;
    FDTabelaEndereco: TStringField;
    FDTabelaCidade: TStringField;
    FDTabelaBairro: TStringField;
    FDTabelaCEP: TStringField;
    FDTabelaTelefone: TStringField;
    FDTabelaEmail: TStringField;
    FDTabelaNroConta: TStringField;
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
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    porNomedoCliente1: TMenuItem;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure porNomedoCliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses UntPesqString;

procedure TFrmCliente.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCliente.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  ValorCampo.SetFocus;
end;

procedure TFrmCliente.btn_InserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TFrmCliente.btn_SalvarClick(Sender: TObject);
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

  if (DBEdit3.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CNH" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;

  if (DBEdit9.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Email" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit9.SetFocus;
      Abort
    end;

  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;

  if (DBEdit7.Text = '     -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;

  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;

  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;

  if (DBEdit8.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;

  if (DBEdit10.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit10Exit(Sender: TObject);
begin
  if (DBEdit10.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nro. Conta" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit1Exit(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Nome" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit2Exit(Sender: TObject);
begin
  if (DBEdit2.Text = '   .   .   -  ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CPF" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit3Exit(Sender: TObject);
begin
  if (DBEdit3.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CNH" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit3.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit4Exit(Sender: TObject);
begin
  if (DBEdit4.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Endereço" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit4.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit5Exit(Sender: TObject);
begin
  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cidade" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit6Exit(Sender: TObject);
begin
  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Bairro" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit7Exit(Sender: TObject);
begin
  if (DBEdit7.Text = '     -   ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "CEP" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit7.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit8Exit(Sender: TObject);
begin
  if (DBEdit8.Text = '(   )    -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Telefone" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit8.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.DBEdit9Exit(Sender: TObject);
begin
  if (DBEdit9.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Email" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit9.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmCliente.porNomedoCliente1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa alfanumérica por [Nome do Cliente]';

  pesqString.ShowModal;

  if PesqString.RadioGroup1.ItemIndex = 1 then
    begin
      StatusBar1.Panels[2].Text := 'Nome contém: ' + PesqString.Edit1.Text;

      FDTabela.Filter   := 'UPPER(Nome) LIKE ' +#39 + '%' + PesqString.Edit1.Text + '%' + #39;
      FDTabela.Filtered := True;
    end;

  if PesqString.RadioGroup1.ItemIndex = 0 then
    begin
      StatusBar1.Panels[2].Text := 'Nome inicia com: ' + PesqString.Edit1.Text;

      FDTabela.Filter   := 'UPPER(Nome) LIKE ' +#39 + PesqString.Edit1.Text + '%' + #39;
      FDTabela.Filtered := True;
    end;

  if PesqString.RadioGroup1.ItemIndex = 2 then
    begin
      StatusBar1.Panels[2].Text := 'Nome termina com: ' + PesqString.Edit1.Text;

      FDTabela.Filter   := 'UPPER(Nome) LIKE ' +#39 + '%' + PesqString.Edit1.Text + #39;
      FDTabela.Filtered := True;
    end;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

end.

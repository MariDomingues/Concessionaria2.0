unit UnitUsuario;

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
  TFrmUsuario = class(TFrmPadrao1)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQueryPerfil: TFDQuery;
    FDQueryFuncionario: TFDQuery;
    DSPerfil: TDataSource;
    DSFuncionario: TDataSource;
    FDTabelaCodigo: TIntegerField;
    FDTabelaUsuario: TStringField;
    FDTabelaSenha: TStringField;
    FDTabelaFuncionario: TIntegerField;
    FDTabelaStatus: TStringField;
    FDTabelaPerfil: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses UnitDM, UnitMenuPrincipal;

procedure TFrmUsuario.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit1.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Usuário" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit1.SetFocus;
      Abort
    end;

  if (DBEdit2.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Senha" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit2.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmUsuario.FormActivate(Sender: TObject);
begin
  FDTabela.TableName := 'Login';
  tipoID := 0;
  FrmMenuPrincipal.QueryLogin.Close;
  FrmMenuPrincipal.QueryLogin.Open();

  //Captura o Modo de Edição do Usuário
  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('UsuarioI').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('UsuarioA').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('UsuarioE').AsString;

  Executar := exibePanels;
  inherited;
  FDTabela.Open();

  FDQueryPerfil.Close;
  FDQueryPerfil.Open();

  FDQueryFuncionario.Close;
  FDQueryFuncionario.Open();

  Executar := habilitaBotoes;
  Executar := exibeBotoes;
end;

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FDQueryPerfil.Close;
  FDQueryFuncionario.Close;
end;

end.

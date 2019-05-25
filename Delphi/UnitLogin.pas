unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ValorNome: TEdit;
    ValorSenha: TEdit;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitMenuPrincipal;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
var Mensagem, StrSql : String;
begin
  StatusBar1.Panels[0].Text := 'Autenticando usuário...';
  Refresh;

  ValorNome.Enabled  := False;
  ValorSenha.Enabled := False;
  BitBtn2.Enabled    := False;

  Sleep(3000);

  StrSql:= 'SELECT L.*, P.* '+
           'FROM LOGIN L INNER JOIN PERFIL P '+
           'ON L.PERFIL = P.CODIGO '+
           'WHERE L.USUARIO = ' + #39 + ValorNome.Text  + #39 +
           ' AND L.SENHA = '  + #39 + ValorSenha.Text + #39;

  FrmMenuPrincipal.QueryLogin.Close;
  FrmMenuPrincipal.QueryLogin.SQL.Clear;
  FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
  FrmMenuPrincipal.QueryLogin.Open;

  if FrmMenuPrincipal.QueryLogin.FieldByName('Status').AsString = 'N' then
    begin
      Mensagem := 'Você está cadastrado no sistema mas não ' + #13 +
                  'possui autorização para usá-lo neste momento. ' + #13 + #13 +
                  'Consulte o administrador do sistema.';

      Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_OK+MB_ICONERROR);

      ValorNome.Clear;
      ValorSenha.Clear;
      BitBtn2.Enabled    := True;
      ValorNome.Enabled  := True;
      ValorSenha.Enabled := True;
      ValorNome.SetFocus;
      StatusBar1.Panels[0].Text:= 'Login não autorizado... ' + 'Tente novamente.';
      Abort;
    end;

  if FrmMenuPrincipal.QueryLogin.RecordCount = 1 then
    begin
      StrSql := 'SELECT Login.*, Perfil.*, Funcionario.Cargo, Cargo.Descricao as DescricaoCargo FROM Login ' +
                'INNER JOIN Perfil ON Login.Perfil = Perfil.Codigo ' +
                'INNER JOIN Funcionario ON Login.Funcionario = Funcionario.Codigo ' +
                'INNER JOIN Cargo ON Funcionario.Cargo = Cargo.Codigo ' +
                'WHERE Login.Usuario = ' + #39 + ValorNome.Text  + #39 +
                ' AND Login.Senha = '  + #39 + ValorSenha.Text + #39;

      FrmMenuPrincipal.QueryLogin.Close;
      FrmMenuPrincipal.QueryLogin.SQL.Clear;
      FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
      FrmMenuPrincipal.QueryLogin.Open;

      FrmMenuPrincipal.StatusBar1.Panels[2].Text := 'Usuário: ' + FrmLogin.ValorNome.Text + ' - ' +
                                                    FrmMenuPrincipal.QueryLogin.FieldByName('DescricaoCargo').AsString;
      FrmLogin.Close;
    end
  else
    if FrmMenuPrincipal.QueryLogin.RecordCount = 0 then
      begin
        Mensagem := 'Nome ou Senha do usuário são inválidos.' + #13 + #13 +
                    'Se você esqueceu a sua senha, consulte ' + #13 +
                    'o administrador do sistema.';

        Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_OK+MB_ICONERROR);

        ValorNome.Clear;
        ValorSenha.Clear;
        BitBtn2.Enabled    := True;
        ValorNome.Enabled  := True;
        ValorSenha.Enabled := True;
        ValorNome.SetFocus;
        StatusBar1.Panels[0].Text:= 'Login não autorizado... ' + 'Tente novamente.';
      end;

end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  ValorNome.SetFocus;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.

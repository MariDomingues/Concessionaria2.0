unit UnitMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TFrmMenuPrincipal = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    QueryLogin: TFDQuery;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Timer1: TTimer;
    ImageList1: TImageList;
    RibbonPage2: TRibbonPage;
    RibbonPage3: TRibbonPage;
    RibbonPage4: TRibbonPage;
    RibbonPage5: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    StatusBar1: TStatusBar;
    RibbonGroup2: TRibbonGroup;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonGroup8: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    QueryLoginCodigo: TFDAutoIncField;
    QueryLoginUsuario: TStringField;
    QueryLoginSenha: TStringField;
    QueryLoginFuncionario: TIntegerField;
    QueryLoginStatus: TStringField;
    QueryLoginPerfil: TIntegerField;
    QueryLoginCodigo_1: TFDAutoIncField;
    QueryLoginDescricao: TStringField;
    QueryLoginOcultar: TStringField;
    QueryLoginUsuario_1: TStringField;
    QueryLoginUsuarioI: TStringField;
    QueryLoginUsuarioA: TStringField;
    QueryLoginUsuarioE: TStringField;
    QueryLoginPerfil_1: TStringField;
    QueryLoginPerfilI: TStringField;
    QueryLoginPerfilA: TStringField;
    QueryLoginPerfilE: TStringField;
    QueryLoginVenda: TStringField;
    QueryLoginVendaI: TStringField;
    QueryLoginVendaA: TStringField;
    QueryLoginVendaE: TStringField;
    QueryLoginStatus_1: TStringField;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    RibbonGroup11: TRibbonGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses UnitDM, UnitUsuario, UnitCadPerfil, UnitLogin, UnitCargo, UnitCliente,
  UnitCombustivel, UnitFabricante, UnitFuncionario, UnitModelo, UnitVeiculo,
  UnitVenda, UntRelCadastros;

procedure TFrmMenuPrincipal.Action10Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmFuncionario, FrmFuncionario);
  FrmFuncionario.ShowModal;
  FrmFuncionario.Free;
end;

procedure TFrmMenuPrincipal.Action11Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmModelo, FrmModelo);
  FrmModelo.ShowModal;
  FrmModelo.Free;
end;

procedure TFrmMenuPrincipal.Action12Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmVeiculo, FrmVeiculo);
  FrmVeiculo.ShowModal;
  FrmVeiculo.Free;
end;

procedure TFrmMenuPrincipal.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmCargo, FrmCargo);
  FrmCargo.ShowModal;
  FrmCargo.Free;
end;

procedure TFrmMenuPrincipal.Action2Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmVenda, FrmVenda);
  FrmVenda.ShowModal;
  FrmVenda.Free;
end;

procedure TFrmMenuPrincipal.Action3Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCadastros, FrmRelCadastros);
  FrmRelCadastros.ShowModal;
end;

procedure TFrmMenuPrincipal.Action5Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
end;

procedure TFrmMenuPrincipal.Action6Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadPerfil, FrmCadPerfil);
  FrmCadPerfil.ShowModal;
  FrmCadPerfil.Free;
end;

procedure TFrmMenuPrincipal.Action7Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmCombustivel, FrmCombustivel);
  FrmCombustivel.ShowModal;
  FrmCombustivel.Free;
end;

procedure TFrmMenuPrincipal.Action8Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.ShowModal;
  FrmCliente.Free;
end;

procedure TFrmMenuPrincipal.Action9Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmFabricante, FrmFabricante);
  FrmFabricante.ShowModal;
  FrmFabricante.Free;
end;

procedure TFrmMenuPrincipal.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
  StatusBar1.Panels[1].Text := FormatDateTime(' dddd ", " dd " de " mmmm " de " yyyy', Now);
//  FrmLogin.ShowModal;
//  FrmLogin.Free;
end;

procedure TFrmMenuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TFrmMenuPrincipal.FormCloseQuery(Sender: TObject; var CanClose : Boolean);
var confSaida : integer;
begin
  confSaida := Application.MessageBox('Tem certeza que deseja sair do sistema?', 'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if confSaida = IDYES then
    Application.Terminate
  else
    CanClose := False;
end;

Procedure TFrmMenuPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := TimeToStr(Time);
end;

end.

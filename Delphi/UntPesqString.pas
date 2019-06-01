unit UntPesqString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TPesqString = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    StatusBar1: TStatusBar;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PesqString: TPesqString;

implementation

{$R *.dfm}

uses UnitPadrao1;

procedure TPesqString.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TPesqString.BitBtn2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      ShowMessage('O Campo [Valor] não pode ficar em branco.');
      Edit1.SetFocus;
    end;

  if Edit1.Text <> '' then
    Close;
end;

procedure TPesqString.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn2.Click;
end;

procedure TPesqString.FormActivate(Sender: TObject);
begin
  pesqString.Caption := tarefa;
  Edit1.Clear;
  Edit1.SetFocus;
  Label1.Caption := nomeJanela;
end;

end.

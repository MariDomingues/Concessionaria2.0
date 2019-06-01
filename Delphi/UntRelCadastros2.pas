unit UntRelCadastros2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelCadastros = class(TFrmPadraoRel)
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    edtCidade: TLabeledEdit;
    GroupBox1: TGroupBox;
    Chb_Cliente: TCheckBox;
    Chb_Veiculo: TCheckBox;
    Chb_Fabricante: TCheckBox;
    Chb_Funcionario: TCheckBox;
    Chb_Vendas: TCheckBox;
    Chb_Usuarios: TCheckBox;
    RadioGroup1: TRadioGroup;
    Rb_Codigo: TRadioButton;
    Rb_Nome: TRadioButton;
    Rb_Cidade: TRadioButton;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCadastros: TFrmRelCadastros;

implementation

{$R *.dfm}

procedure TFrmRelCadastros.BitBtn2Click(Sender: TObject);
begin
  inherited;

end;

end.

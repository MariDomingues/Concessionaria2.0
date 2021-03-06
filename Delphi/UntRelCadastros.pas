unit UntRelCadastros;

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
    RelClientes: TfrxReport;
    RadioGroup1: TRadioGroup;
    RelFabricantes: TfrxReport;
    RadioGroup2: TRadioGroup;
    RelUsuarios: TfrxReport;
    DataSource1: TDataSource;
    FDQryDetalhe: TFDQuery;
    frxDBDSDetalhe: TfrxDBDataset;
    RelFuncionarios: TfrxReport;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCadastros: TFrmRelCadastros;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmRelCadastros.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmRelCadastros.BitBtn2Click(Sender: TObject);
var Strliga : String;
    tab : String;
    nome : String;
begin
  inherited;
  FDQuery1.close;
  FDQryDetalhe.Close;


    FDQuery1.SQL.Clear;
    FDQryDetalhe.SQL.Clear;
    tab := '';
    nome := '';

    case RadioGroup2.ItemIndex of
      0:
      begin
        tab := 'Funcionario';
        nome := 'Nome';
      end;
      1:
      begin
        tab := 'Cliente';
        nome := 'Nome';
      end;
      2:
      begin
        tab := 'Perfil';
        FDQryDetalhe.SQL.Add('Select L.*, F.Nome, C.Descricao From Login L'
            +' inner Join Funcionario F on L.Funcionario = F.Codigo'
            +' inner Join Cargo C on F.Cargo = C.Codigo'
            +' Where L.Perfil = :Codigo');
        nome := 'Usuario';
      end;
      3:
      begin
        tab := 'Fabricante';
        nome := 'RazaoSocial';
      end;
    end;

    if tab <> '' then FDQuery1.SQL.Add('select * from ' + tab);

    with FDQuery1.SQL do
    begin
        Strliga := ' where ';


        if edtCodigoDe.Text <> '' then
        begin
          Add(Strliga + 'Codigo >= '''+edtCodigoDe.Text+'''');
          StrLiga := ' and ';
        end;
        if edtCodigoAte.Text <> '' then
        begin
          Add(Strliga + 'Codigo <= '''+edtCodigoAte.Text+'''');
          StrLiga := ' and ';
        end;

        if edtNomeDe.Text <> '' then
        begin
          Add(Strliga + nome + ' >= '''+edtNomeDe.Text+'''');
          StrLiga := ' and ';
        end;
        if edtNomeAte.Text <> '' then
        begin
          Add(Strliga + nome +  ' <= '''+edtNomeAte.Text+'zzz''');
          StrLiga := ' and ';
        end;

        if edtCidade.Text <> '' then
        begin
          Add(Strliga + 'Cidade = '''+edtCidade.Text+'zzz''');
          StrLiga := ' and ';
        end;

        case RadioGroup1.ItemIndex of
          0: Add(' order by Codigo');
          1: Add(' order by' + nome);
          2:
          begin
            if RadioGroup2.ItemIndex <> 2 then Add(' order by Cidade')
            else ShowMessage('Ordena��o n�o permitida para essa Tabela ['+ tab +']!');
          end;
        end;

    end;

  FDQuery1.Open();

  case RadioGroup2.ItemIndex of
      0: RelFuncionarios.ShowReport();
      1: RelClientes.ShowReport();
      2:
      begin
        FDQryDetalhe.Open();
        RelUsuarios.ShowReport();
      end;
      3: RelFabricantes.ShowReport();
  end;
end;

procedure TFrmRelCadastros.RadioGroup2Click(Sender: TObject);
begin
  inherited;

  case RadioGroup2.ItemIndex of
      0:
      begin
        edtNomeDe.EditLabel.Caption := 'Nome De:';
        edtNomeAte.EditLabel.Caption := 'Nome At�:';
        edtCidade.Enabled := True;
      end;
      1:
      begin
        edtNomeDe.EditLabel.Caption := 'Nome De:';
        edtNomeAte.EditLabel.Caption := 'Nome At�:';
        edtCidade.Enabled := True;
      end;
      2:
      begin
        edtNomeDe.EditLabel.Caption := 'Nome Usu�rio De:';
        edtNomeAte.EditLabel.Caption := 'Nome Usu�rio At�:';
        edtCidade.Enabled := False;
      end;
      3:
      begin
        edtNomeDe.EditLabel.Caption := 'Raz�o Social De:';
        edtNomeAte.EditLabel.Caption := 'Raz�o Social At�:';
        edtCidade.Enabled := True;
      end;
  end;
end;

end.

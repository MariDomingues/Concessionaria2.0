unit UnitVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Data.Win.ADODB;

type
  TFrmVenda = class(TFrmPadrao1)
    Label1: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    MaskEdit1: TMaskEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Bbt_Inserir: TBitBtn;
    Bbt_Excluir: TBitBtn;
    Bbt_Confirma: TBitBtn;
    Bbt_Cancelar: TBitBtn;
    DBG_Vei: TDBGrid;
    Label6: TLabel;
    DBText3: TDBText;
    DataSource2: TDataSource;
    DS_Delete: TDataSource;
    DS_Vendedor: TDataSource;
    DS_Veiculo: TDataSource;
    DS_Cliente: TDataSource;
    DSItens: TDataSource;
    FDQRY_Veiculo: TFDQuery;
    FDQRY_Geral: TFDQuery;
    FDQRY_Vendedor: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQRY_Cliente: TFDQuery;
    FDQRY_VeiculoCodigo: TFDAutoIncField;
    FDQRY_VeiculoPlaca: TStringField;
    FDQRY_VeiculoValor: TBCDField;
    FDQuery1Codigo: TFDAutoIncField;
    FDQuery1DtVen: TSQLTimeStampField;
    FDQuery1Cliente: TIntegerField;
    FDQuery1Funcionario: TIntegerField;
    FDQuery1Nome: TStringField;
    FDQuery1Endereco: TStringField;
    FDQuery1Bairro: TStringField;
    FDQuery1Cidade: TStringField;
    FDQuery1CPF: TStringField;
    FDQuery1CEP: TStringField;
    FDQuery1Telefone: TStringField;
    FDQuery1Email: TStringField;
    FDQuery1Nome_1: TStringField;
    FDAtualiza: TFDCommand;
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaCliente: TIntegerField;
    FDTabelaFuncionario: TIntegerField;
    FDTabelaDtVen: TSQLTimeStampField;
    FDTabelaValTotal: TBCDField;
    FDTabelaQtdParcela: TIntegerField;
    FDTabelaStatus: TStringField;
    FDTabelaItens: TFDTable;
    FDTabelaItensVenda: TIntegerField;
    FDTabelaItensVeiculo: TIntegerField;
    FDTabelaItensValTotVei: TBCDField;
    FDTabelaItensDescUnit: TBCDField;
    FDTabelaItensPlaca: TStringField;
    FDTabelaItensValorUnit: TFloatField;
    FDTabelaItensCodigo: TFDAutoIncField;
    SpeedButton2: TSpeedButton;
    procedure Bbt_CancelarClick(Sender: TObject);
    procedure Bbt_ConfirmaClick(Sender: TObject);
    procedure Bbt_ExcluirClick(Sender: TObject);
    procedure Bbt_InserirClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTabelaClienteValidate(Sender: TField);
    procedure FDTabelaFuncionarioValidate(Sender: TField);
    procedure btn_InserirClick(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVenda : TFrmVenda;
  Operacao : integer;

implementation

{$R *.dfm}

uses UnitDM, UnitMenuPrincipal, UnitConsultaVenda;

procedure TFrmVenda.Bbt_CancelarClick(Sender: TObject);
begin
  inherited;
  Bbt_Inserir.Enabled  := True;
  Bbt_Cancelar.Enabled := False;
  Bbt_Confirma.Enabled := False;
  Bbt_Excluir.Enabled  := True;

  PnlItens.Enabled := False;
  MaskEdit1.Clear;
  DBEdit1.Clear;

  FDTabelaItens.Cancel;
end;

procedure TFrmVenda.Bbt_ConfirmaClick(Sender: TObject);
begin
  inherited;
   if DBLookupComboBox3.Text = '' then
    begin
      Application.MessageBox('O campo "Veículo" não pode ficar em branco.','Aviso',MB_OK+MB_ICONWARNING);
      DBLookupComboBox3.SetFocus;
      Abort;
    end;

  Bbt_Inserir.Enabled  := True;
  Bbt_Cancelar.Enabled := False;
  Bbt_Confirma.Enabled := False;
  Bbt_Excluir.Enabled  := True;

  PnlItens.Enabled := False;

  FDQRY_Geral.Close;
  FDQRY_Geral.SQL.Text := '';
  FDQRY_Geral.SQL.Text := 'select * from Venda order by Codigo desc;';
  FDQRY_Geral.Open;

  FDTabelaItens.FieldByName('Venda').AsInteger := FDQRY_Geral.FieldByName('Codigo').AsInteger + 1;

  FDTabelaItens.Post;
  FDAtualiza.CommandText.Clear;
  FDAtualiza.CommandText.Text := 'update Veiculo set Status = ''I'' where Codigo = ' + IntToStr(FDTabelaItensVeiculo.Value) + ';';
  FDAtualiza.Execute;

  FDQRY_Geral.Close;
  FDQRY_Geral.SQL.Text := '';
  FDQRY_Geral.SQL.Text := 'select sum(ValtotVei) as ''Total'' from Venda_Itens where Codigo = ' + IntToStr(FDTabelaCodigo.Value) + ';';
  FDQRY_Geral.Open;

  FDTabelaValTotal.Value := FDQRY_Geral.FieldByName('Total').AsFloat;
end;

procedure TFrmVenda.Bbt_ExcluirClick(Sender: TObject);
begin
  inherited;
  Bbt_Inserir.Enabled  := True;
  Bbt_Cancelar.Enabled := False;
  Bbt_Confirma.Enabled := False;
  Bbt_Excluir.Enabled  := True;

  PnlItens.Enabled := False;

  FDAtualiza.CommandText.Clear;
  FDAtualiza.CommandText.Text := 'update Veiculo set Status = ''A'' where Codigo = ' + IntToStr(FDTabelaItensVeiculo.Value) + ';';
  FDAtualiza.Execute;

  FDTabelaItens.Delete;
end;

procedure TFrmVenda.Bbt_InserirClick(Sender: TObject);
begin
  inherited;
  Bbt_Inserir.Enabled  := False;
  Bbt_Cancelar.Enabled := True;
  Bbt_Confirma.Enabled := True;
  Bbt_Excluir.Enabled  := False;

  PnlItens.Enabled := True;

  FDTabelaItens.Insert;
  DBLookupComboBox3.SetFocus;
end;

procedure TFrmVenda.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  PnlItens.Enabled     := False;
  Bbt_Confirma.Enabled := False;
  Bbt_Cancelar.Enabled := False;

  if FDTabelaItens.RecordCount > 0 then
    Bbt_Excluir.Enabled := True
  else
    Bbt_Excluir.Enabled := False;
end;

procedure TFrmVenda.btn_CancelarClick(Sender: TObject);
begin
  inherited;
  MaskEdit1.Clear;
end;

procedure TFrmVenda.btn_ExcluirClick(Sender: TObject);
begin
  FDQRY_Geral.Close;
  FDQRY_Geral.SQL.Clear;
  FDQRY_Geral.SQL.Add('select count (*) as Total from Venda_Itens where Venda = ' + IntToStr(FDTabelaCodigo.AsInteger));
  FDQRY_Geral.Open;

  if FDQRY_Geral.FieldByName('Total').AsInteger > 0 then
    begin
      Application.MessageBox('Pedido de Venda com Itens adicionados. Não é possível excluir.','Aviso',MB_OK+MB_ICONERROR);
      Operacao:= 1;
      //Botoes(True);
      exit;
    end;
  inherited;
end;

procedure TFrmVenda.btn_InserirClick(Sender: TObject);
begin
  inherited;
//  Executar := exibePanels;
//  FDTabela.FieldByName('DtVen').AsString := formatdatetime('dd\mm\yyyy', now);
  ShowMessage(FDTabela.FieldByName('codigo').AsString);
  PnlItens.Enabled := False;
end;

procedure TFrmVenda.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  FDTabela.Post;
end;

procedure TFrmVenda.DBEdit2Exit(Sender: TObject);
var Desconto : real;
begin
  if DBEdit2.Text <> '' then
    begin
      Desconto := StrToFloat(DBEdit2.Text);
      DBEdit3.Text := FloatToStr(FDQRY_VeiculoValor.AsFloat - ((Desconto / 100) * FDQRY_VeiculoValor.AsFloat));
    end
  else
    DBEdit3.Text := FloatToStr(FDQRY_VeiculoValor.AsFloat);
  inherited;
end;

procedure TFrmVenda.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := FloatToStr(FDQRY_VeiculoValor.AsFloat);
end;

procedure TFrmVenda.FDTabelaClienteValidate(Sender: TField);
begin
  inherited;
  if varisnull(DBLookupComboBox1.KeyValue)  then
    begin
      Application.MessageBox('O campo "Cliente" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox1.SetFocus;
      Abort;
    end;
end;

procedure TFrmVenda.FDTabelaFuncionarioValidate(Sender: TField);
begin
  inherited;
  if varisnull(DBLookupComboBox2.KeyValue)  then
    begin
      Application.MessageBox('O campo "Vendedor" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox2.SetFocus;
      Abort;
    end;
end;


procedure TFrmVenda.FormActivate(Sender: TObject);
begin
  FDTabela.TableName := 'Venda';
  FDTabela.Open();
  FDTabelaItens.Open();
  tipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('VendaI').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('VendaA').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('VendaE').AsString;

  Executar := exibePanels;
  inherited;
  FDTabela.Open();
  FDTabelaItens.Open();
  Executar := habilitaBotoes;

  FDTabela.Close;
  FDTabela.Open;

  FDTabelaItens.Close;
  FDTabelaItens.Open;

  Operacao := 1;

  FDQRY_Cliente.Close;
  FDQRY_Cliente.Open;

  FDQRY_Veiculo.Close;
  FDQRY_Veiculo.Open;

  FDQRY_Vendedor.Close;
  FDQRY_Vendedor.Open;
end;

procedure TFrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FDTabela.Close;
  FDTabelaItens.Close;

  FDQRY_Cliente.Close;
  FDQRY_Veiculo.Close;
  FDQRY_Vendedor.Close;
  FDQRY_Geral.Close;
end;

procedure TFrmVenda.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FrmConsultaVenda.ShowModal;
end;

end.

unit UnitVeiculo;

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
  TFrmVeiculo = class(TFrmPadrao1)
    FDTabelaCodigo: TFDAutoIncField;
    FDTabelaCliente: TIntegerField;
    FDTabelaFabricante: TIntegerField;
    FDTabelaModelo: TIntegerField;
    FDTabelaCombustivel: TIntegerField;
    FDTabelaValor: TBCDField;
    FDTabelaCor: TStringField;
    FDTabelaKm: TBCDField;
    FDTabelaStatus: TStringField;
    FDTabelaDocum: TStringField;
    FDTabelaPlaca: TStringField;
    FDTabelaAno: TIntegerField;
    FDTabelaTpVei: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DSCliente: TDataSource;
    FDQueryCliente: TFDQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    DSFabricante: TDataSource;
    FDQueryFabricante: TFDQuery;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQueryModelo: TFDQuery;
    DSModelo: TDataSource;
    DBLookupComboBox4: TDBLookupComboBox;
    DSCombustivel: TDataSource;
    FDQueryCombustivel: TFDQuery;
    DBCheckBox1: TDBCheckBox;
    DBComboBox2: TDBComboBox;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeiculo: TFrmVeiculo;

implementation

{$R *.dfm}

procedure TFrmVeiculo.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit10.SetFocus;
end;

procedure TFrmVeiculo.btn_InserirClick(Sender: TObject);
begin
  inherited;
  DBEdit10.SetFocus;
end;

procedure TFrmVeiculo.btn_SalvarClick(Sender: TObject);
begin
  if (DBEdit10.Text = '   -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Placa" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort;
    end;

  if (DBEdit11.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Ano" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit11.SetFocus;
      Abort;
    end;

  if (varisnull(DBLookupComboBox2.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Fabricante" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox2.SetFocus;
      Abort;
    end;

  if (varisnull(DBLookupComboBox3.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Modelo" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox3.SetFocus;
      Abort;
    end;

  if (varisnull(DBLookupComboBox4.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Combustível" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox4.SetFocus;
      Abort;
    end;

  if (varisnull(DBLookupComboBox1.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cliente" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox1.SetFocus;
      Abort;
    end;

  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Valor" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;

  if (DBEdit7.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Km" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;

  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cor" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmVeiculo.DBEdit10Exit(Sender: TObject);
begin
  if (DBEdit10.Text = '   -    ') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Placa" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit10.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmVeiculo.DBEdit11Exit(Sender: TObject);
begin
  if (DBEdit11.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Ano" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit11.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmVeiculo.DBEdit5Exit(Sender: TObject);
begin
  if (DBEdit5.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Valor" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit5.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmVeiculo.DBEdit6Exit(Sender: TObject);
begin
  if (DBEdit6.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cor" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;
  inherited;
end;

procedure TFrmVeiculo.DBEdit7Exit(Sender: TObject);
begin
  if (DBEdit7.Text = '') and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Km" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBEdit6.SetFocus;
      Abort
    end;

  inherited;
end;

procedure TFrmVeiculo.DBLookupComboBox1Exit(Sender: TObject);
begin
  if (varisnull(DBLookupComboBox1.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Cliente" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox1.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmVeiculo.DBLookupComboBox2Exit(Sender: TObject);
begin
  if (varisnull(DBLookupComboBox2.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Fabricante" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox2.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmVeiculo.DBLookupComboBox3Exit(Sender: TObject);
begin
  if (varisnull(DBLookupComboBox3.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Modelo" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox3.SetFocus;
      Abort;
    end;
  inherited;
end;

procedure TFrmVeiculo.DBLookupComboBox4Exit(Sender: TObject);
begin
  if (varisnull(DBLookupComboBox4.KeyValue)) and (Acao <> ' ') then
    begin
      Application.MessageBox('O campo "Combustível" é de preenchimento obrigatório.', 'Atenção', MB_OK + MB_ICONERROR);
      DBLookupComboBox4.SetFocus;
      Abort;
    end;
  inherited;
end;

end.

unit UntEstoquePosicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntConsultaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin,
  Vcl.ExtCtrls, Dados;

type
  TFrmEstoquePosicao = class(TFrmConsultaPadrao)
    TSaldo: TFDTable;
    QueryPro_Codigo: TFDAutoIncField;
    QueryPro_Descricao: TStringField;
    QueryPro_Situacao: TStringField;
    QueryPro_ControlaEstoque: TStringField;
    QuerySal_Saldo: TFloatField;
    QuerySal_Reserva: TFloatField;
    QuerySal_Encomenda: TFloatField;
    QueryPro_Unidade: TStringField;
    TSaldoSal_Produto: TIntegerField;
    TSaldoSal_Reserva: TBCDField;
    TSaldoSal_Encomenda: TBCDField;
    TSaldoSal_Saldo: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstoquePosicao: TFrmEstoquePosicao;

implementation

{$R *.dfm}

uses UntCadProduto, UntRelEstoquePosicao;

procedure TFrmEstoquePosicao.btn_consultarClick(Sender: TObject);
begin
   FrmCadProduto := TFrmCadProduto.Create(Self);
   try
      FrmCadProduto.ModoEdicaoAux := 'NNN';
      FrmCadProduto.ShowModal;
   finally
      FreeAndNil(FrmCadProduto);
   end;
  inherited;
end;

procedure TFrmEstoquePosicao.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelEstoquePosicao := TFrmRelEstoquePosicao.Create(Self);
   try
      FrmRelEstoquePosicao.btn_ImprimirClick(Self);
   finally
      FreeAndNil(FrmRelEstoquePosicao);
   end;

   inherited;
end;

procedure TFrmEstoquePosicao.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Posição de estoque';
  Caption := 'Posição de estoque';

  ModoEdicao := 'SN';
  TSaldo.Open;
  Query.Open();
end;

procedure TFrmEstoquePosicao.QueryCalcFields(DataSet: TDataSet);
begin
  inherited;

  if TSaldo.FindKey([QueryPro_Codigo.AsInteger]) then begin
     QuerySal_Reserva.AsFloat := TSaldoSal_Reserva.AsFloat;
     QuerySal_Encomenda.AsFloat := TSaldoSal_Encomenda.AsFloat;
     QuerySal_Saldo.AsFloat := TSaldoSal_Saldo.AsFloat;
  end else begin
     QuerySal_Reserva.AsFloat := 0;
     QuerySal_Encomenda.AsFloat := 0;
     QuerySal_Saldo.AsFloat := 0;
  end;
end;

end.

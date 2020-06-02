unit UntCompraHistNum;

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
  TFrmCompraHistNum = class(TFrmConsultaPadrao)
    PLegenda: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    TPes: TFDTable;
    TPesPes_Codigo: TFDAutoIncField;
    TPesPes_Nome: TStringField;
    TPesPes_RazaoSocial: TStringField;
    QuerySituacao: TStringField;
    e: TStringField;
    QueryPev_VendedorNome: TStringField;
    QueryPec_Codigo: TFDAutoIncField;
    QueryPec_Data: TDateField;
    QueryPec_Baixa: TDateField;
    QueryPec_Fornecedor: TIntegerField;
    QueryPec_Comprador: TIntegerField;
    QueryPec_Status: TStringField;
    QueryPec_ValorTotal: TBCDField;
    QueryPec_ValorProduto: TBCDField;
    QueryPec_ValorDesconto: TBCDField;
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_EstornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompraHistNum: TFrmCompraHistNum;

implementation

{$R *.dfm}

uses Rotina, UntCompra, UntRelCompra;

procedure TFrmCompraHistNum.btn_consultarClick(Sender: TObject);
begin
  Compra.ConsultarPedido(QueryPec_Codigo.asInteger);
  inherited;
end;

procedure TFrmCompraHistNum.btn_EstornarClick(Sender: TObject);
begin
  Compra.ExcluirPedido(QueryPec_Codigo.asInteger,True);
  inherited;
end;

procedure TFrmCompraHistNum.btn_ImprimirClick(Sender: TObject);
begin
  Compra.ImprimirCompra('order by pec_codigo');
  inherited;
end;

procedure TFrmCompraHistNum.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de compra - Histórico por número';
  Caption := 'Pedido de compra - Histórico por número';

  Query.Open();

  GetDireitos(ModoEdicao,'CompraConsultar;CompraEstornar');
end;

procedure TFrmCompraHistNum.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if AnsiUpperCase(Column.FieldName) = 'SITUACAO' then begin
     if QueryPec_Status.AsString = 'P' then begin
        DBGridColor(Grid,Rect,DataCol,Column,State,clMoneyGreen);
     end else if QueryPec_Status.AsString = 'B' then begin
        DBGridColor(Grid,Rect,DataCol,Column,State,clActiveCaption);
     end;
  end;
end;

end.

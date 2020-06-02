unit UntVendaHistNum;

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
  TFrmVendaHistNum = class(TFrmConsultaPadrao)
    PLegenda: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    TPes: TFDTable;
    TPesPes_Codigo: TFDAutoIncField;
    TPesPes_Nome: TStringField;
    TPesPes_RazaoSocial: TStringField;
    QueryPev_Codigo: TFDAutoIncField;
    QueryPev_Data: TDateField;
    QueryPev_Baixa: TDateField;
    QueryPev_Cliente: TIntegerField;
    QueryPev_Vendedor: TIntegerField;
    QueryPev_Status: TStringField;
    QueryPev_ValorTotal: TBCDField;
    QueryPev_ValorProduto: TBCDField;
    QueryPev_ValorDesconto: TBCDField;
    QuerySituacao: TStringField;
    e: TStringField;
    QueryPev_VendedorNome: TStringField;
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
  FrmVendaHistNum: TFrmVendaHistNum;

implementation

{$R *.dfm}

uses Rotina, UntVenda;

procedure TFrmVendaHistNum.btn_consultarClick(Sender: TObject);
begin
  Venda.ConsultarPedido(QueryPev_Codigo.asInteger);
  inherited;
end;

procedure TFrmVendaHistNum.btn_EstornarClick(Sender: TObject);
var nPedido: Integer;
begin
  nPedido := QueryPev_Codigo.asInteger;
  Venda.ExcluirPedido(nPedido,True);
  inherited;
  Query.Locate('Pev_Codigo',nPedido);
end;

procedure TFrmVendaHistNum.btn_ImprimirClick(Sender: TObject);
begin
  Venda.ImprimirVenda(' order by pev_codigo');
  inherited;
end;

procedure TFrmVendaHistNum.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de venda - Histórico por número';
  Caption := 'Pedido de venda - Histórico por número';

  Query.Open();

  GetDireitos(ModoEdicao,'VendaConsultar;VendaEstornar');
end;

procedure TFrmVendaHistNum.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if AnsiUpperCase(Column.FieldName) = 'SITUACAO' then begin
     if QueryPev_Status.AsString = 'P' then begin
        DBGridColor(Grid,Rect,DataCol,Column,State,clMoneyGreen);
     end else if QueryPev_Status.AsString = 'B' then begin
        DBGridColor(Grid,Rect,DataCol,Column,State,clActiveCaption);
     end;
  end;
end;

end.

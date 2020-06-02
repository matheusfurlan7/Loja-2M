unit UntManPedidoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntManPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFrmManPedidoCompra = class(TFrmManPadrao)
    TPes: TFDTable;
    TPesPes_Codigo: TFDAutoIncField;
    TPesPes_Nome: TStringField;
    TPesPes_RazaoSocial: TStringField;
    FDTPec_Codigo: TFDAutoIncField;
    FDTPec_Data: TDateField;
    FDTPec_Baixa: TDateField;
    FDTPec_Fornecedor: TIntegerField;
    FDTPec_Comprador: TIntegerField;
    FDTPec_Status: TStringField;
    FDTPec_ValorTotal: TBCDField;
    FDTPec_ValorProduto: TBCDField;
    FDTPec_ValorDesconto: TBCDField;
    FDTPec_NomeComprador: TStringField;
    procedure btn_BaixarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure SetPrimary(isAlt: Boolean = False);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManPedidoCompra: TFrmManPedidoCompra;

implementation

{$R *.dfm}

uses Dados, UntCadPedidoCompra, UntCompra, Rotina;

procedure TFrmManPedidoCompra.btn_AlterarClick(Sender: TObject);
begin
  FrmCadPedidoCompra := TFrmCadPedidoCompra.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoCompra.FDT.Edit;
     if FrmCadPedidoCompra.ShowModal = MrOk then begin
        FDT.Refresh;
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoCompra);
  end;

  inherited;
end;

procedure TFrmManPedidoCompra.btn_BaixarClick(Sender: TObject);
begin
  Compra.BaixarPedido(FDTPec_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoCompra.btn_consultarClick(Sender: TObject);
begin
  Compra.ConsultarPedido(FDTPec_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoCompra.btn_ExcluirClick(Sender: TObject);
begin
  Compra.ExcluirPedido(FDTPec_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoCompra.btn_ImprimirClick(Sender: TObject);
begin
  Compra.ImprimirCompra(' where Pec_Status = ' + QuotedStr('P') + ' order by pec_codigo');

  inherited;
end;

procedure TFrmManPedidoCompra.btn_InserirClick(Sender: TObject);
begin
  FrmCadPedidoCompra := TFrmCadPedidoCompra.Create(Self);
  try
     FrmCadPedidoCompra.FDT.Append;
     if FrmCadPedidoCompra.ShowModal = MrOk then begin
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoCompra);
  end;

  inherited;
end;

procedure TFrmManPedidoCompra.SetPrimary(isAlt: Boolean = False);
begin
   if isAlt then begin
      FrmCadPedidoCompra.FDT.FindKey([FDTPec_Codigo.AsInteger]);
   end else begin
      FDT.FindKey([FrmCadPedidoCompra.FDTPec_Codigo.AsInteger]);
   end;
end;

procedure TFrmManPedidoCompra.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de compra - Manutenção';
  Caption := 'Pedido de compra - Manutenção';
  FDT.Open();
  GetDireitos(ModoEdicao,'CompraIncluir;CompraAlterar;CompraConsultar;CompraExcluir;CompraBaixar');
end;

end.

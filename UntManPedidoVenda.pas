unit UntManPedidoVenda;

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
  TFrmManPedidoVenda = class(TFrmManPadrao)
    FDTPev_Codigo: TIntegerField;
    FDTPev_Data: TDateField;
    FDTPev_Baixa: TDateField;
    FDTPev_Cliente: TIntegerField;
    FDTPev_Vendedor: TIntegerField;
    FDTPev_Status: TStringField;
    FDTPev_ValorTotal: TBCDField;
    FDTPev_ValorProduto: TBCDField;
    FDTPev_ValorDesconto: TBCDField;
    FDTPev_ClienteNome: TStringField;
    TPes: TFDTable;
    TPesPes_Codigo: TFDAutoIncField;
    TPesPes_Nome: TStringField;
    TPesPes_RazaoSocial: TStringField;
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
  FrmManPedidoVenda: TFrmManPedidoVenda;

implementation

{$R *.dfm}

uses Dados, UntCadPedidoVenda, UntVenda, Rotina;

procedure TFrmManPedidoVenda.btn_AlterarClick(Sender: TObject);
begin
  FrmCadPedidoVenda := TFrmCadPedidoVenda.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoVenda.FDT.Edit;
     if FrmCadPedidoVenda.ShowModal = MrOk then begin
        FDT.Refresh;
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoVenda);
  end;

  inherited;
end;

procedure TFrmManPedidoVenda.btn_BaixarClick(Sender: TObject);
begin
  Venda.BaixarPedido(FDTPEv_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoVenda.btn_consultarClick(Sender: TObject);
begin
  Venda.ConsultarPedido(FDTPev_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoVenda.btn_ExcluirClick(Sender: TObject);
begin
  Venda.ExcluirPedido(FDTPev_Codigo.AsInteger);
  inherited;
end;

procedure TFrmManPedidoVenda.btn_ImprimirClick(Sender: TObject);
begin
  Venda.ImprimirVenda(' where pev_status = '+QuotedStr('P') + ' order by pev_codigo');
  inherited;
end;

procedure TFrmManPedidoVenda.btn_InserirClick(Sender: TObject);
begin
  FrmCadPedidoVenda := TFrmCadPedidoVenda.Create(Self);
  try
     FrmCadPedidoVenda.FDT.Append;
     if FrmCadPedidoVenda.ShowModal = MrOk then begin
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoVenda);
  end;

  inherited;
end;

procedure TFrmManPedidoVenda.SetPrimary(isAlt: Boolean = False);
begin
   if isAlt then begin
      FrmCadPedidoVenda.FDT.FindKey([FDTPev_Codigo.AsInteger]);
   end else begin
      FDT.FindKey([FrmCadPedidoVenda.FDTPev_Codigo.AsInteger]);
   end;
end;

procedure TFrmManPedidoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de venda - Manutenção';
  Caption := 'Pedido de venda - Manutenção';
  FDT.Open();
  GetDireitos(ModoEdicao,'VendaIncluir;VendaAlterar;VendaConsultar;VendaExcluir;VendaBaixar');
end;

end.

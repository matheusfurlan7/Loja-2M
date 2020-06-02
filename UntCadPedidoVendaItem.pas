unit UntCadPedidoVendaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao2, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, View;

type
  TFrmCadPedidoVendaItem = class(TFrmCadPadrao2)
    Label1: TLabel;
    EPvi_Produto: TDBEdit;
    Label2: TLabel;
    EPvi_Quantidade: TDBEdit;
    Label3: TLabel;
    EPvi_PrecoUnitario: TDBEdit;
    Label4: TLabel;
    EPvi_ValorTotal: TDBEdit;
    CPvi_Produto: TView;
    FDTPvi_PedidoVenda: TIntegerField;
    FDTPvi_Codigo: TIntegerField;
    FDTPvi_Data: TDateField;
    FDTPvi_Baixa: TDateField;
    FDTPvi_Cliente: TIntegerField;
    FDTPvi_Vendedor: TIntegerField;
    FDTPvi_Produto: TIntegerField;
    FDTPvi_Quantidade: TBCDField;
    FDTPvi_PrecoUnitario: TBCDField;
    FDTPvi_ValorTotal: TBCDField;
    FDTPvi_Status: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EDis: TEdit;
    ESal: TEdit;
    ERes: TEdit;
    QEstoque: TFDQuery;
    procedure EPvi_PrecoUnitarioExit(Sender: TObject);
    procedure EPvi_QuantidadeExit(Sender: TObject);
    procedure EPvi_ValorTotalExit(Sender: TObject);
    procedure CPvi_ProdutoActive(Sender: TObject);
    procedure EPvi_ProdutoExit(Sender: TObject);
    procedure EPvi_ProdutoEnter(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EstoqueProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPedidoVendaItem: TFrmCadPedidoVendaItem;

implementation

{$R *.dfm}


uses UntView, Math, Dados, UntEstoque, Rotina;

var nProduto: Integer;
    nProdutoAnterior: Integer;
    nQuantidadeAnterior: Real;

procedure TFrmCadPedidoVendaItem.btn_SalvarClick(Sender: TObject);
var cSql: String;
  procedure VerificaCampo;
  begin
     if (FDTPvi_Produto.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPvi_Produto.CanFocus then EPvi_Produto.SetFocus;
        Application.MessageBox('É preciso informar o campo "Produto"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPvi_PrecoUnitario.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPvi_PrecoUnitario.CanFocus then EPvi_PrecoUnitario.SetFocus;
        Application.MessageBox('É preciso informar o campo "Preco Unitario"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPvi_Quantidade.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPvi_Quantidade.CanFocus then EPvi_Quantidade.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Quantidade"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPvi_ValorTotal.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPvi_ValorTotal.CanFocus then EPvi_ValorTotal.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Valor Total"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;

  if FDT.State = dsInsert then begin
     cSql := 'select pvi_Codigo from PedidoVendaItem where Pvi_PedidoVenda = '+FDTPvi_PedidoVenda.asString;
     FDTPvi_Codigo.asInteger := D.GetILastQuery('Pvi_Codigo',cSql) + 1;
  end else if FDT.State = dsEdit then begin
     Estoque.RenoveReserva(nProdutoAnterior,nQuantidadeAnterior);
  end;

  Estoque.AdicionaReserva(FDTPvi_Produto.AsInteger,FDTPvi_Quantidade.AsFloat);

  inherited;
end;

procedure TFrmCadPedidoVendaItem.CPvi_ProdutoActive(Sender: TObject);
begin
  inherited;
  VProduto(CPvi_Produto);
end;

procedure TFrmCadPedidoVendaItem.EPvi_PrecoUnitarioExit(Sender: TObject);
begin
  inherited;
  FDTPVI_ValorTotal.asFloat := RoundTo((FDTPvi_PrecoUnitario.asFloat * FDTPvi_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoVendaItem.EPvi_ProdutoEnter(Sender: TObject);
begin
  inherited;

  nProduto := FDTPvi_Produto.asInteger;
end;

procedure TFrmCadPedidoVendaItem.EPvi_ProdutoExit(Sender: TObject);
begin
  inherited;
  if (FDTPvi_Produto.asInteger > 0) then begin
     if (FDT.State = dsInsert) and (nProduto <> FDTPvi_Produto.asInteger) then begin
        FDTPVi_PrecoUnitario.AsFloat := D.GetFQuery('Pro_PrecoVenda','select * from produto where pro_codigo = '+FDTPvi_Produto.asString);
     end;

  end else begin
     FDTPvi_PrecoUnitario.Clear;
     FDTPvi_ValorTotal.Clear;
  end;

  EstoqueProduto;
end;

procedure TFrmCadPedidoVendaItem.EstoqueProduto;
begin
   QEstoque.Close;
   QEstoque.Sql.Clear;
   QEstoque.Sql.Add('Select sal_reserva,sal_saldo from saldo where sal_produto='+IntToStr(FDTPvi_Produto.AsInteger));
   QEstoque.Open;

   if (QEstoque.RecordCount > 0) then begin
      ERes.Text := FormatFloat('0.00',QEstoque.FieldByName('sal_reserva').asFloat);
      ESal.Text := FormatFloat('0.00',QEstoque.FieldByName('sal_saldo').asFloat);
      EDis.Text := FormatFloat('0.00',(QEstoque.FieldByName('sal_saldo').asFloat - QEstoque.FieldByName('sal_reserva').asFloat));;
   end else begin
      ERes.Text := '0,00';
      ESal.Text := '0,00';
      EDis.Text := '0,00';
   end;
end;

procedure TFrmCadPedidoVendaItem.EPvi_QuantidadeExit(Sender: TObject);
begin
  inherited;
  FDTPVI_ValorTotal.asFloat := RoundTo((FDTPvi_PrecoUnitario.asFloat *   FDTPvi_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoVendaItem.EPvi_ValorTotalExit(Sender: TObject);
begin
  inherited;
  if (FDTPvi_Quantidade.asFloat = 0) then begin
     FDTPVI_PrecoUnitario.asFloat := 0;
     Exit;
  end;

  FDTPVI_PrecoUnitario.asFloat := RoundTo((FDTPvi_ValorTotal.asFloat / FDTPvi_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoVendaItem.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de venda - Item';
  Caption := 'Pedido de venda - Item';
  FDT.Open();
end;

procedure TFrmCadPedidoVendaItem.FormShow(Sender: TObject);
begin
  inherited;

  nProdutoAnterior := FDTPvi_Produto.AsInteger;
  nQuantidadeAnterior := FDTPvi_Quantidade.AsFloat;

  if FDT.State in [dsInsert,dsEdit] then begin
     if EPvi_Produto.CanFocus then EPvi_Produto.SetFocus;
  end;

  EstoqueProduto;
end;

end.

unit UntCadPedidoCompraItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao2, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, View;

type
  TFrmCadPedidoCompraItem = class(TFrmCadPadrao2)
    Label1: TLabel;
    EPci_Produto: TDBEdit;
    Label2: TLabel;
    EPci_Quantidade: TDBEdit;
    Label3: TLabel;
    EPci_PrecoUnitario: TDBEdit;
    Label4: TLabel;
    EPci_ValorTotal: TDBEdit;
    CPci_Produto: TView;
    FDTPci_PedidoCompra: TIntegerField;
    FDTPci_Codigo: TIntegerField;
    FDTPci_Data: TDateField;
    FDTPci_Baixa: TDateField;
    FDTPci_Fornecedor: TIntegerField;
    FDTPci_Comprador: TIntegerField;
    FDTPci_Produto: TIntegerField;
    FDTPci_Quantidade: TBCDField;
    FDTPci_PrecoUnitario: TBCDField;
    FDTPci_ValorTotal: TBCDField;
    FDTPci_Status: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EFut: TEdit;
    ESal: TEdit;
    EEnc: TEdit;
    QEstoque: TFDQuery;
    procedure EPci_PrecoUnitarioExit(Sender: TObject);
    procedure EPci_QuantidadeExit(Sender: TObject);
    procedure EPci_ValorTotalExit(Sender: TObject);
    procedure CPci_ProdutoActive(Sender: TObject);
    procedure EPci_ProdutoExit(Sender: TObject);
    procedure EPci_ProdutoEnter(Sender: TObject);
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
  FrmCadPedidoCompraItem: TFrmCadPedidoCompraItem;

implementation

{$R *.dfm}


uses UntView, Math, Dados, UntEstoque, Rotina;

var nProduto: Integer;
    nProdutoAnterior: Integer;
    nQuantidadeAnterior: Real;

procedure TFrmCadPedidoCompraItem.btn_SalvarClick(Sender: TObject);
var cSql: String;
  procedure VerificaCampo;
  begin
     if (FDTPci_Produto.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPci_Produto.CanFocus then EPci_Produto.SetFocus;
        Application.MessageBox('É preciso informar o campo "Produto"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPci_PrecoUnitario.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPci_PrecoUnitario.CanFocus then EPci_PrecoUnitario.SetFocus;
        Application.MessageBox('É preciso informar o campo "Preco Unitario"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPci_Quantidade.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPci_Quantidade.CanFocus then EPci_Quantidade.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Quantidade"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPci_ValorTotal.asFloat = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPci_ValorTotal.CanFocus then EPci_ValorTotal.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Valor Total"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;

  if FDT.State = dsInsert then begin
     cSql := 'select pci_Codigo from PedidoCompraItem where Pci_Pedidocompra = '+FDTPci_PedidoCompra.asString;
     FDTPci_Codigo.asInteger := D.GetILastQuery('Pci_Codigo',cSql) + 1;
  end else if FDT.State = dsEdit then begin
     Estoque.RenoveEncomenda(nProdutoAnterior,nQuantidadeAnterior);
  end;

  Estoque.AdicionaEncomenda(FDTPci_Produto.AsInteger,FDTPci_Quantidade.AsFloat);

  inherited;
end;

procedure TFrmCadPedidoCompraItem.CPci_ProdutoActive(Sender: TObject);
begin
  inherited;
  VProduto(CPci_Produto);
end;

procedure TFrmCadPedidoCompraItem.EPci_PrecoUnitarioExit(Sender: TObject);
begin
  inherited;
  FDTPci_ValorTotal.asFloat := RoundTo((FDTPci_PrecoUnitario.asFloat * FDTPci_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoCompraItem.EPci_ProdutoEnter(Sender: TObject);
begin
  inherited;

  nProduto := FDTPci_Produto.asInteger;
end;

procedure TFrmCadPedidoCompraItem.EPci_ProdutoExit(Sender: TObject);
begin
  inherited;
  if (FDTPci_Produto.asInteger > 0) then begin
     if (FDT.State = dsInsert) and (nProduto <> FDTPci_Produto.asInteger) then begin
        FDTPci_PrecoUnitario.AsFloat := D.GetFQuery('Pro_CustoMedio','select * from produto where pro_codigo = '+FDTPci_Produto.asString);
     end;
  end else begin
     FDTPci_PrecoUnitario.Clear;
     FDTPci_ValorTotal.Clear;
  end;

  EstoqueProduto;
end;

procedure TFrmCadPedidoCompraItem.EstoqueProduto;
begin
   QEstoque.Close;
   QEstoque.Sql.Clear;
   QEstoque.Sql.Add('Select sal_encomenda,sal_saldo from saldo where sal_produto='+IntToStr(FDTPci_Produto.AsInteger));
   QEstoque.Open;

   if (QEstoque.RecordCount > 0) then begin
      EEnc.Text := FormatFloat('0.00',QEstoque.FieldByName('sal_encomenda').asFloat);
      ESal.Text := FormatFloat('0.00',QEstoque.FieldByName('sal_saldo').asFloat);
      EFut.Text := FormatFloat('0.00',(QEstoque.FieldByName('sal_saldo').asFloat + QEstoque.FieldByName('sal_encomenda').asFloat));;
   end else begin
      EEnc.Text := '0,00';
      ESal.Text := '0,00';
      EFut.Text := '0,00';
   end;
end;

procedure TFrmCadPedidoCompraItem.EPci_QuantidadeExit(Sender: TObject);
begin
  inherited;
  FDTPcI_ValorTotal.asFloat := RoundTo((FDTPci_PrecoUnitario.asFloat *   FDTPci_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoCompraItem.EPci_ValorTotalExit(Sender: TObject);
begin
  inherited;
  if (FDTPci_Quantidade.asFloat = 0) then begin
     FDTPcI_PrecoUnitario.asFloat := 0;
     Exit;
  end;

  FDTPci_PrecoUnitario.asFloat := RoundTo((FDTPci_ValorTotal.asFloat / FDTPci_Quantidade.asFloat),-2);
end;

procedure TFrmCadPedidoCompraItem.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de compra - Item';
  Caption := 'Pedido de compra - Item';
  FDT.Open();
end;

procedure TFrmCadPedidoCompraItem.FormShow(Sender: TObject);
begin
  inherited;

  nProdutoAnterior := FDTPci_Produto.AsInteger;
  nQuantidadeAnterior := FDTPci_Quantidade.AsFloat;

  if FDT.State in [dsInsert,dsEdit] then begin
     if EPci_Produto.CanFocus then EPci_Produto.SetFocus;
  end;

  EstoqueProduto;
end;

end.

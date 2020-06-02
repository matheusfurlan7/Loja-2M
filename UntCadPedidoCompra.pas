unit UntCadPedidoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao3, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls,Dados,
  Vcl.Mask, Vcl.DBCtrls, View;

type
  TFrmCadPedidoCompra = class(TFrmCadPadrao3)
    Label1: TLabel;
    EPecv_Codigo: TDBEdit;
    Label2: TLabel;
    EPec_Data: TDBEdit;
    Label4: TLabel;
    EPec_Fornecedor: TDBEdit;
    Label5: TLabel;
    EPec_Comprador: TDBEdit;
    Label7: TLabel;
    EPec_ValorTotal: TDBEdit;
    Label8: TLabel;
    EPec_ValorProduto: TDBEdit;
    Label9: TLabel;
    EPec_ValorDesconto: TDBEdit;
    CPec_Fornecedor: TView;
    CPec_Comprador: TView;
    Label3: TLabel;
    EPec_Status: TComboBox;
    TPro: TFDTable;
    TProPro_Codigo: TFDAutoIncField;
    TProPro_Descricao: TStringField;
    FDTPec_Codigo: TFDAutoIncField;
    FDTPec_Data: TDateField;
    FDTPec_Baixa: TDateField;
    FDTPec_Fornecedor: TIntegerField;
    FDTPec_Comprador: TIntegerField;
    FDTPec_Status: TStringField;
    FDTPec_ValorTotal: TBCDField;
    FDTPec_ValorProduto: TBCDField;
    FDTPec_ValorDesconto: TBCDField;
    FDT2Pci_PedidoCompra: TIntegerField;
    FDT2Pci_Codigo: TIntegerField;
    FDT2Pci_Data: TDateField;
    FDT2Pci_Baixa: TDateField;
    FDT2Pci_Fornecedor: TIntegerField;
    FDT2Pci_Comprador: TIntegerField;
    FDT2Pci_Produto: TIntegerField;
    FDT2Pci_Quantidade: TBCDField;
    FDT2Pci_PrecoUnitario: TBCDField;
    FDT2Pci_ValorTotal: TBCDField;
    FDT2Pci_Status: TStringField;
    FDT2Pci_ProdutoDescricao: TStringField;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure CPec_FornecedorActive(Sender: TObject);
    procedure CPec_CompradorActive(Sender: TObject);
    procedure EPec_ValorDescontoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure FDT2AfterPost(DataSet: TDataSet);
    procedure FDT2AfterDelete(DataSet: TDataSet);
    procedure FDT2AfterInsert(DataSet: TDataSet);
    procedure FDTPec_BaixaSetText(Sender: TField; const Text: string);
    procedure FDTPec_DataSetText(Sender: TField; const Text: string);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure SetPrimary(isAlt: Boolean = False);
    procedure CalculaTotal;
    procedure CheckOption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPedidoCompra: TFrmCadPedidoCompra;

implementation

{$R *.dfm}

uses Math, UntCadPedidoCompraItem, UntView, Rotina, UntEstoque, UntCompra;

procedure TFrmCadPedidoCompra.SetPrimary(isAlt: Boolean = False);
begin
   if isAlt then begin
      FrmCadPedidoCompraItem.FDT.FindKey([FDT2Pci_PedidoCompra.AsInteger,FDT2Pci_Codigo.AsInteger]);
   end else begin
      FDT2.FindKey([FrmCadPedidoCompraItem.FDTPci_PedidoCompra.AsInteger,FrmCadPedidoCompraItem.FDTPci_Codigo.AsInteger]);
   end;
end;

procedure TFrmCadPedidoCompra.btn_AlterarClick(Sender: TObject);
begin
  FrmCadPedidoCompraItem := TFrmCadPedidoCompraItem.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoCompraItem.FDT.Edit;
     if FrmCadPedidoCompraItem.ShowModal = MrOk then begin
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoCompraItem);
  end;
  CalculaTotal;
  inherited;
end;

procedure TFrmCadPedidoCompra.btn_CancelarClick(Sender: TObject);
begin
  DS.Enabled := False;
  DS2.Enabled := False;
  inherited;
end;

procedure TFrmCadPedidoCompra.btn_ConsultarClick(Sender: TObject);
begin
  FrmCadPedidoCompraItem := TFrmCadPedidoCompraItem.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoCompraItem.ShowModal;
  finally
     FreeAndNil(FrmCadPedidoCompraItem);
  end;
  inherited;
end;

procedure TFrmCadPedidoCompra.btn_ExcluirClick(Sender: TObject);
var cMsg: String;
    nRes: Integer;
begin
   cMsg := 'Confirma a exclusão desse registro?';
   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if nRes = IDYES then begin

    Estoque.RenoveEncomenda(FDT2Pci_Produto.AsInteger,FDT2Pci_Quantidade.AsFloat);

    FDT2.Delete;
    CalculaTotal;
    cMsg := 'O registro foi excluido com sucesso.';
    Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
  end else begin
    cMsg := 'A exclusão do registro foi abortada.';
    Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
  end;
  inherited;
end;

procedure TFrmCadPedidoCompra.btn_ImprimirClick(Sender: TObject);
begin
  inherited;
  Compra.ImprimirCompra(' where pec_codigo = '+FDTPec_Codigo.asString);
end;

procedure TFrmCadPedidoCompra.btn_InserirClick(Sender: TObject);
begin
  FrmCadPedidoCompraItem := TFrmCadPedidoCompraItem.Create(Self);
  try
     FrmCadPedidoCompraItem.FDT.Insert;

     FrmCadPedidoCompraItem.FDTPci_PedidoCompra.AsInteger := FDTPec_Codigo.AsInteger;
     FrmCadPedidoCompraItem.FDTPci_Data.AsDateTime := FDTPec_Data.AsDateTime;
     FrmCadPedidoCompraItem.FDTPci_Fornecedor.AsInteger := FDTPec_Fornecedor.AsInteger;
     FrmCadPedidoCompraItem.FDTPci_Comprador.AsInteger := FDTPec_Comprador.AsInteger;
     FrmCadPedidoCompraItem.FDTPci_Status.asString := FDTPec_Status.asString;

     if FrmCadPedidoCompraItem.ShowModal = MrOk then begin
        SetPrimary;
     end;

  finally
     FreeAndNil(FrmCadPedidoCompraItem);
  end;
  CalculaTotal;
  inherited;
end;

procedure TFrmCadPedidoCompra.btn_SalvarClick(Sender: TObject);
var cSql: String;
  procedure VerificaCampo;
  begin
     if (FDTPec_Data.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EPec_Data.CanFocus then EPec_Data.SetFocus;
        Application.MessageBox('É preciso informar o campo "Data"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPec_Fornecedor.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPec_Fornecedor.CanFocus then EPec_Fornecedor.SetFocus;
        Application.MessageBox('É preciso informar o campo "Fornecedor"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPec_Comprador.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPec_Fornecedor.CanFocus then EPec_Fornecedor.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Comprador"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
  cSql := 'update pedidocompraitem set';
  cSql := cSql + ' pci_fornecedor = '+FDTPec_Fornecedor.AsString;
  cSql := cSql + ' ,pci_comprador = '+FDTPec_Comprador.AsString;
  cSql := cSql + ' where Pci_Pedidocompra = '+FDTPec_Codigo.AsString;
  D.ExecSql(cSql);
  CheckOption;
end;

procedure TFrmCadPedidoCompra.CalculaTotal;
var Book: TBookmark;
begin
  FDT2.DisableControls;

  Book := FDT2.GetBookmark;
  FDTPec_ValorProduto.Clear;
  FDT2.First;
  while not FDT2.Eof do begin
     FDTPec_ValorProduto.asFloat := FDTPec_ValorProduto.asFloat + FDT2Pci_ValorTotal.asFloat;
     FDT2.Next;
  end;
  FDT2.GotoBookmark(Book);
  FDT2.FreeBookmark(Book);

  FDT2.EnableControls;

  FDTPec_ValorTotal.AsFloat := RoundTo(FDTPec_ValorProduto.AsFloat - FDTPec_ValorDesconto.AsFloat,-2);

  FDT.Post;
  FDT.Edit;
end;

procedure TFrmCadPedidoCompra.CPec_FornecedorActive(Sender: TObject);
begin
  inherited;
  VPessoa(CPec_Fornecedor,'Fornecedor');
end;

procedure TFrmCadPedidoCompra.CPec_CompradorActive(Sender: TObject);
begin
  inherited;
  VPessoa(CPec_Comprador,'Comprador');
end;

procedure TFrmCadPedidoCompra.FDT2AfterDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmCadPedidoCompra.FDT2AfterInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmCadPedidoCompra.FDT2AfterPost(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmCadPedidoCompra.FDTPec_BaixaSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPedidoCompra.FDTPec_DataSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if btn_Inserir.Enabled then begin
     ModalResult := MrOk;
  end;
end;

procedure TFrmCadPedidoCompra.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de compra';
  Caption := 'Pedido de compra';
  FDT.Open();
  FDT2.Open();
end;

procedure TFrmCadPedidoCompra.FormShow(Sender: TObject);
begin
  inherited;
  CheckOption;
end;

procedure TFrmCadPedidoCompra.CheckOption;
begin
  if FDT.State = dsInsert then begin
     FDTPec_Data.AsDateTime := Date;
     FDTPec_Status.asString := 'P';
     FDTPec_ValorTotal.AsFloat := 0;
     FDTPec_ValorDesconto.AsFloat := 0;
     FDTPec_ValorProduto.AsFloat := 0;
  end;
  if EPec_Fornecedor.CanFocus then EPec_Fornecedor.SetFocus;

  if FDTPec_Status.AsString = 'P' then EPec_Status.ItemIndex := 0
  else EPec_Status.ItemIndex := 1;
end;

procedure TFrmCadPedidoCompra.EPec_ValorDescontoExit(Sender: TObject);
begin
  inherited;
  FDTPec_ValorTotal.AsFloat := RoundTo(FDTPec_ValorProduto.AsFloat - FDTPec_ValorDesconto.AsFloat,-2);
end;

end.

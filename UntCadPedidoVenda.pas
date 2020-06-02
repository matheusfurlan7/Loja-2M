unit UntCadPedidoVenda;

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
  TFrmCadPedidoVenda = class(TFrmCadPadrao3)
    FDT2Pvi_PedidoVenda: TIntegerField;
    FDT2Pvi_Codigo: TIntegerField;
    FDT2Pvi_Data: TDateField;
    FDT2Pvi_Baixa: TDateField;
    FDT2Pvi_Cliente: TIntegerField;
    FDT2Pvi_Vendedor: TIntegerField;
    FDT2Pvi_Produto: TIntegerField;
    FDT2Pvi_Quantidade: TBCDField;
    FDT2Pvi_PrecoUnitario: TBCDField;
    FDT2Pvi_ValorTotal: TBCDField;
    FDT2Pvi_Status: TStringField;
    FDT2Pvi_ProdutoDescricao: TStringField;
    Label1: TLabel;
    EPev_Codigo: TDBEdit;
    Label2: TLabel;
    EPev_Data: TDBEdit;
    Label4: TLabel;
    EPev_Cliente: TDBEdit;
    Label5: TLabel;
    EPev_Vendedor: TDBEdit;
    Label7: TLabel;
    EPev_ValorTotal: TDBEdit;
    Label8: TLabel;
    EPev_ValorProduto: TDBEdit;
    Label9: TLabel;
    EPev_ValorDesconto: TDBEdit;
    CPev_Cliente: TView;
    CPev_Vendedor: TView;
    FDTPev_Codigo: TFDAutoIncField;
    FDTPev_Data: TDateField;
    FDTPev_Baixa: TDateField;
    FDTPev_Cliente: TIntegerField;
    FDTPev_Vendedor: TIntegerField;
    FDTPev_Status: TStringField;
    FDTPev_ValorTotal: TBCDField;
    FDTPev_ValorProduto: TBCDField;
    FDTPev_ValorDesconto: TBCDField;
    Label3: TLabel;
    EPev_Status: TComboBox;
    TPro: TFDTable;
    TProPro_Codigo: TFDAutoIncField;
    TProPro_Descricao: TStringField;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure CPev_ClienteActive(Sender: TObject);
    procedure CPev_VendedorActive(Sender: TObject);
    procedure EPev_ValorDescontoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure FDTPev_DataSetText(Sender: TField; const Text: string);
    procedure FDTPev_BaixaSetText(Sender: TField; const Text: string);
    procedure FDT2AfterInsert(DataSet: TDataSet);
    procedure FDT2AfterPost(DataSet: TDataSet);
    procedure FDT2AfterDelete(DataSet: TDataSet);
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
  FrmCadPedidoVenda: TFrmCadPedidoVenda;

implementation

{$R *.dfm}

uses Math, UntCadPedidoVendaItem, UntView, Rotina, UntEstoque, UntVenda;

procedure TFrmCadPedidoVenda.SetPrimary(isAlt: Boolean = False);
begin
   if isAlt then begin
      FrmCadPedidoVendaItem.FDT.FindKey([FDT2Pvi_PedidoVenda.AsInteger,FDT2Pvi_Codigo.AsInteger]);
   end else begin
      FDT2.FindKey([FrmCadPedidoVendaItem.FDTPvi_PedidoVenda.AsInteger,FrmCadPedidoVendaItem.FDTPvi_Codigo.AsInteger]);
   end;
end;

procedure TFrmCadPedidoVenda.btn_AlterarClick(Sender: TObject);
begin
  FrmCadPedidoVendaItem := TFrmCadPedidoVendaItem.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoVendaItem.FDT.Edit;
     if FrmCadPedidoVendaItem.ShowModal = MrOk then begin
        SetPrimary;
     end;
  finally
     FreeAndNil(FrmCadPedidoVendaItem);
  end;
  CalculaTotal;
  inherited;
end;

procedure TFrmCadPedidoVenda.btn_CancelarClick(Sender: TObject);
begin
  DS.Enabled := False;
  DS2.Enabled := False;
  inherited;
end;

procedure TFrmCadPedidoVenda.btn_ConsultarClick(Sender: TObject);
begin
  FrmCadPedidoVendaItem := TFrmCadPedidoVendaItem.Create(Self);
  try
     SetPrimary(True);
     FrmCadPedidoVendaItem.ShowModal;
  finally
     FreeAndNil(FrmCadPedidoVendaItem);
  end;
  inherited;
end;

procedure TFrmCadPedidoVenda.btn_ExcluirClick(Sender: TObject);
var cMsg: String;
    nRes: Integer;
begin
   cMsg := 'Confirma a exclusão desse registro?';
   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if nRes = IDYES then begin

    Estoque.RenoveReserva(FDT2Pvi_Produto.AsInteger,FDT2Pvi_Quantidade.AsFloat);

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

procedure TFrmCadPedidoVenda.btn_ImprimirClick(Sender: TObject);
begin
  inherited;
  Venda.ImprimirVenda(' where pev_codigo = '+FDTPev_Codigo.AsString);
end;

procedure TFrmCadPedidoVenda.btn_InserirClick(Sender: TObject);
begin
  FrmCadPedidoVendaItem := TFrmCadPedidoVendaItem.Create(Self);
  try
     FrmCadPedidoVendaItem.FDT.Insert;

     FrmCadPedidoVendaItem.FDTPvi_PedidoVenda.AsInteger := FDTPev_Codigo.AsInteger;
     FrmCadPedidoVendaItem.FDTPvi_Data.AsDateTime := FDTPev_Data.AsDateTime;
     FrmCadPedidoVendaItem.FDTPvi_Cliente.AsInteger := FDTPev_Cliente.AsInteger;
     FrmCadPedidoVendaItem.FDTPvi_Vendedor.AsInteger := FDTPev_Vendedor.AsInteger;
     FrmCadPedidoVendaItem.FDTPvi_Status.asString := FDTPev_Status.asString;

     if FrmCadPedidoVendaItem.ShowModal = MrOk then begin
        SetPrimary;
     end;

  finally
     FreeAndNil(FrmCadPedidoVendaItem);
  end;
  CalculaTotal;
  inherited;
end;

procedure TFrmCadPedidoVenda.btn_SalvarClick(Sender: TObject);
var cSql: String;
  procedure VerificaCampo;
  begin
     if (FDTPev_Data.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EPev_Data.CanFocus then EPev_Data.SetFocus;
        Application.MessageBox('É preciso informar o campo "Data"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPev_Cliente.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPev_Cliente.CanFocus then EPev_Cliente.SetFocus;
        Application.MessageBox('É preciso informar o campo "Cliente"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPev_Vendedor.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPev_Vendedor.CanFocus then EPev_Vendedor.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Vendedor"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
  cSql := 'update pedidovendaitem set';
  cSql := cSql + ' pvi_cliente = '+FDTPev_Cliente.AsString;
  cSql := cSql + ' ,pvi_vendedor = '+FDTPev_Vendedor.AsString;
  cSql := cSql + ' where Pvi_PedidoVenda = '+FDTPev_Codigo.AsString;
  D.ExecSql(cSql);
  CheckOption;
end;

procedure TFrmCadPedidoVenda.CalculaTotal;
var Book: TBookmark;
begin
  FDT2.DisableControls;

  Book := FDT2.GetBookmark;
  FDTPev_ValorProduto.Clear;
  FDT2.First;
  while not FDT2.Eof do begin
     FDTPev_ValorProduto.asFloat := FDTPev_ValorProduto.asFloat + FDT2Pvi_ValorTotal.asFloat;
     FDT2.Next;
  end;
  FDT2.GotoBookmark(Book);
  FDT2.FreeBookmark(Book);

  FDT2.EnableControls;

  FDTPev_ValorTotal.AsFloat := RoundTo(FDTPev_ValorProduto.AsFloat - FDTPev_ValorDesconto.AsFloat,-2);

  FDT.Post;
  FDT.Edit;
end;

procedure TFrmCadPedidoVenda.CPev_ClienteActive(Sender: TObject);
begin
  inherited;
  VPessoa(CPev_Cliente,'Cliente');
end;

procedure TFrmCadPedidoVenda.CPev_VendedorActive(Sender: TObject);
begin
  inherited;
  VPessoa(CPev_Vendedor,'Vendedor');
end;

procedure TFrmCadPedidoVenda.FDT2AfterDelete(DataSet: TDataSet);
begin
   Abort;
end;

procedure TFrmCadPedidoVenda.FDT2AfterInsert(DataSet: TDataSet);
begin
   Abort;
end;

procedure TFrmCadPedidoVenda.FDT2AfterPost(DataSet: TDataSet);
begin
   Abort;
end;

procedure TFrmCadPedidoVenda.FDTPev_BaixaSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPedidoVenda.FDTPev_DataSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPedidoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if btn_Inserir.Enabled then begin
     ModalResult := MrOk;
  end;
end;

procedure TFrmCadPedidoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Pedido de venda';
  Caption := 'Pedido de venda';
  FDT.Open();
  FDT2.Open();
end;

procedure TFrmCadPedidoVenda.FormShow(Sender: TObject);
begin
  inherited;
  CheckOption;
end;

procedure TFrmCadPedidoVenda.CheckOption;
begin
  if FDT.State = dsInsert then begin
     FDTPev_Data.AsDateTime := Date;
     FDTPev_Status.asString := 'P';
     FDTPev_ValorTotal.AsFloat := 0;
     FDTPev_ValorDesconto.AsFloat := 0;
     FDTPev_ValorProduto.AsFloat := 0;
  end;
  if EPev_Cliente.CanFocus then EPev_Cliente.SetFocus;

  if FDTPev_Status.AsString = 'P' then EPev_Status.ItemIndex := 0
  else EPev_Status.ItemIndex := 1;
end;

procedure TFrmCadPedidoVenda.EPev_ValorDescontoExit(Sender: TObject);
begin
  inherited;
  FDTPev_ValorTotal.AsFloat := RoundTo(FDTPev_ValorProduto.AsFloat - FDTPev_ValorDesconto.AsFloat,-2);
end;

end.

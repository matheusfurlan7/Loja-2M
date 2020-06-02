unit UntCompraHistFor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntConsultaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin,
  Vcl.ExtCtrls, Dados, View, Vcl.Buttons, Vcl.Mask;

type
  TFrmCompraHistFor = class(TFrmConsultaPadrao)
    PLegenda: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    TPes: TFDTable;
    TPesPes_Codigo: TFDAutoIncField;
    TPesPes_Nome: TStringField;
    TPesPes_RazaoSocial: TStringField;
    QuerySituacao: TStringField;
    QueryPes_Nome: TStringField;
    RichEdit1: TRichEdit;
    Label2: TLabel;
    EFor: TEdit;
    CFor: TView;
    Processar: TBitBtn;
    Label3: TLabel;
    ESituacao: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EDatIni: TMaskEdit;
    EDatFim: TMaskEdit;
    Label6: TLabel;
    EConsiderar: TComboBox;
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
    procedure EForExit(Sender: TObject);
    procedure CForActive(Sender: TObject);
    procedure EForChange(Sender: TObject);
    procedure ProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EDatIniExit(Sender: TObject);
    procedure EDatFimExit(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure CheckChange;
    function GetSqlWhere: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompraHistFor: TFrmCompraHistFor;

implementation

{$R *.dfm}

uses Rotina, UntCompra, UntView, UntRelCompra;

procedure TFrmCompraHistFor.btn_consultarClick(Sender: TObject);
begin
  Compra.ConsultarPedido(QueryPec_Codigo.asInteger);
  inherited;
end;

procedure TFrmCompraHistFor.btn_EstornarClick(Sender: TObject);
var nPedido: Integer;
begin
  nPedido := QueryPec_Codigo.asInteger;
  Compra.ExcluirPedido(nPedido,True);
  inherited;
  ProcessarClick(Self);
  Query.Locate('Pec_Codigo',nPedido);
end;

procedure TFrmCompraHistFor.btn_ImprimirClick(Sender: TObject);
begin
    Compra.ImprimirCompra(GetSqlWhere);

  inherited;
end;

procedure TFrmCompraHistFor.CForActive(Sender: TObject);
begin
  inherited;
  VPessoa(CFor,'Fornecedor');
end;

procedure TFrmCompraHistFor.EForChange(Sender: TObject);
begin
  inherited;
  CheckChange;
end;

procedure TFrmCompraHistFor.CheckChange;
begin
   if DS.Enabled then begin
      DS.Enabled := False;
      Botoes(False);
   end;
end;

procedure TFrmCompraHistFor.EForExit(Sender: TObject);
begin
  inherited;
  CFor.Valid;
end;

procedure TFrmCompraHistFor.EDatFimExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatFim);
end;

procedure TFrmCompraHistFor.EDatIniExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatIni);
end;

procedure TFrmCompraHistFor.FormCreate(Sender: TObject);
begin
  inherited;

  LCad.Caption := 'Pedido de compra - Histórico por fornecedor';
  Caption := 'Pedido de compra - Histórico por fornecedor';

  GetDireitos(ModoEdicao,'CompraConsultar;CompraEstornar');
end;

procedure TFrmCompraHistFor.FormShow(Sender: TObject);
begin
  inherited;
  if EFor.CanFocus then EFor.SetFocus;
end;

procedure TFrmCompraHistFor.GridDrawColumnCell(Sender: TObject;
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

procedure TFrmCompraHistFor.ProcessarClick(Sender: TObject);
begin
  inherited;
  if (Trim(EFor.Text) = '') then begin
     Beep;
     Application.MessageBox('É preciso informar o fornecedor!','Aviso',MB_OK+ MB_ICONINFORMATION);
     EFor.SetFocus;
     Exit;
  end;

  {if (EDatIni.Text = '  /  /    ') then begin
     Beep;
     Application.MessageBox('É preciso informar a data inicial!','Aviso',MB_OK + ICONINFORMATION);
     EDatIni.SetFocus;
     Exit;
  end;}

  Query.Close;

  // Sql
  Query.Sql.Clear;
  Query.Sql.Add('select * from pedidocompra');
  Query.SQL.Add(GetSqlWhere);
  Query.Open;

  PLegenda.Visible := (ESituacao.Text = 'Todos');
  Grid.Columns.Items[2].Visible := (ESituacao.Text <> 'Pendente');
  Grid.Columns.Items[7].Visible := (ESituacao.Text = 'Todos');

  GridTitleClick(Grid.Columns.Items[0]);
  DS.Enabled := True;
  Botoes;
end;

function TFrmCompraHistFor.GetSqlWhere: String;
var dDatIni: TDateTime;
    dDatFim: TDateTime;
begin
  Result := '';

  dDatIni := 0;
  dDatFim := StrToDate('01/01/3000');

  if (RemoveMask(EDatIni.Text,True) <> '') then
     dDatIni := StrToDateTime(EDatIni.Text);
  if (RemoveMask(EDatFim.Text,True) <> '') then
     dDatFim := StrToDateTime(EDatFim.Text);

  Result := Result + 'where (pec_fornecedor = '+EFor.Text+')';
  if (EConsiderar.Text = 'Pedido') then Result := Result + ' and ' + GetSqlBetween('Pec_data',dDatIni,dDatFim)
  else Result := Result + ' and ' + GetSqlBetween('Pec_Baixa',dDatIni,dDatFim);
  if Esituacao.Text <> 'Todos' then Result := Result + ' and Pec_Status = ' + QuotedStr(Copy(ESituacao.Text,1,1));
  Result := Result + ' order by pec_codigo';
end;

end.

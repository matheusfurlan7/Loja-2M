unit UntVendaHistVen;

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
  TFrmVendaHistVen = class(TFrmConsultaPadrao)
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
    RichEdit1: TRichEdit;
    Label2: TLabel;
    EVen: TEdit;
    CVen: TView;
    Processar: TBitBtn;
    Label3: TLabel;
    ESituacao: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EDatIni: TMaskEdit;
    EDatFim: TMaskEdit;
    Label6: TLabel;
    EConsiderar: TComboBox;
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_EstornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EVenExit(Sender: TObject);
    procedure CVenActive(Sender: TObject);
    procedure EVenChange(Sender: TObject);
    procedure ProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EDatIniExit(Sender: TObject);
    procedure EDatFimExit(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure CheckChange;
    function GetWhereSql: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendaHistVen: TFrmVendaHistVen;

implementation

{$R *.dfm}

uses Rotina, UntVenda, UntView;

procedure TFrmVendaHistVen.btn_consultarClick(Sender: TObject);
begin
  Venda.ConsultarPedido(QueryPev_Codigo.asInteger);
  inherited;
end;

procedure TFrmVendaHistVen.btn_EstornarClick(Sender: TObject);
var nPedido: Integer;
begin
  nPedido := QueryPev_Codigo.asInteger;
  Venda.ExcluirPedido(nPedido,True);
  inherited;
  ProcessarClick(Self);
  Query.Locate('Pev_Codigo',nPedido);
end;

procedure TFrmVendaHistVen.btn_ImprimirClick(Sender: TObject);
begin
  Venda.ImprimirVenda(GetWhereSql);
  inherited;
end;

procedure TFrmVendaHistVen.CVenActive(Sender: TObject);
begin
  inherited;
  VPessoa(CVen,'Vendedor');
end;

procedure TFrmVendaHistVen.EVenChange(Sender: TObject);
begin
  inherited;
  CheckChange;
end;

procedure TFrmVendaHistVen.CheckChange;
begin
   if DS.Enabled then begin
      DS.Enabled := False;
      Botoes(False);
   end;
end;

procedure TFrmVendaHistVen.EVenExit(Sender: TObject);
begin
  inherited;
  CVen.Valid;
end;

procedure TFrmVendaHistVen.EDatFimExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatFim);
end;

procedure TFrmVendaHistVen.EDatIniExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatIni);
end;

procedure TFrmVendaHistVen.FormCreate(Sender: TObject);
begin
  inherited;

  LCad.Caption := 'Pedido de venda - Histórico por vendedor';
  Caption := 'Pedido de venda - Histórico por vendedor';

  GetDireitos(ModoEdicao,'VendaConsultar;VendaEstornar');
end;

procedure TFrmVendaHistVen.FormShow(Sender: TObject);
begin
  inherited;
  if EVen.CanFocus then EVen.SetFocus;
end;

procedure TFrmVendaHistVen.GridDrawColumnCell(Sender: TObject;
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

procedure TFrmVendaHistVen.ProcessarClick(Sender: TObject);
begin
  inherited;
  if (Trim(EVen.Text) = '') then begin
     Beep;
     Application.MessageBox('É preciso informar o vendedor!','Aviso',MB_OK+ MB_ICONINFORMATION);
     EVen .SetFocus;
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
  Query.Sql.Add('select * from pedidovenda');
  Query.Sql.Add(GetWhereSql);
  Query.Open;

  PLegenda.Visible := (ESituacao.Text = 'Todos');
  Grid.Columns.Items[2].Visible := (ESituacao.Text <> 'Pendente');
  Grid.Columns.Items[7].Visible := (ESituacao.Text = 'Todos');

  GridTitleClick(Grid.Columns.Items[0]);
  DS.Enabled := True;
  Botoes;
end;

function TFrmVendaHistVen.GetWhereSql: String;
var dDatIni: TDateTime;
    dDatFim: TDateTime;
begin
   Result := '';

   dDatIni := 0;
   dDatFim := StrToDate('01/01/3000');

   if (RemoveMask(EDatIni.Text,True) <> '') then dDatIni := StrToDateTime(EDatIni.Text);
   if (RemoveMask(EDatFim.Text,True) <> '') then dDatFim := StrToDateTime(EDatFim.Text);

   Result  := Result + 'where (pev_Vendedor = '+EVen.Text+')';
   if (EConsiderar.Text = 'Pedido') then Result := Result + ' and ' + GetSqlBetween('Pev_data',dDatIni,dDatFim)
   else Result := Result + ' and ' + GetSqlBetween('Pev_Baixa',dDatIni,dDatFim);
   if Esituacao.Text <> 'Todos' then Result := Result + ' and Pev_Status = ' + QuotedStr(Copy(ESituacao.Text,1,1));
   Result := Result + 'order by pev_codigo';
end;

end.

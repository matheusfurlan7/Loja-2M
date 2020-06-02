unit UntEstoqueHistPro;

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
  TFrmEstoqueHistPro = class(TFrmConsultaPadrao)
    RichEdit1: TRichEdit;
    Label2: TLabel;
    EPro: TEdit;
    CPro: TView;
    Processar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    EDatIni: TMaskEdit;
    EDatFim: TMaskEdit;
    QueryMov_Produto: TIntegerField;
    QueryMov_Data: TDateField;
    QueryMov_Sequencia: TIntegerField;
    QueryMov_TipoDeMovimento: TStringField;
    QueryMov_SaldoAnterior: TBCDField;
    QueryMov_SaldoAtual: TBCDField;
    QueryMov_Quantidade: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure EProExit(Sender: TObject);
    procedure CProActive(Sender: TObject);
    procedure EProChange(Sender: TObject);
    procedure ProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EDatIniExit(Sender: TObject);
    procedure EDatFimExit(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure CheckChange;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstoqueHistPro: TFrmEstoqueHistPro;

implementation

{$R *.dfm}

uses Rotina, UntCompra, UntView, UntRelEstoqueHistPro;

procedure TFrmEstoqueHistPro.CProActive(Sender: TObject);
begin
  inherited;
  VProduto(CPro);
end;

procedure TFrmEstoqueHistPro.EProChange(Sender: TObject);
begin
  inherited;
  CheckChange;
end;

procedure TFrmEstoqueHistPro.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelEstoqueHistPro := TFrmRelEstoqueHistPro.Create(Self);
   try
      FrmRelEstoqueHistPro.btn_ImprimirClick(nil);
   finally
      FreeAndNil(FrmRelEstoqueHistPro);
   end;

   inherited;
end;

procedure TFrmEstoqueHistPro.btn_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmEstoqueHistPro.CheckChange;
begin
   if DS.Enabled then begin
      DS.Enabled := False;
      Botoes(False);
   end;
end;

procedure TFrmEstoqueHistPro.EProExit(Sender: TObject);
begin
  inherited;
  CPro.Valid;
end;

procedure TFrmEstoqueHistPro.EDatFimExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatFim);
end;

procedure TFrmEstoqueHistPro.EDatIniExit(Sender: TObject);
begin
  inherited;
  AjustaData(EDatIni);
end;

procedure TFrmEstoqueHistPro.FormCreate(Sender: TObject);
begin
  inherited;

  LCad.Caption := 'Movimento - Histórico de movimentação por produto';
  Caption := 'Movimento - Histórico de movimentação por produto';

  ModoEdicao := 'NN';
end;

procedure TFrmEstoqueHistPro.FormShow(Sender: TObject);
begin
  inherited;
  if EPro.CanFocus then EPro.SetFocus;
end;

procedure TFrmEstoqueHistPro.ProcessarClick(Sender: TObject);
var dDatIni: TDateTime;
    dDatFim: TDateTime;
begin
    inherited;
    if (Trim(EPro.Text) = '') then begin
       Beep;
       Application.MessageBox('É preciso informar o "Produto"!','Aviso',MB_OK+ MB_ICONINFORMATION);
       EPro.SetFocus;
       Exit;
    end;

    dDatIni := 0;
    dDatFim := StrToDate('01/01/3000');

    if (RemoveMask(EDatIni.Text,True) <> '') then
       dDatIni := StrToDateTime(EDatIni.Text);
    if (RemoveMask(EDatFim.Text,True) <> '') then
       dDatFim := StrToDateTime(EDatFim.Text);

    Query.Close;

    // Sql
    Query.Sql.Clear;
    Query.Sql.Add('select * from movimento ');
    Query.Sql.Add('where (mov_produto = '+EPro.Text+')');
    Query.Sql.Add(' and ' + GetSqlBetween('Mov_data',dDatIni,dDatFim));
    Query.Sql.Add('order by Mov_data,Mov_Sequencia');
    Query.Open;

    GridTitleClick(Grid.Columns.Items[0]);
    DS.Enabled := True;
    Botoes;
end;

end.

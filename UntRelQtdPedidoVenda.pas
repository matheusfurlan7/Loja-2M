unit UntRelQtdPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntRelPadrao2, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxExportRTF, frxExportImage, frxExportHTML, frxExportCSV,
  frxExportText, frxExportPDF, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, frxDBSet;

type
  TFrmRelQtdPedidoVenda = class(TFrmRelPadrao2)
    DS: TDataSource;
    Q: TFDQuery;
    GNascimento: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ENascimentoDe: TMaskEdit;
    ENascimentoAte: TMaskEdit;
    DB: TfrxDBDataset;
    procedure btn_ImprimirClick(Sender: TObject);
    procedure ENascimentoDeExit(Sender: TObject);
    procedure ENascimentoAteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelQtdPedidoVenda: TFrmRelQtdPedidoVenda;

implementation

{$R *.dfm}

uses Rotina;

procedure TFrmRelQtdPedidoVenda.btn_ImprimirClick(Sender: TObject);
var isAnd: Boolean;
begin
  isAnd := False;
  Q.Sql.Clear;
  Q.SQL.Add('SELECT COUNT(*) AS QTD, PEV_CLIENTE, PES_RAZAOSOCIAL FROM PEDIDOVENDA');
  Q.SQL.Add('INNER JOIN PESSOA ON (PESSOA.PES_CODIGO = PEV_CLIENTE)');

  // Data de nascimento
  if ENascimentoDe.Text <> '  /  /    ' then begin
     if isAnd = False then begin
        isAnd := True;
        Q.SQL.Add('Where');
     end;

     Q.SQL.Add('Cast(PEV_DATA as date) >= ' + (GetSqlDate(StrToDate(ENascimentoDe.Text))));
  end;

  if ENascimentoAte.Text <> '  /  /    ' then begin
     if isAnd = False then begin
        Q.SQL.Add('Where');
     end else begin
        Q.SQL.Add('And');
     end;

     Q.SQL.Add('Cast(PEV_DATA as date) <= ' + (GetSqlDate(StrToDate(ENascimentoAte.Text))));
  end;

  Q.SQL.Add('GROUP BY PEV_CLIENTE,PES_RAZAOSOCIAL');

  inherited;

end;

procedure TFrmRelQtdPedidoVenda.ENascimentoAteExit(Sender: TObject);
begin
   AjustaData(ENascimentoAte);
end;

procedure TFrmRelQtdPedidoVenda.ENascimentoDeExit(Sender: TObject);
begin
   AjustaData(ENascimentoDe);
end;

end.

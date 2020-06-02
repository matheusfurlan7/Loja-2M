unit UntRelPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntRelPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportRTF, frxExportImage, frxExportHTML, frxExportCSV, frxExportText,
  frxExportPDF, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  View;

type
  TFrmRelPais = class(TFrmRelPadrao)
    GCod: TGroupBox;
    De: TLabel;
    Até: TLabel;
    ECodDe: TEdit;
    ECodAte: TEdit;
    GDescricao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ENomeDe: TEdit;
    ENomeAte: TEdit;
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPais: TFrmRelPais;

implementation

{$R *.dfm}

uses Rotina, UntView;

procedure TFrmRelPais.btn_ImprimirClick(Sender: TObject);
var isAnd: Boolean;

   procedure AddWhere(cSql: String);
   begin
     if isAnd = False then begin
        cSQl := 'where ' + cSql;
     end else begin
        cSql := ' and ' + cSql;
     end;

     isAnd := True;

     Q.SQL.Add(cSql);

   end;
begin
  isAnd := False;

  Q.SQL.Clear;
  Q.Sql.Add('SELECT PAI_CODIGO, PAI_NOME FROM PAIS');

  // Código
  if Trim(ECodDe.Text) <> '' then begin
     AddWhere('PAI_CODIGO >= ' + ECodDe.Text);
  end;

  if Trim(ECodAte.Text) <> '' then begin
     AddWhere('PAI_CODIGO <= ' + ECodAte.Text);
  end;

  // Descricao
  if Trim(ENomeDe.Text) <> '' then begin
     AddWhere('PAI_NOME >= ' + QuotedStr(ENomeDe.Text));
  end;

  if Trim(ENomeAte.Text) <> '' then begin
     AddWhere('PAI_NOME <= ' + QuotedStr(ENomeAte.Text));
  end;

  inherited;
end;

end.

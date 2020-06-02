unit UntRelUsuario;

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
  TFrmRelUsuario = class(TFrmRelPadrao)
    GCod: TGroupBox;
    De: TLabel;
    Até: TLabel;
    ECodDe: TEdit;
    ECodAte: TEdit;
    GNome: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ENomeDe: TEdit;
    ENomeAte: TEdit;
    Label6: TLabel;
    ESituacao: TComboBox;
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelUsuario: TFrmRelUsuario;

implementation

{$R *.dfm}

uses Rotina, UntView;

procedure TFrmRelUsuario.btn_ImprimirClick(Sender: TObject);
var isAnd: Boolean;

   procedure AddWhere(cSql: String);
   begin
     if isAnd then begin
        cSql := ' and ' + cSql;
     end else begin
        cSql := 'Where ' + cSql;
     end;

     isAnd := True;

     Q.SQL.Add(cSql);

   end;
begin
  Q.SQL.Clear;
  Q.Sql.Add('SELECT USU_CODIGO,IIF(USU_STATUS=''S'',''Ativo'',''Inativo'') as USU_STATUS ,USU_INCLUSAO, USU_NOME, USU_DEPARTAMENTO, USU_PERFIL, PER_DESCRICAO FROM USUARIO');
  Q.Sql.Add('INNER JOIN PERFIL ON USU_PERFIL = PER_CODIGO');

  isAnd := False;

  // Código
  if Trim(ECodDe.Text) <> '' then begin
     AddWhere('USU_CODIGO >= ' + ECodDe.Text);
  end;

  if Trim(ECodAte.Text) <> '' then begin
     AddWhere('USU_CODIGO <= ' + ECodAte.Text);
  end;

  // Nome
  if Trim(ENomeDe.Text) <> '' then begin
     AddWhere('USU_NOME >= ' + QuotedStr(ENomeDe.Text));
  end;

  if Trim(ENomeAte.Text) <> '' then begin
     AddWhere('USU_NOME <= ' + QuotedStr(ENomeAte.Text));
  end;

  // Situacao
  if ESituacao.Text = 'Ativo' then begin
     AddWhere('USU_STATUS = ' + QuotedStr('S'));
  end else if ESituacao.Text = 'Inativo' then begin
     AddWhere('USU_STATUS = ' + QuotedStr('N'));
  end;

  inherited;
end;

end.

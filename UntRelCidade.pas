unit UntRelCidade;

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
  TFrmRelCidade = class(TFrmRelPadrao)
    GPais: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    CPaisDe: TView;
    CPaisAte: TView;
    EPaisDe: TEdit;
    EPaisAte: TEdit;
    GEstado: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    EEstadoDe: TMaskEdit;
    EEstadoAte: TMaskEdit;
    CEstadoDe: TView;
    CEstadoAte: TView;
    procedure CPaisDeActive(Sender: TObject);
    procedure CPaisAteActive(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure CEstadoDeActive(Sender: TObject);
    procedure CEstadoAteActive(Sender: TObject);
    procedure EPaisAteExit(Sender: TObject);
    procedure EPaisDeExit(Sender: TObject);
    procedure EEstadoAteExit(Sender: TObject);
    procedure EEstadoDeExit(Sender: TObject);
    procedure EPaisDeEnter(Sender: TObject);
    procedure EPaisAteEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCidade: TFrmRelCidade;

implementation

{$R *.dfm}

uses Rotina, UntView;

var PaisDe: String;
    PaisAte: String;

procedure TFrmRelCidade.btn_ImprimirClick(Sender: TObject);
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
  Q.Sql.Add('SELECT CID_PAIS,PAI_NOME, CID_ESTADO,CID_CIDADE FROM CIDADE');
  Q.Sql.Add('INNER JOIN PAIS ON CID_PAIS = PAI_CODIGO');

  // País
  if Trim(EPaisDe.Text) <> '' then begin
     AddWhere('CID_PAIS >= ' + EPaisDe.Text);
  end;

  if Trim(EPaisAte.Text) <> '' then begin
     AddWhere('CID_PAIS <= ' + EPaisAte.Text);
  end;

  // Estado
  if Trim(EEstadoDe.Text) <> '' then begin
     AddWhere('CID_ESTADO >= ' + QuotedStr(EEstadoDe.Text));
  end;

  if Trim(EEstadoAte.Text) <> '' then begin
     AddWhere('CID_ESTADO <= ' + QuotedStr(EEstadoAte.Text));
  end;

  inherited;
end;

procedure TFrmRelCidade.CEstadoAteActive(Sender: TObject);
begin
  if (Trim(EPaisAte.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisAte.SetFocus;
     Abort;
  end;
  VEstado(CEstadoAte,StrToInt(EPaisAte.Text));
end;

procedure TFrmRelCidade.CEstadoDeActive(Sender: TObject);
begin
  if (Trim(EPaisDe.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisDe.SetFocus;
     Abort;
  end;
  VEstado(CEstadoDe,StrToInt(EPaisDe.Text));
end;

procedure TFrmRelCidade.CPaisAteActive(Sender: TObject);
begin
  VPais(CPaisAte);
end;

procedure TFrmRelCidade.CPaisDeActive(Sender: TObject);
begin
  VPais(CPaisDe);
end;

procedure TFrmRelCidade.EEstadoAteExit(Sender: TObject);
begin
   CEstadoAte.Valid;
end;

procedure TFrmRelCidade.EEstadoDeExit(Sender: TObject);
begin
   CEstadoDe.Valid;
end;

procedure TFrmRelCidade.EPaisAteEnter(Sender: TObject);
begin
   PaisAte := Trim(EPaisAte.TexT);
end;

procedure TFrmRelCidade.EPaisAteExit(Sender: TObject);
begin
  CPaisAte.Valid;
  if (Trim(EPaisAte.TexT) = '') or (PaisAte <> Trim(EPaisAte.TexT)) then begin
     EEstadoAte.Clear;
     CEstadoAte.Valid;
  end;
end;

procedure TFrmRelCidade.EPaisDeEnter(Sender: TObject);
begin
  PaisDe := Trim(EPaisDe.Text);
end;

procedure TFrmRelCidade.EPaisDeExit(Sender: TObject);
begin
  CPaisDe.Valid;
  if (Trim(EPaisDe.TexT) = '') or (PaisDe <> Trim(EPaisDe.TexT)) then begin
     EEstadoDe.Clear;
     CEstadoDe.Valid;
  end;
end;

end.

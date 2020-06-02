unit UntRelEstado;

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
  TFrmRelEstado = class(TFrmRelPadrao)
    GPais: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    CPaisDe: TView;
    CPaisAte: TView;
    EPaisDe: TEdit;
    EPaisAte: TEdit;
    procedure CPaisDeActive(Sender: TObject);
    procedure CPaisAteActive(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure EPaisDeExit(Sender: TObject);
    procedure EPaisAteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEstado: TFrmRelEstado;

implementation

{$R *.dfm}

uses Rotina, UntView;

procedure TFrmRelEstado.btn_ImprimirClick(Sender: TObject);
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
  Q.Sql.Add('SELECT EST_PAIS,PAI_NOME, EST_ESTADO,EST_CIDADE FROM ESTADO');
  Q.Sql.Add('INNER JOIN PAIS ON EST_PAIS = PAI_CODIGO');

  // País
  if Trim(EPaisDe.Text) <> '' then begin
     AddWhere('EST_PAIS >= ' + EPaisDe.Text);
  end;

  if Trim(EPaisAte.Text) <> '' then begin
     AddWhere('EST_PAIS <= ' + EPaisAte.Text);
  end;

  inherited;
end;

procedure TFrmRelEstado.CPaisAteActive(Sender: TObject);
begin
  VPais(CPaisAte);
end;

procedure TFrmRelEstado.CPaisDeActive(Sender: TObject);
begin
  VPais(CPaisDe);
end;

procedure TFrmRelEstado.EPaisAteExit(Sender: TObject);
begin
   CPaisAte.Valid;
end;

procedure TFrmRelEstado.EPaisDeExit(Sender: TObject);
begin
   CPaisDe.Valid;
end;

end.

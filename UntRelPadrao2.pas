unit UntRelPadrao2;

interface

uses
  Vcl.Controls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportRTF, frxExportImage,
  frxExportHTML, frxExportCSV, frxExportText, frxExportPDF, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.StdCtrls, System.Classes, Vcl.ExtCtrls, Vcl.Forms;

type TCH = Class(TControl)
  public
  property Color;
  property Enabled;
end;

type
  TFrmRelPadrao2 = class(TForm)
    PTopo: TPanel;
    LCad: TLabel;
    PF1: TPanel;
    ToolBar1: TToolBar;
    btn_Imprimir: TToolButton;
    btn_Sair: TToolButton;
    PDF: TfrxPDFExport;
    SimpleText: TfrxSimpleTextExport;
    TIFFE: TfrxTIFFExport;
    JPEG: TfrxJPEGExport;
    CSV: TfrxCSVExport;
    HTML: TfrxHTMLExport;
    BMPE: TfrxBMPExport;
    RTF: TfrxRTFExport;
    Relatorio: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPadrao2: TFrmRelPadrao2;

implementation

uses
  Vcl.Graphics;

{$R *.dfm}

procedure TFrmRelPadrao2.btn_ImprimirClick(Sender: TObject);
begin
   Relatorio.ShowReport;
end;

procedure TFrmRelPadrao2.btn_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmRelPadrao2.FormShow(Sender: TObject);
  procedure CarregaCor(aWC: Array of  TControl);
  var I: Integer;
  begin
     for I := 0 to High(aWC) do begin
        if not (aWC[i].ClassName = 'TCheckBox') then TCH(aWC[I]).Color := StringToColor('clBtnFace');
        TCH(aWC[I]).Font.Color := StringToColor('clBlack');
     end;
  end;
begin
   CarregaCor([PTopo,LCad]);
end;

end.

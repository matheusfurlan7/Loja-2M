unit UntConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, Vcl.ExtCtrls, Dados;

type
  TFrmConsultaPadrao = class(TForm)
    PTopo: TPanel;
    LCad: TLabel;
    ToolBar1: TToolBar;
    btn_consultar: TToolButton;
    btn_Estornar: TToolButton;
    Separador4: TToolButton;
    btn_Imprimir: TToolButton;
    Separador5: TToolButton;
    btn_Sair: TToolButton;
    Grid: TDBGrid;
    PTop: TPanel;
    Label1: TLabel;
    EPesquisa: TEdit;
    PColuna: TPanel;
    Separador1: TRichEdit;
    DS: TDataSource;
    PM: TPopupMenu;
    Query: TFDQuery;
    procedure btn_EstornarClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure ClickColuna(Sender: TObject);
    procedure EPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Botoes(isFocus: Boolean = True);
  end;

var
  FrmConsultaPadrao: TFrmConsultaPadrao;
  ModoEdicao: String;
  CColuna: String;

implementation

{$R *.dfm}

uses UntPrincipal,Rotina;

procedure TFrmConsultaPadrao.btn_EstornarClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmConsultaPadrao.btn_consultarClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmConsultaPadrao.btn_ImprimirClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmConsultaPadrao.btn_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmConsultaPadrao.EPesquisaChange(Sender: TObject);
Var cAux: String;
begin
   cAux := Trim(EPesquisa.Text);
   try
      if cAux <> '' then
         Query.Locate(CColuna,EPesquisa.Text,[loCaseInsensitive,loPartialKey]);
   except on E: Exception do
      Abort;
   end;
end;

procedure TFrmConsultaPadrao.ClickColuna(Sender: TObject);
begin
  GridTitleClick(Grid.Columns[TMenuItem(Sender).Tag]);
end;

procedure TFrmConsultaPadrao.FormCreate(Sender: TObject);
begin
   KeyPreview := True;
   ModoEdicao := '';
   CColuna := '';
end;

procedure TFrmConsultaPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Query.State = dsBrowse) then begin
      if (Key = #27) then begin
         Close;
      end;
   end;

   if (Key = #13) then begin
       Key := #0;
       Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFrmConsultaPadrao.FormShow(Sender: TObject);
var isCon: Boolean;
    isEst: Boolean;
    X: Integer;
    MM: TMenuItem;
begin
  if ModoEdicao = '' then begin
     ModoEdicao := 'SS';
  end;

  isCon := (Copy(ModoEdicao,1,1) = 'S');
  isEst := (Copy(ModoEdicao,2,1) = 'S');

  btn_Consultar.Visible := isCon;
  btn_Estornar.Visible := isEst;
  Separador4.Visible := isCon or isEst;

  CarregaCor([PTopo,LCad,PTop]);

  PM.Items.Clear;
  for X := 0 to Grid.Columns.Count - 1 do begin
     MM := TMenuItem.Create(Self);
     MM.Caption := Grid.Columns[X].Title.Caption;
     MM.Tag := X;
     MM.OnClick := ClickColuna;
     PM.Items.Add(MM);
  end;

  GridTitleClick(Grid.Columns[0]);
  CorTitulo(Grid);
  Botoes;
end;

procedure TFrmConsultaPadrao.GridTitleClick(Column: TColumn);
begin
   PColuna.Caption := Column.Title.Caption;
   CColuna := Column.FieldName;
   EPesquisa.Clear;
   EPesquisa.SetFocus;
end;

procedure TFrmConsultaPadrao.Botoes(isFocus: Boolean = True);
begin
   if Query.Active then
      Query.Refresh;

   btn_Consultar.Enabled := DS.Enabled and (Query.RecordCount > 0);
   btn_Estornar.Enabled := DS.Enabled and (Query.RecordCount > 0);
   btn_Imprimir.Enabled := DS.Enabled and (Query.RecordCount > 0);

   if isFocus then
      if Grid.CanFocus then Grid.SetFocus;
end;

end.

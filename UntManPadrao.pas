unit UntManPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Dados;

type
  TExecutar = (direitosBotoes);
  TFrmManPadrao = class(TForm)
    PTopo: TPanel;
    LCad: TLabel;
    ToolBar1: TToolBar;
    btn_Inserir: TToolButton;
    btn_Alterar: TToolButton;
    btn_Excluir: TToolButton;
    Separador3: TToolButton;
    btn_Baixar: TToolButton;
    Separador4: TToolButton;
    btn_Imprimir: TToolButton;
    Separador5: TToolButton;
    btn_Sair: TToolButton;
    DS: TDataSource;
    FDT: TFDTable;
    Grid: TDBGrid;
    PTop: TPanel;
    Label1: TLabel;
    EPesquisa: TEdit;
    PColuna: TPanel;
    Separador1: TRichEdit;
    PM: TPopupMenu;
    btn_consultar: TToolButton;
    procedure btn_SairClick(Sender: TObject);
    procedure EPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_BaixarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
    procedure ClickColuna(Sender: TObject);
    procedure Botoes;
  public
    { Public declarations }
    property Executar: TExecutar read FExecutar write SetExecutar;
  end;

var
  FrmManPadrao: TFrmManPadrao;
  ModoEdicao: String;
  CColuna: String;

implementation

{$R *.dfm}

uses UntPrincipal,Rotina;

procedure TFrmManPadrao.btn_AlterarClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_BaixarClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_consultarClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_ExcluirClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_ImprimirClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_InserirClick(Sender: TObject);
begin
   Botoes;
end;

procedure TFrmManPadrao.btn_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmManPadrao.EPesquisaChange(Sender: TObject);
Var cAux: String;
begin
   cAux := Trim(EPesquisa.Text);
   try
      if cAux <> '' then
         FDT.Locate(CColuna,EPesquisa.Text,[loCaseInsensitive,loPartialKey]);
   except on E: Exception do
      Abort;
   end;
end;

procedure TFrmManPadrao.ClickColuna(Sender: TObject);
begin
  GridTitleClick(Grid.Columns[TMenuItem(Sender).Tag]);
end;

procedure TFrmManPadrao.FormCreate(Sender: TObject);
begin
   KeyPreview := True;
   ModoEdicao := '';
   CColuna := '';
end;

procedure TFrmManPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (FDT.State = dsBrowse) then begin
      if (Key = #27) then begin
         Close;
      end;
   end;

   if (Key = #13) then begin
       Key := #0;
       Perform(WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TFrmManPadrao.FormShow(Sender: TObject);
var X: Integer;
    MM: TMenuItem;
begin
  if ModoEdicao = '' then begin
     ModoEdicao := 'SSSS';
  end;

  CarregaCor([PTopo,LCad,PTop]);
  PM.Items.Clear;
  for X := 0 to Grid.Columns.Count - 1 do begin
     MM := TMenuItem.Create(Self);
     MM.Caption := Grid.Columns[X].Title.Caption;
     MM.Tag := X;
     MM.OnClick := ClickColuna;
     PM.Items.Add(MM);
  end;

  Executar := direitosBotoes;
  GridTitleClick(Grid.Columns[0]);
  CorTitulo(Grid);
  Botoes;
end;

procedure TFrmManPadrao.GridTitleClick(Column: TColumn);
begin
   PColuna.Caption := Column.Title.Caption;
   CColuna := Column.FieldName;
   EPesquisa.Clear;
   EPesquisa.SetFocus;
end;

procedure TFrmManPadrao.SetExecutar(const Value: TExecutar);
var isInc: Boolean;
    isAlt: Boolean;
    isCon: Boolean;
    isExc: Boolean;
    isBai: Boolean;
begin
  FExecutar:= Value;
  case value of
    direitosBotoes:
    begin
       isInc := (Copy(ModoEdicao,1,1) = 'S');
       isAlt := (Copy(ModoEdicao,2,1) = 'S');
       isCon := (Copy(ModoEdicao,3,1) = 'S');
       isExc := (Copy(ModoEdicao,4,1) = 'S');
       isBai := (Copy(ModoEdicao,5,1) = 'S');

       btn_Inserir.Visible := isInc;
       btn_Alterar.Visible := isAlt;
       btn_Consultar.Visible := isCon;
       btn_Excluir.Visible := isExc;
       Separador3.Visible := isInc or isAlt or isCon or isExc;
       btn_Baixar.Visible := isBai;
       Separador4.Visible := isBai;
    end;
  end;
end;

procedure TFrmManPadrao.Botoes;
begin
   FDT.Refresh;

   btn_Inserir.Enabled := DS.Enabled;
   btn_Alterar.Enabled := DS.Enabled and (FDT.RecordCount > 0);
   btn_Consultar.Enabled := DS.Enabled and (FDT.RecordCount > 0);
   btn_Excluir.Enabled := DS.Enabled and (FDT.RecordCount > 0);
   btn_Baixar.Enabled := DS.Enabled and (FDT.RecordCount > 0);
   btn_Imprimir.Enabled := DS.Enabled and (FDT.RecordCount > 0);

   if Grid.CanFocus then Grid.SetFocus;
end;

end.

unit UntCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Dados,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TExecutar = (navegacao, desabilitaBotoes, habilitaBotoes, direitosBotoes, BotoesConsulta, BotoesManutencao);
  TFrmCadPadrao = class(TForm)
    PTopo: TPanel;
    LCad: TLabel;
    Pages: TPageControl;
    P1: TTabSheet;
    PF1: TPanel;
    DS: TDataSource;
    FDT: TFDTable;
    ToolBar1: TToolBar;
    btn_Primeiro: TToolButton;
    btn_Anterior: TToolButton;
    btn_Proximo: TToolButton;
    btn_Ultimo: TToolButton;
    Separador2: TToolButton;
    btn_Inserir: TToolButton;
    btn_Alterar: TToolButton;
    btn_Excluir: TToolButton;
    Separador3: TToolButton;
    btn_Salvar: TToolButton;
    btn_Cancelar: TToolButton;
    Separador4: TToolButton;
    btn_Imprimir: TToolButton;
    Separador5: TToolButton;
    btn_Sair: TToolButton;
    P2: TTabSheet;
    Grid: TDBGrid;
    PM: TPopupMenu;
    PTop: TPanel;
    LPesquisa: TLabel;
    EPesquisa: TEdit;
    PColuna: TPanel;
    Separador1: TRichEdit;
    procedure btn_PrimeiroClick(Sender: TObject);
    procedure btn_AnteriorClick(Sender: TObject);
    procedure btn_ProximoClick(Sender: TObject);
    procedure btn_UltimoClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure EPesquisaChange(Sender: TObject);
    procedure PagesChange(Sender: TObject);
    procedure PagesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure GridMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
    procedure ClickColuna(Sender: TObject);
    procedure CentralizaTela(var nTop, nLeft: Integer; nWidth, nHeight: Integer);
  public
    { Public declarations }
    property Executar: TExecutar read FExecutar write SetExecutar;
    procedure ClearGrid;
    procedure AddGrid(F: TField; cDisplayLabel: String; nFieldWidth: Integer = 0);
    procedure FinalizaGrid;
  end;

var
  FrmCadPadrao: TFrmCadPadrao;
  ModoEdicao: String;

implementation

{$R *.dfm}

uses UntPrincipal, Rotina;

var
  // Pesquisa
  CColuna: String;

  // Pintar Grid
  IsZebra: Boolean;

  // P1 - Dados
  nTop: Integer;
  nLeft: Integer;
  nWidth: Integer;
  nHeight: Integer;

  // P2 - Consulta
  nTopConsulta: Integer;
  nLeftConsulta: Integer;
  nWidthConsulta: Integer;
  nHeightConsulta: Integer;

procedure TFrmCadPadrao.btn_AlterarClick(Sender: TObject);
begin
   FDT.Edit;
   Executar:= desabilitaBotoes;
end;

procedure TFrmCadPadrao.btn_AnteriorClick(Sender: TObject);
begin
   FDT.Prior;
   Executar:= navegacao;
end;

procedure TFrmCadPadrao.btn_CancelarClick(Sender: TObject);
var cMsg: String;
begin
   if FDT.State = dsInsert then   cMsg := 'A inclusão do registro foi abortada.';
   if FDT.State = dsEdit then   cMsg := 'A alteração do registro foi abortada.';
   FDT.Cancel;
   Application.MessageBox(PChar(cMsg),'Atenção',MB_OK+MB_ICONERROR);
   Executar:= habilitaBotoes;
end;

procedure TFrmCadPadrao.btn_ExcluirClick(Sender: TObject);
var cMsg: String;
    nRes: Integer;
begin
   cMsg := 'Confirma a exclusão desse registro?';
   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

   if nRes = IDYES then begin
      FDT.Delete;

      cMsg := 'O registro foi excluido com sucesso.';
      Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
   end else begin
      cMsg := 'A exclusão do registro foi abortada.';
      Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
   end;

   Executar := habilitaBotoes;
end;

procedure TFrmCadPadrao.btn_InserirClick(Sender: TObject);
begin
   FDT.Insert;
   Executar := desabilitaBotoes;
end;

procedure TFrmCadPadrao.btn_PrimeiroClick(Sender: TObject);
begin
   FDT.First;
   Executar:= navegacao;
end;

procedure TFrmCadPadrao.btn_ProximoClick(Sender: TObject);
begin
   FDT.Next;
   Executar:= navegacao;
end;

procedure TFrmCadPadrao.btn_SairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmCadPadrao.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
   if FDT.State = dsInsert then begin
      D.Transaction;
      FDT.Post;
      D.Commit;
      FDT.Refresh;
      FDT.Last;
      cMsg := 'O registro foi incluido com sucesso.';
      Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
   end else if FDT.State = dsEdit then begin
      D.Transaction;
      FDT.Post;
      D.Commit;
      cMsg := 'O registro foi alterado com sucesso.';
      Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
   end;
   Executar:= habilitaBotoes;
end;

procedure TFrmCadPadrao.btn_UltimoClick(Sender: TObject);
begin
   FDT.Last;
   Executar:= navegacao;
end;

procedure TFrmCadPadrao.EPesquisaChange(Sender: TObject);
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

procedure TFrmCadPadrao.FormCreate(Sender: TObject);
begin
   ModoEdicao := '';
   Pages.ActivePage := P1;

   nWidth := Width;
   nHeight := Height;
   nWidthConsulta := 0;

   IsZebra := False;
end;

procedure TFrmCadPadrao.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadPadrao.FormShow(Sender: TObject);
begin
  nWidthConsulta := 0;

  if ModoEdicao = '' then begin
     ModoEdicao := 'SSS';
  end;

  CarregaCor([PTopo,LCad]);

  Executar := direitosBotoes;
  Executar := BotoesManutencao;

  if FDT.State in [dsInsert,dsEdit] then begin
     Executar := desabilitaBotoes;
  end else begin
     Executar := habilitaBotoes;
     Executar := navegacao;
  end;

  CorTitulo(Grid);
end;

procedure TFrmCadPadrao.ClickColuna(Sender: TObject);
begin
  GridTitleClick(Grid.Columns[TMenuItem(Sender).Tag]);
end;

procedure TFrmCadPadrao.DSDataChange(Sender: TObject; Field: TField);
begin
    if not (FDT.State in [dsInsert,dsEdit]) then begin
       Executar := navegacao;
    end;
end;

procedure TFrmCadPadrao.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    ZebraGrid(Grid,Rect,DataCol,Column,State,IsZebra);
end;

procedure TFrmCadPadrao.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    { Seta pra Baixo } { a Seta pra Cima }
  if (key = VK_DOWN) or (key = VK_UP) then begin
     Grid.Repaint;
  end;
end;

procedure TFrmCadPadrao.GridMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
   Grid.Repaint;
end;

procedure TFrmCadPadrao.GridMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
   Grid.Repaint;
end;

procedure TFrmCadPadrao.GridTitleClick(Column: TColumn);
begin
   PColuna.Caption := Column.Title.Caption;
   CColuna := Column.FieldName;
   EPesquisa.Clear;
   EPesquisa.SetFocus;
end;

procedure TFrmCadPadrao.PagesChange(Sender: TObject);
var nPesquisa: Integer;
begin
   if (FDT.State in [dsInsert,dsEdit]) then begin
      Exit;
   end;

   if Pages.ActivePage = P1 then begin
      CentralizaTela(nTop,nLeft,nWidth,nHeight);

      Top := nTop;
      Left := nLeft;
      Width := nWidth;
      Height := nHeight;

      Executar := BotoesManutencao;

      EPesquisa.Width := 372;
   end else if Pages.ActivePage = P2 then begin
      CentralizaTela(nTopConsulta,nLeftConsulta,nWidthConsulta,nHeightConsulta);

      Top := nTopConsulta;
      Left := nLeftConsulta;
      Width :=  nWidthConsulta;
      Height := nHeightConsulta;

      Executar := BotoesConsulta;

      nPesquisa := (PTop.Width - EPesquisa.Left - 5);

      if (nPesquisa < 372) then begin
         EPesquisa.Width := nPesquisa
      end;

      Grid.Repaint;
   end;
end;

procedure TFrmCadPadrao.PagesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if FDT.State in [dsInsert,dsEdit] then begin
      AllowChange := False;
   end;
end;

procedure TFrmCadPadrao.SetExecutar(const Value: TExecutar);
var isInc: Boolean;
    isAlt: Boolean;
    isExc: Boolean;
begin
  FExecutar:= Value;
  case value of
    navegacao:
    begin
      btn_Proximo.Enabled := (FDT.RecNo <> FDT.RecordCount);
      btn_Ultimo.Enabled := (FDT.RecNo <> FDT.RecordCount);

      btn_Anterior.Enabled:= (FDT.RecNo <> 1);
      btn_Primeiro.Enabled:= (FDT.RecNo <> 1);
    end;

    desabilitaBotoes:
    begin
      PF1.Enabled := True;
      btn_Primeiro.Enabled := False;
      btn_Anterior.Enabled := False;
      btn_Proximo.Enabled := False;
      btn_Ultimo.Enabled := False;
      btn_Inserir.Enabled := False;
      btn_Alterar.Enabled := False;
      btn_Excluir.Enabled := False;
      btn_Salvar.Enabled := True;
      btn_Cancelar.Enabled := True;
      btn_Imprimir.Enabled := False;
      btn_Sair.Enabled := False;
    end;

    habilitaBotoes:
    begin
      PF1.Enabled := False;
      btn_Inserir.Enabled := True;
      btn_Alterar.Enabled := (FDT.RecordCount > 0);
      btn_Excluir.Enabled := (FDT.RecordCount > 0);
      btn_Salvar.Enabled:= False;
      btn_Cancelar.Enabled:= False;
      btn_Imprimir.Enabled := (FDT.RecordCount > 0);
      btn_Sair.Enabled:= True;
    end;

    direitosBotoes:
    begin
       isInc := (Copy(ModoEdicao,1,1) = 'S');
       isAlt := (Copy(ModoEdicao,2,1) = 'S');
       isExc := (Copy(ModoEdicao,3,1) = 'S');

       btn_Inserir.Visible := isInc;
       btn_Alterar.Visible := isAlt;
       btn_Excluir.Visible := isExc;
       Separador3.Visible := isInc or isAlt or isExc;
       btn_Salvar.Visible := isInc or isAlt;
       btn_Cancelar.Visible := isInc or isAlt;
       Separador4.Visible := isInc or isAlt;
       btn_Imprimir.Visible := True;
       btn_Sair.Visible := True;
    end;

    BotoesConsulta:
    begin
       btn_Inserir.Enabled := False;
       btn_Alterar.Enabled := False;
       btn_Excluir.Enabled := False;
       btn_Salvar.Enabled := False;
       btn_Cancelar.Enabled := False;
       btn_Imprimir.Enabled := True;
       btn_Sair.Enabled := True;
    end;

    BotoesManutencao:
    begin
       Executar := habilitaBotoes;
    end;
  end;
end;

procedure TFrmCadPadrao.AddGrid(F: TField; cDisplayLabel: String; nFieldWidth: Integer = 0);
begin
   with Grid.Columns.Add do begin
      FieldName    := F.FieldName;
      Title.Caption := cDisplayLabel;
      if F.DataType in [ftInteger,ftFloat,ftCurrency,ftBCD,ftAutoInc] then begin
         Alignment := taRightJustify;
         Title.Alignment := taRightJustify;
      end;

      if nFieldWidth > 0 then begin
         Width := nFieldWidth + 15;
      end else begin
         if Canvas.TextWidth(Title.Caption) < Canvas.TextWidth(F.AsString) then begin
            if Width < Canvas.TextWidth(F.AsString) then begin
               Width := Canvas.TextWidth(F.AsString) + 15;
            end;
         end else begin
            if Width < Canvas.TextWidth(Title.Caption) then begin
               Width := Canvas.TextWidth(Title.Caption);
            end;
         end;
      end;

      nWidthConsulta := nWidthConsulta + Width;
   end;
end;

procedure TFrmCadPadrao.ClearGrid;
begin
  Grid.Columns.Clear;
  nWidthConsulta := 0;
end;

procedure TFrmCadPadrao.FinalizaGrid;
var X: Integer;
    MM: TMenuItem;
begin
   nWidthConsulta := nWidthConsulta + 70;
   if nWidthConsulta > (Screen.Width - 100) then begin
      nWidthConsulta := (Screen.Width - 100);
   end;

   if nWidthConsulta < 600 then begin
      nWidthConsulta := 600;
   end;

   nHeightConsulta := Screen.Height - 400;

   PM.Items.Clear;
   for X := 0 to Grid.Columns.Count - 1 do begin
      MM := TMenuItem.Create(Self);
      MM.Caption := Grid.Columns[X].Title.Caption;
      MM.Tag := X;
      MM.OnClick := ClickColuna;
      PM.Items.Add(MM);
   end;

   // Pesquisa da aba consulta
   PColuna.Caption := Grid.Columns[0].Title.Caption;
   CColuna := Grid.Columns[0].FieldName;
end;

procedure TFrmCadPadrao.CentralizaTela(var nTop, nLeft: Integer; nWidth, nHeight: Integer);
begin
    nTop :=  Trunc((Screen.Height - nHeight) / 2);
    nLeft := Trunc((Screen.Width - nWidth) / 2);
end;

end.

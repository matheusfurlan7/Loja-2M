unit UntCadPadrao3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao2, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Dados;

type
  TExecutar = (BotoesItem, ModoConsulta);
  TFrmCadPadrao3 = class(TFrmCadPadrao2)
    FDT2: TFDTable;
    DS2: TDataSource;
    Grid: TDBGrid;
    ToolBar2: TToolBar;
    btn_Inserir: TToolButton;
    btn_Alterar: TToolButton;
    btn_Excluir: TToolButton;
    btn_Consultar: TToolButton;
    btn_Imprimir: TToolButton;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Public declarations }
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
    procedure ClickSair(Sender: TObject);
  public
    { Public declarations }
    property Executar: TExecutar read FExecutar write SetExecutar;
  end;

var
  FrmCadPadrao3: TFrmCadPadrao3;

implementation

{$R *.dfm}

uses Rotina;

procedure TFrmCadPadrao3.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Executar := BotoesItem;
end;

procedure TFrmCadPadrao3.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  Executar := BotoesItem;
end;

procedure TFrmCadPadrao3.btn_ImprimirClick(Sender: TObject);
var cMsg: String;
begin
  if FDT.State = dsInsert then begin
     cMsg := 'Impressão indisponivel em modo de inclusão.';
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     Abort;
  end;
end;

procedure TFrmCadPadrao3.btn_InserirClick(Sender: TObject);
begin
  inherited;
  Executar := BotoesItem;
end;

procedure TFrmCadPadrao3.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
  if FDT.State = dsInsert then begin
     D.Transaction;
     FDT.Post;
     D.Commit;
     FDT.Edit;
     cMsg := 'O registro foi incluido com sucesso.';
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     Executar := BotoesItem;
  end else if FDT.State = dsEdit then begin
     D.Transaction;
     FDT.Post;
     D.Commit;
     cMsg := 'O registro foi alterado com sucesso.';
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     ModalResult := MrOk;
  end;
end;

procedure TFrmCadPadrao3.FormShow(Sender: TObject);
begin
  inherited;
  if FDT.State in [dsInsert,dsEdit] then Executar := BotoesItem
  else Executar := ModoConsulta;
  CorTitulo(Grid);
end;

procedure TFrmCadPadrao3.SetExecutar(const Value: TExecutar);
begin
   FExecutar := Value;
   case FExecutar of
      BotoesItem:
      begin
         btn_Inserir.Enabled := (FDT.State = dsEdit);
         btn_Alterar.Enabled := (FDT.State = dsEdit) and (FDT2.RecordCount > 0);
         btn_Excluir.Enabled := (FDT.State = dsEdit) and (FDT2.RecordCount > 0);
         btn_Consultar.Enabled := (FDT2.RecordCount > 0);
      end;

      ModoConsulta:
      begin
         PF1.Enabled := False;
         btn_Salvar.Visible := False;
         btn_Inserir.Visible := False;
         btn_Alterar.Visible := False;
         btn_Excluir.Visible := False;

         btn_Cancelar.Caption := 'Sair';
         btn_Cancelar.Hint := 'Sair do registro';
         btn_Cancelar.ImageIndex := 5;
         btn_Cancelar.OnClick := ClickSair;
      end;
   end;
end;

procedure TFrmCadPadrao3.ClickSair(Sender: TObject);
begin
   Close;
end;

end.

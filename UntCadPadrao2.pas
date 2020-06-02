unit UntCadPadrao2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Dados,
  Vcl.Menus;

type
  TFrmCadPadrao2 = class(TForm)
    PTopo: TPanel;
    LCad: TLabel;
    Pages: TPageControl;
    P1: TTabSheet;
    PF1: TPanel;
    DS: TDataSource;
    FDT: TFDTable;
    ToolBar1: TToolBar;
    btn_Salvar: TToolButton;
    btn_Cancelar: TToolButton;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ClickSair(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPadrao2: TFrmCadPadrao2;

implementation

{$R *.dfm}

uses UntPrincipal, Rotina;

procedure TFrmCadPadrao2.btn_CancelarClick(Sender: TObject);
var cMsg: String;
begin
  if FDT.State = dsInsert then cMsg := 'A inclusão do registro foi abortada.'
  else if FDT.State = dsEdit then cMsg := 'A alteração do registro foi abortada.';

  FDT.Cancel;
  Application.MessageBox(PChar(cMsg),'Atenção',MB_OK+MB_ICONERROR);
  ModalResult := MrCancel;
end;


procedure TFrmCadPadrao2.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
  if FDT.State = dsInsert then cMsg := 'O registro foi incluido com sucesso.'
  else if FDT.State = dsEdit then cMsg := 'O registro foi alterado com sucesso.';

  D.Transaction;
  FDT.Post;
  D.Commit;

  Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
  ModalResult := MrOk;
end;


procedure TFrmCadPadrao2.FormShow(Sender: TObject);
begin
   CarregaCor([PTopo,LCad]);
   if FDT.State = dsBrowse then begin
      PF1.Enabled := False;
      btn_Salvar.Visible := False;

      btn_Cancelar.Caption := 'Sair';
      btn_Cancelar.Hint := 'Sair do registro';
      btn_Cancelar.ImageIndex := 5;
      btn_Cancelar.OnClick := ClickSair;
   end;
end;

procedure TFrmCadPadrao2.ClickSair(Sender: TObject);
begin
   Close;
end;

end.

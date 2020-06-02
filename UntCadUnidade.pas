unit UntCadUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmCadUnidade = class(TFrmCadPadrao)
    FDTUni_Unidade: TStringField;
    FDTUni_Descricao: TStringField;
    Label1: TLabel;
    EUni_Unidade: TDBEdit;
    Label2: TLabel;
    EUni_Descricao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUnidade: TFrmCadUnidade;

implementation

{$R *.dfm}

uses Rotina, UntRelUnidade;

procedure TFrmCadUnidade.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  EUni_Unidade.SetFocus;
end;

procedure TFrmCadUnidade.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelUnidade := TFrmRelUnidade.Create(Self);
   try
      FrmRelUnidade.ShowModal;
   finally
      FreeAndNil(FrmRelUnidade);
   end;
end;

procedure TFrmCadUnidade.btn_InserirClick(Sender: TObject);
begin
  inherited;
  EUni_Unidade.SetFocus;
end;

procedure TFrmCadUnidade.btn_SalvarClick(Sender: TObject);
  procedure VerificaCampo;
  begin
     if (FDTUni_Unidade.AsString = '') then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Unidade"','Aviso',MB_ICONINFORMATION);
        if EUni_Unidade.CanFocus then EUni_Unidade.SetFocus;
        Abort;
     end;

     if (FDTUni_Descricao.AsString = '') then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Descrição"','Aviso',MB_ICONINFORMATION);
        if EUni_Descricao.CanFocus then EUni_Descricao.SetFocus;
        Abort;
     end;

     if FDTUni_Unidade.AsString = FDTUni_Descricao.AsString then begin
        Beep;
        Application.MessageBox('A unidade e a descrição não podem ser iguais!','Informação',MB_OK + MB_ICONINFORMATION);
        EUni_Descricao.SetFocus;
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
end;

procedure TFrmCadUnidade.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Unidade';
  Caption := 'Cadastro de Unidade';
  FDT.Open();
  GetDireitos(ModoEdicao,'UnidadeIncluir;UnidadeAlterar;UnidadeExcluir');
end;

procedure TFrmCadUnidade.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTUni_Unidade,'Código');
  AddGrid(FDTUni_Descricao,'Descrição');
  FinalizaGrid;
end;

end.

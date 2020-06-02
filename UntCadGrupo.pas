unit UntCadGrupo;

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
  TFrmCadGrupo = class(TFrmCadPadrao)
    FDTGru_Descricao: TStringField;
    Label1: TLabel;
    EGru_Codigo: TDBEdit;
    Label2: TLabel;
    EGru_Descricao: TDBEdit;
    FDTGru_Codigo: TFDAutoIncField;
    procedure btn_InserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmCadGrupo: TFrmCadGrupo;

implementation

{$R *.dfm}

uses Rotina, UntRelGrupo;

procedure TFrmCadGrupo.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  EGru_Descricao.SetFocus;
end;

procedure TFrmCadGrupo.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelGrupo := TFrmRelGrupo.Create(Self);
   try
      FrmRelGrupo.ShowModal;
   finally
      FreeAndNil(FrmRelGrupo);
   end;
end;

procedure TFrmCadGrupo.btn_InserirClick(Sender: TObject);
begin
  inherited;
  EGru_Descricao.SetFocus;
end;

procedure TFrmCadGrupo.btn_SalvarClick(Sender: TObject);
  procedure VerificaCampo;
  begin
     if (FDTGru_Descricao.AsString = '') then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Descrição"','Aviso',MB_ICONINFORMATION);
        if EGru_Descricao.CanFocus then EGru_Descricao.SetFocus;
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
end;

procedure TFrmCadGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Grupo';
  Caption := 'Cadastro de Grupo';
  FDT.Open();
  GetDireitos(ModoEdicao,'GrupoIncluir;GrupoAlterar;GrupoExcluir');
end;

procedure TFrmCadGrupo.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTGru_Codigo,'Código');
  AddGrid(FDTGru_Descricao,'Descrição');
  FinalizaGrid;
end;

end.

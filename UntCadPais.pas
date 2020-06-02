unit UntCadPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Dados, Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadPais = class(TFrmCadPadrao)
    FDTPai_Codigo: TFDAutoIncField;
    FDTPai_Nome: TStringField;
    LPai_Codigo: TLabel;
    EPai_Codigo: TDBEdit;
    LPai_Nome: TLabel;
    EPai_Nome: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPais: TFrmCadPais;

implementation

{$R *.dfm}

uses Rotina, UntRelPais;

procedure TFrmCadPais.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  EPai_Nome.SetFocus;
end;

procedure TFrmCadPais.btn_ExcluirClick(Sender: TObject);
var cMsg: String;
begin
  if FDTPai_Nome.asString = '' then begin
     Beep;
     cMsg := 'É preciso informar o campo "Nome"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     EPai_Nome.SetFocus;
     Abort;
  end;

  inherited;
end;

procedure TFrmCadPais.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelPais := TFrmRelPais.Create(Self);
   try
      FrmRelPais.ShowModal;
   finally
      FreeAndNil(FrmRelPais);
   end;
end;

procedure TFrmCadPais.btn_InserirClick(Sender: TObject);
begin
  inherited;
  EPai_Nome.SetFocus;
end;

procedure TFrmCadPais.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Países';
  Caption := 'Cadastro de Países';
  FDT.Open;
  GetDireitos(ModoEdicao,'PaisIncluir;PaisAlterar;PaisExcluir');
end;

procedure TFrmCadPais.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTPai_Codigo,'Código');
  AddGrid(FDTPai_Nome,'Nome');
  FinalizaGrid;
end;

end.

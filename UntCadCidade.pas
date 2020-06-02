unit UntCadCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, View, Dados, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadCidade = class(TFrmCadPadrao)
    FDTCid_Pais: TIntegerField;
    FDTCid_Estado: TStringField;
    FDTCid_Cidade: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    ECid_Pais: TDBEdit;
    ECid_Estado: TDBEdit;
    ECid_Cidade: TDBEdit;
    CCid_Pais: TView;
    CCid_Estado: TView;
    TPais: TFDTable;
    FDTCid_PaisNome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CCid_PaisActive(Sender: TObject);
    procedure CCid_EstadoActive(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCidade: TFrmCadCidade;

implementation

{$R *.dfm}

uses UntView, Rotina, UntRelCidade;

procedure TFrmCadCidade.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  if ECid_PAis.CanFocus then ECid_Pais.SetFocus;
end;

procedure TFrmCadCidade.btn_ImprimirClick(Sender: TObject);
begin
  FrmRelCidade := TFrmRelCidade.Create(Self);
  try
     FrmRelCidade.ShowModal;
  finally
     FreeAndNil(FrmRelCidade);
  end;
end;

procedure TFrmCadCidade.btn_InserirClick(Sender: TObject);
begin
  inherited;
  if ECid_PAis.CanFocus then ECid_Pais.SetFocus;
end;

procedure TFrmCadCidade.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
  if PF1.CanFocus then PF1.SetFocus;
  if FDTCid_Pais.asInteger = 0 then begin
     Beep;
     cMsg := 'É preciso informar o campo "Pais"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     ECid_Pais.SetFocus;
     Abort;
  end;

  if FDTCid_Estado.asString = '' then begin
     Beep;
     cMsg := 'É preciso informar o campo "Estado"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     ECid_Estado.SetFocus;
     Abort;
  end;

  if FDTCid_Cidade.asString = '' then begin
     Beep;
     cMsg := 'É preciso informar o campo "Cidade"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     ECid_Cidade.SetFocus;
     Abort;
  end;

  inherited;
end;

procedure TFrmCadCidade.CCid_EstadoActive(Sender: TObject);
begin
  inherited;
  if FDTCid_Pais.asInteger = 0 then begin
     Beep;
     Application.MessageBox('É preciso informar o país!','Aviso',MB_OK + MB_ICONINFORMATION);
     ECid_Pais.SetFocus;
     Abort;
  end;

  VEstado(CCid_Estado,FDTCid_Pais.AsInteger);
end;

procedure TFrmCadCidade.CCid_PaisActive(Sender: TObject);
begin
  inherited;
  VPais(CCid_Pais);
end;

procedure TFrmCadCidade.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Cidade';
  Caption := 'Cadastro de Cidade';
  FDT.Open();
  GetDireitos(ModoEdicao,'CidadeIncluir;AlterarEsconder;CidadeExcluir');
end;

procedure TFrmCadCidade.FormShow(Sender: TObject);
begin
  inherited;

  // Alimenta grid da aba consulta
  ClearGrid;
  AddGrid(FDTCid_Pais,'País');
  AddGrid(FDTCid_PaisNome,'Nome');
  AddGrid(FDTCid_Estado,'Estado');
  AddGrid(FDTCid_Cidade,'Cidade');
  FinalizaGrid;
end;

end.

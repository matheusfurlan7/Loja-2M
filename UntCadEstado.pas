unit UntCadEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Dados, View, Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadEstado = class(TFrmCadPadrao)
    Label3: TLabel;
    Label1: TLabel;
    EEst_Pais: TDBEdit;
    Label2: TLabel;
    EEst_Estado: TDBEdit;
    Label4: TLabel;
    EEst_Cidade: TDBEdit;
    FDTEst_Pais: TIntegerField;
    FDTEst_Estado: TStringField;
    FDTEst_Cidade: TStringField;
    CEst_Pais: TView;
    TPais: TFDTable;
    FDTEst_PaisNome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure CEst_PaisActive(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEstado: TFrmCadEstado;

implementation

{$R *.dfm}

uses UntView, Rotina, UntRelEstado;

procedure TFrmCadEstado.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  if EEst_Pais.CanFocus then EEst_Pais.SetFocus;
end;

procedure TFrmCadEstado.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelEstado := TFrmRelEstado.Create(Self);
   try
      FrmRelEstado.ShowModal;
   finally
      FreeAndNil(FrmRelEstado);
   end;
end;

procedure TFrmCadEstado.btn_InserirClick(Sender: TObject);
begin
  inherited;
  if EEst_Pais.CanFocus then EEst_Pais.SetFocus;
end;

procedure TFrmCadEstado.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
  PF1.SetFocus;
  if Trim(FDTEst_Estado.AsString) = '' then begin
     Beep;
     cMSg := 'O estado precisa ser informado!';
     EEst_Estado.SetFocus;
    Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     exit;
  end;

  if FDTEst_Pais.asInteger = 0 then begin
     Beep;
     cMsg := 'O país precisa ser informado!';
     EEst_Pais.SetFocus;
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     exit;
  end;

  if FDT.State = dsInsert then begin
     D.Transaction;
     FDT.Post;
     D.ExecSql('insert into cidade (cid_pais,cid_estado,cid_cidade) values('+FDTEst_Pais.AsString+','+QuotedStr(FDTEst_Estado.AsString)+','+QuotedStr(FDTEst_Cidade.asString)+')');
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

procedure TFrmCadEstado.CEst_PaisActive(Sender: TObject);
begin
  inherited;
  VPais(CEst_Pais);
end;

procedure TFrmCadEstado.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Estado';
  Caption := 'Cadastro de Estado';
  FDT.Open();
  GetDireitos(ModoEdicao,'EstadoIncluir;EstadoAlterar;EstadoExcluir');
end;

procedure TFrmCadEstado.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTEst_Pais,'País');
  AddGrid(FDTEst_PaisNome,'Nome');
  AddGrid(FDTEst_Estado,'Estado');
  AddGrid(FDTEst_Cidade,'Cidade');
  FinalizaGrid;
end;

end.

unit UntCadEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao2, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, View, Dados;

type
  TFrmCadEstoque = class(TFrmCadPadrao2)
    FDTMov_Produto: TIntegerField;
    FDTMov_Data: TDateField;
    FDTMov_Sequencia: TIntegerField;
    FDTMov_TipoDeMovimento: TStringField;
    FDTMov_SaldoAnterior: TBCDField;
    FDTMov_SaldoAtual: TBCDField;
    FDTMov_Quantidade: TBCDField;
    Label1: TLabel;
    EMov_Produto: TDBEdit;
    Label2: TLabel;
    EMov_Data: TDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    EMov_Quantidade: TDBEdit;
    EMov_TipoDeMovimento: TDBComboBox;
    CMov_Produto: TView;
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure CMov_ProdutoActive(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTMov_DataSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEstoque: TFrmCadEstoque;

implementation

{$R *.dfm}

uses UntEstoque, UntView, Rotina;

procedure TFrmCadEstoque.btn_CancelarClick(Sender: TObject);
var cMsg: String;
begin
  cMsg := 'A inclusão do registro foi abortada.';
  FDT.Cancel;

  Application.MessageBox(PChar(cMsg),'Atenção',MB_OK+MB_ICONERROR);

  ModalResult := MrCancel;
end;

procedure TFrmCadEstoque.btn_SalvarClick(Sender: TObject);
var cMsg: String;
begin
  if PF1.CanFocus then PF1.SetFocus;
  
  cMsg := '';

  if FDTMov_Produto.asInteger = 0 then begin
     Beep;
     cMsg := 'É preciso informar o campo "Produto"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     EMov_Produto.SetFocus;
     Abort;
  end;

  if FDTMov_Data.AsDateTime = 0 then begin
     Beep;
     cMsg := 'É preciso informar o campo "Data"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     EMov_Produto.SetFocus;
     Abort;
  end;

  if FDTMov_TipoDeMovimento.AsString = '' then begin
     Beep;
     cMsg := 'É preciso informar o campo "Tipo de Movimento"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     EMov_TipoDeMovimento.SetFocus;
     Abort;
  end;

  if FDTMov_Quantidade.AsFloat = 0 then begin
     Beep;
     cMsg := 'É preciso informar o campo "Quantidade"!';
     Application.MessageBox(PChar(cMsg),'Aviso',MB_OK + MB_ICONINFORMATION);
     EMov_Quantidade.SetFocus;
     Abort;
  end;

  D.Transaction;
  FDTMov_Sequencia.AsInteger := Estoque.GetSequencia(FDTMov_Produto.asInteger,FDTMov_Data.AsDateTime);
  FDT.Post;

  D.TMov.Open;
  try
     Estoque.ProcessaSaldo(FDTMov_Produto.AsInteger,FDTMov_Data.AsDateTime,FDTMov_Sequencia.asInteger);
  finally
     D.TMov.Close;
  end;

  D.Commit;

  cMsg := 'A inclusão do registro foi efetuada com sucesso!';
  Application.MessageBox(PChar(cMsg),'Atenção',MB_OK+MB_ICONINFORMATION);

  ModalResult := MroK;
end;

procedure TFrmCadEstoque.CMov_ProdutoActive(Sender: TObject);
begin
  VProduto(CMov_Produto);
end;

procedure TFrmCadEstoque.FDTMov_DataSetText(Sender: TField; const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FDT.Cancel;
end;

procedure TFrmCadEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Estoque - Lançamento manual';
  Caption := 'Estoque - Lançamento manual';
  FDT.Open();
  FDT.Append;
  FDTMov_TipoDeMovimento.AsString := 'Entrada';
end;

procedure TFrmCadEstoque.FormShow(Sender: TObject);
begin
  inherited;
  EMov_Produto.SetFocus;
end;

end.

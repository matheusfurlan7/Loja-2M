unit UntRelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntRelPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportRTF, frxExportImage, frxExportHTML, frxExportCSV, frxExportText,
  frxExportPDF, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  View;

type
  TFrmRelProduto = class(TFrmRelPadrao)
    GCod: TGroupBox;
    De: TLabel;
    Até: TLabel;
    ECodDe: TEdit;
    ECodAte: TEdit;
    GNome: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EDescricaoDe: TEdit;
    EDescricaoAte: TEdit;
    Label6: TLabel;
    ESituacao: TComboBox;
    GCadastro: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ECadastroDe: TMaskEdit;
    ECadastroAte: TMaskEdit;
    GGrupo: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GUnidade: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    EUnidadeDe: TMaskEdit;
    EUnidadeAte: TMaskEdit;
    CUnidadeDe: TView;
    CUnidadeAte: TView;
    CGrupoDe: TView;
    CGrupoAte: TView;
    EGrupoDe: TEdit;
    EGrupoAte: TEdit;
    EControlaEstoque: TComboBox;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ECodigoDeBarrasDe: TEdit;
    ECodigoDeBarrasAte: TEdit;
    procedure CGrupoDeActive(Sender: TObject);
    procedure CGrupoAteActive(Sender: TObject);
    procedure CUnidadeDeActive(Sender: TObject);
    procedure CUnidadeAteActive(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure ECadastroDeExit(Sender: TObject);
    procedure ECadastroAteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProduto: TFrmRelProduto;

implementation

{$R *.dfm}

uses Rotina, UntView;

procedure TFrmRelProduto.btn_ImprimirClick(Sender: TObject);
var isAnd: Boolean;

   procedure AddWhere(cSql: String);
   begin
     if isAnd = False then begin
        cSQl := 'where ' + cSql;
     end else begin
        cSql := ' and ' + cSql;
     end;

     isAnd := True;

     Q.SQL.Add(cSql);

   end;
begin
  isAnd := False;

  Q.SQL.Clear;
  Q.Sql.Add('SELECT PRO_CODIGO, PRO_DESCRICAO, PRO_SITUACAO, PRO_DATACADASTRO,');
  Q.Sql.Add('PRO_GRUPO, PRO_UNIDADE, PRO_CODIGODEBARRAS, PRO_ESTOQUEMINIMO');
  Q.Sql.Add('PRO_CUSTOMEDIO, PRO_MARGEMLUCRO, PRO_PRECOVENDA, PRO_CONTROLAESTOQUE,');
  Q.Sql.Add('GRU_DESCRICAO, UNI_UNIDADE FROM PRODUTO');
  Q.Sql.Add('INNER JOIN GRUPO ON (GRU_CODIGO = PRO_GRUPO)');
  Q.Sql.Add('INNER JOIN UNIDADE ON (UNI_UNIDADE = PRO_UNIDADE)');

  // Código
  if Trim(ECodDe.Text) <> '' then begin
     AddWhere('Pro_Codigo >= ' + ECodDe.Text);
  end;

  if Trim(ECodAte.Text) <> '' then begin
     AddWhere('Pro_Codigo <= ' + ECodAte.Text);
  end;

  // Descricao
  if Trim(EDescricaoDe.Text) <> '' then begin
     AddWhere('Pro_Descricao >= ' + QuotedStr(EDescricaoDe.Text));
  end;

  if Trim(EDescricaoAte.Text) <> '' then begin
     AddWhere('Pro_Descricao <= ' + QuotedStr(EDescricaoAte.Text));
  end;

  // Situacao
  if ESituacao.Text <> 'Ambos' then begin
     AddWhere('Pro_Situacao = ' + QuotedStr(ESituacao.Text));
  end;

  // Data de cadastro
  if ECadastroAte.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pro_DataCadastro as date) >= ' + (GetSqlDate(StrToDate(ECadastroAte.Text))));
  end;

  if ECadastroAte.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pro_DataCadastro as date) <= ' + (GetSqlDate(StrToDate(ECadastroAte.Text))));
  end;

  // Grupo
  if Trim(EGrupoDe.Text) <> '' then begin
     AddWhere('Pro_Grupo >= ' + EGrupoDe.Text);
  end;

  if Trim(EGrupoAte.Text) <> '' then begin
     AddWhere('Pro_Grupo <= ' + EGrupoAte.Text);
  end;

  // Unidade
  if Trim(EUnidadeDe.Text) <> '' then begin
     AddWhere('Pro_Unidade >= ' + QuotedStr(EUnidadeDe.Text));
  end;

  if Trim(EUnidadeAte.Text) <> '' then begin
     AddWhere('Pro_Unidade <= ' + QuotedStr(EUnidadeAte.Text));
  end;

  // Unidade
  if Trim(ECodigoDeBarrasDe.Text) <> '' then begin
     AddWhere('Pro_CodigoDeBarras >= ' + QuotedStr(ECodigoDeBarrasDe.Text));
  end;

  if Trim(ECodigoDeBarrasAte.Text) <> '' then begin
     AddWhere('Pro_CodigoDeBarras <= ' + QuotedStr(ECodigoDeBarrasAte.Text));
  end;

  // ControlaEstoque
  if EControlaEstoque.Text <> 'Ambos' then begin
     AddWhere('Pes_ControlaEstoque = ' + QuotedStr(EControlaEstoque.Text));
  end;

  inherited;
end;

procedure TFrmRelProduto.CUnidadeAteActive(Sender: TObject);
begin
   VUnidade(CUnidadeAte);
end;

procedure TFrmRelProduto.CUnidadeDeActive(Sender: TObject);
begin
   VUnidade(CUnidadeDe);
end;

procedure TFrmRelProduto.ECadastroAteExit(Sender: TObject);
begin
  AjustaData(ECadastroAte);
end;

procedure TFrmRelProduto.ECadastroDeExit(Sender: TObject);
begin
  AjustaData(ECadastroDe);
end;

procedure TFrmRelProduto.CGrupoAteActive(Sender: TObject);
begin
  VGrupo(CGrupoDe);
end;

procedure TFrmRelProduto.CGrupoDeActive(Sender: TObject);
begin
  VGrupo(CGrupoDe);
end;

end.

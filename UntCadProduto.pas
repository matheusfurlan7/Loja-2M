unit UntCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, View, Dados, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadProduto = class(TFrmCadPadrao)
    FDTPro_Descricao: TStringField;
    FDTPro_Situacao: TStringField;
    FDTPro_Grupo: TIntegerField;
    FDTPro_Unidade: TStringField;
    FDTPro_CodigoDeBarras: TStringField;
    FDTPro_EstoqueMinimo: TBCDField;
    FDTPro_CustoMedio: TBCDField;
    FDTPro_MargemLucro: TBCDField;
    FDTPro_PrecoVenda: TBCDField;
    FDTPro_ControlaEstoque: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EPro_Codigo: TDBEdit;
    EPro_Descricao: TDBEdit;
    EPro_DataCadastro: TDBEdit;
    EPro_Grupo: TDBEdit;
    EPro_CodigoDeBarras: TDBEdit;
    EPro_Situacao: TDBComboBox;
    GEstoque: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    EPro_EstoqueMinimo: TDBEdit;
    EPro_ControlaEstoque: TDBComboBox;
    GPreco: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EPro_CustoMedio: TDBEdit;
    EPro_PrecoVenda: TDBEdit;
    EPro_MargemLucro: TDBEdit;
    EPro_Unidade: TDBEdit;
    FDTPro_Codigo: TFDAutoIncField;
    FDTPro_DataCadastro: TDateField;
    CPro_Grupo: TView;
    CPro_Unidade: TView;
    TGrupo: TFDTable;
    FDTPro_GrupoDescricao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure CPro_GrupoActive(Sender: TObject);
    procedure CPro_UnidadeActive(Sender: TObject);
    procedure EPro_CustoMedioExit(Sender: TObject);
    procedure EPro_MargemLucroExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDTPro_DataCadastroSetText(Sender: TField; const Text: string);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    procedure CalculaPrecoVenda;
    { Private declarations }
  public
    { Public declarations }
    ModoEdicaoAux: String;
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses UntView, System.Math, Rotina, UntRelProduto;

procedure TFrmCadProduto.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  EPro_Descricao.SetFocus;
end;

procedure TFrmCadProduto.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelProduto := TFrmRelProduto.Create(Self);
   try
      FrmRelProduto.ShowModal;
   finally
      FreeAndNil(FrmRelProduto);
   end;
end;

procedure TFrmCadProduto.btn_InserirClick(Sender: TObject);
begin
  inherited;
  FDTPro_Situacao.AsString := 'Ativo';
  FDTPro_DataCadastro.AsDateTime := Now;
  FDTPro_ControlaEstoque.AsString := 'Sim';
  FDTPro_EstoqueMinimo.AsFloat := 0;
  FDTPro_CustoMedio.AsFloat := 0;
  FDTPro_PrecoVenda.AsFloat := 0;
  FDTPro_MargemLucro.AsFloat := 0;
  EPro_Descricao.SetFocus;
end;

procedure TFrmCadProduto.btn_SalvarClick(Sender: TObject);
  procedure VerificaCampo;
  begin
     if (FDTPro_Descricao.AsString = '') then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Descrição"','Aviso',MB_ICONINFORMATION);
        if EPro_Descricao.CanFocus then EPro_Descricao.SetFocus;
        Abort;
     end;

     if (FDTPro_Grupo.AsInteger = 0) then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Grupo"','Aviso',MB_ICONINFORMATION);
        if EPro_Grupo.CanFocus then EPro_Grupo.SetFocus;
        Abort;
     end;

     if (FDTPro_Unidade.asString = '') then begin
        beep;
        Application.MessageBox('É preciso informar o campo "Unidade"','Aviso',MB_ICONINFORMATION);
        if EPro_Unidade.CanFocus then EPro_Unidade.SetFocus;
        Abort;
     end;

     if FDTPro_ControlaEstoque.AsString = 'Sim' then begin
        if (FDTPro_EstoqueMinimo.AsInteger <= 0) then begin
           beep;
           Application.MessageBox('É preciso informar o campo "Estoque mínimo"','Aviso',MB_ICONINFORMATION);
           if EPro_EstoqueMinimo.CanFocus then EPro_EstoqueMinimo.SetFocus;
           Abort;
        end;
     end;

  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
end;

procedure TFrmCadProduto.EPro_CustoMedioExit(Sender: TObject);
begin
  inherited;
  if (FDTPro_CustoMedio.AsFloat > 0)  and (FDTPro_MargemLucro.AsFloat > 0) then begin
     FDTPro_PrecoVenda.AsFloat :=  Roundto(FDTPro_CustoMedio.asFloat * ((FDTPro_MargemLucro.asFloat / 100) +1),-2);
  end;
end;

procedure TFrmCadProduto.EPro_MargemLucroExit(Sender: TObject);
begin
  inherited;
  CalculaPrecoVenda;
end;

procedure TFrmCadProduto.FDTPro_DataCadastroSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Produto';
  Caption := 'Cadastro de Produto';
  FDT.Open();
  GetDireitos(ModoEdicao,'ProdutoIncluir;ProdutoAlterar;ProdutoExcluir');
  ModoEdicaoAux := ModoEdicao;
end;

procedure TFrmCadProduto.FormShow(Sender: TObject);
begin
  ModoEdicao := ModoEdicaoAux;
  inherited;

  // Alimenta grid da aba consulta
  ClearGrid;
  AddGrid(FDTPro_Codigo,'Código');
  AddGrid(FDTPro_Descricao,'Descrição');
  AddGrid(FDTPro_Grupo,'Grupo');
  AddGrid(FDTPro_GrupoDescricao,'Descrição');
  AddGrid(FDTPro_CodigoDeBarras,'Código de barras');
  AddGrid(FDTPro_Unidade,'Unidade');
  FinalizaGrid;
end;

procedure TFrmCadProduto.CPro_UnidadeActive(Sender: TObject);
begin
  inherited;
  VUnidade(CPro_Unidade);
end;

procedure TFrmCadProduto.CalculaPrecoVenda;
begin
   if ((FDTPro_CustoMedio.AsFloat > 0)  and (FDTPro_MargemLucro.AsFloat > 0)) then begin
      FDTPro_PrecoVenda.AsFloat :=  Roundto(FDTPro_CustoMedio.asFloat * ((FDTPro_MargemLucro.asFloat / 100) +1),-2);
   end else if ((FDTPro_PrecoVenda.AsFloat > 0) and (FDTPro_MargemLucro.AsFloat > 0)) then begin
      FDTPro_CustoMedio.AsFloat :=  Roundto(FDTPro_PrecoVenda.asFloat * ((FDTPro_MargemLucro.asFloat / 100) * FDTPro_MargemLucro.asFloat ),-2);
   end;
end;

procedure TFrmCadProduto.CPro_GrupoActive(Sender: TObject);
begin
  inherited;
  VGrupo(CPro_Grupo);
end;

end.

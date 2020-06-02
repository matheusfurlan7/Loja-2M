unit UntCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.ValEdit,
  Vcl.Menus, Vcl.DBGrids;

type
  TFrmCadPerfil = class(TFrmCadPadrao)
    FDTPER_CODIGO: TFDAutoIncField;
    FDTPER_STATUS: TStringField;
    FDTPER_INCLUSAO: TDateField;
    FDTPER_ALTERACAO: TDateField;
    FDTPER_DESCRICAO: TStringField;
    FDTPER_DIREITOS: TMemoField;
    Label1: TLabel;
    EPER_CODIGO: TDBEdit;
    Label5: TLabel;
    EPER_DESCRICAO: TDBEdit;
    EPER_STATUS: TDBCheckBox;
    Label39: TLabel;
    GCadastro: TGroupBox;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    PerfilMenu: TCheckBox;
    PerfilIncluir: TCheckBox;
    PerfilAlterar: TCheckBox;
    PerfilExcluir: TCheckBox;
    UsuarioIncluir: TCheckBox;
    UsuarioExcluir: TCheckBox;
    UsuarioAlterar: TCheckBox;
    UsuarioMenu: TCheckBox;
    PaisIncluir: TCheckBox;
    PaisExcluir: TCheckBox;
    PaisAlterar: TCheckBox;
    PaisMenu: TCheckBox;
    CidadeIncluir: TCheckBox;
    CidadeExcluir: TCheckBox;
    CidadeMenu: TCheckBox;
    UnidadeIncluir: TCheckBox;
    UnidadeExcluir: TCheckBox;
    UnidadeAlterar: TCheckBox;
    UnidadeMenu: TCheckBox;
    GrupoIncluir: TCheckBox;
    GrupoExcluir: TCheckBox;
    GrupoAlterar: TCheckBox;
    GrupoMenu: TCheckBox;
    ProdutoIncluir: TCheckBox;
    ProdutoExcluir: TCheckBox;
    ProdutoAlterar: TCheckBox;
    ProdutoMenu: TCheckBox;
    PessoaIncluir: TCheckBox;
    PessoaExcluir: TCheckBox;
    PessoaAlterar: TCheckBox;
    PessoaMenu: TCheckBox;
    RichEdit1: TRichEdit;
    Label40: TLabel;
    EstadoIncluir: TCheckBox;
    EstadoExcluir: TCheckBox;
    EstadoAlterar: TCheckBox;
    EstadoMenu: TCheckBox;
    GVenda: TGroupBox;
    GCompra: TGroupBox;
    GEstoque: TGroupBox;
    VENDAMANUTENCAO: TCheckBox;
    VENDAINCLUIR: TCheckBox;
    VENDAALTERAR: TCheckBox;
    VENDAEXCLUIR: TCheckBox;
    VENDAHISTCLI: TCheckBox;
    VENDAHISTVEN: TCheckBox;
    VENDAHISTNUM: TCheckBox;
    VENDABAIXAR: TCheckBox;
    VENDAESTORNAR: TCheckBox;
    COMPRAMANUTENCAO: TCheckBox;
    COMPRAINCLUIR: TCheckBox;
    COMPRAALTERAR: TCheckBox;
    COMPRAEXCLUIR: TCheckBox;
    COMPRAHISTFOR: TCheckBox;
    COMPRAHISTCOM: TCheckBox;
    COMPRAHISTNUM: TCheckBox;
    COMPRABAIXAR: TCheckBox;
    COMPRAESTORNAR: TCheckBox;
    ESTOQUEPOSICAO: TCheckBox;
    ESTOQUEHISPRO: TCheckBox;
    VENDACONSULTAR: TCheckBox;
    COMPRACONSULTAR: TCheckBox;
    ESTOQUELANCAMENTO: TCheckBox;
    FDTSTATUS: TStringField;
    VENDAQTD: TCheckBox;
    COMPRAQTD: TCheckBox;
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure FDTCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPerfil: TFrmCadPerfil;
  isGravar: Boolean;

implementation

{$R *.dfm}

uses Rotina, UntRelPerfil;

procedure TFrmCadPerfil.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  FDTPER_ALTERACAO.AsDateTime := Date;
  if EPER_DESCRICAO.CanFocus then EPER_DESCRICAO.SetFocus;
end;

procedure TFrmCadPerfil.btn_CancelarClick(Sender: TObject);
begin
  inherited;
  EPER_STATUS.Visible := True;
end;

procedure TFrmCadPerfil.btn_ImprimirClick(Sender: TObject);
begin
  FrmRelPerfil := TFrmRelPerfil.Create(Self);
  try
     FrmRelPerfil.ShowModal;
  finally
     FreeAndNil(FrmRelPerfil);
  end;
  inherited;
end;

procedure TFrmCadPerfil.btn_InserirClick(Sender: TObject);

   procedure IndexComboBox(aWC: Array of  TControl);
   var I: Integer;
   begin
      for I := 0 to High(aWC) do begin
         TCheckBox(aWC[I]).Checked := False;
      end;
   end;

begin
  inherited;
  FDTPER_STATUS.AsString := 'S';
  FDTPER_INCLUSAO.AsDateTime := Date;
  EPER_STATUS.Visible := False;

  // Perfil
  IndexComboBox([PerfilMenu,PerfilIncluir,PerfilAlterar,PerfilExcluir]);

  // Usuário
  IndexComboBox([UsuarioMenu,UsuarioIncluir,UsuarioAlterar,UsuarioExcluir]);

  // País
  IndexComboBox([PaisMenu,PaisIncluir,PaisAlterar,PaisExcluir]);

  // Estado
  IndexComboBox([EstadoMenu,EstadoIncluir,EstadoAlterar,EstadoExcluir]);

  // Cidade
  IndexComboBox([CidadeMenu,CidadeIncluir,CidadeExcluir]);

  // Unidade
  IndexComboBox([UnidadeMenu,UnidadeIncluir,UnidadeAlterar,UnidadeExcluir]);

  // Grupo
  IndexComboBox([GrupoMenu,GrupoIncluir,GrupoAlterar,GrupoExcluir]);

  // Produto
  IndexComboBox([ProdutoMenu,ProdutoIncluir,ProdutoAlterar,ProdutoExcluir]);

  // Pessoa
  IndexComboBox([PessoaMenu,PessoaIncluir,PessoaAlterar,PessoaExcluir]);

  // Venda
  IndexComboBox([VendaManutencao,VendaIncluir,VendaAlterar,VendaExcluir,VendaConsultar,
                 VendaBaixar,VendaEstornar,VendaHistNum,VendaHistCli,VendaHistVen,VENDAQTD]);

  // Compra
  IndexComboBox([CompraManutencao,CompraIncluir,CompraAlterar,CompraExcluir,CompraConsultar,
                 CompraBaixar,CompraEstornar,CompraHistNum,CompraHistFor,CompraHistCom, CompraQtd]);

  // Estoque
  IndexComboBox([EstoqueLancamento,EstoquePosicao,EstoqueHisPro]);

  if EPER_DESCRICAO.CanFocus then EPER_DESCRICAO.SetFocus;
end;

procedure TFrmCadPerfil.btn_SalvarClick(Sender: TObject);
   function GetValue(CB: TCheckBox): String;
   begin
     if CB.Checked then begin
        Result := 'S';
     end else begin
        Result := 'N';
     end;
   end;

var cAux:String;
    cMsg: String;
begin
  if PF1.CanFocus then PF1.SetFocus;

  if FDTPER_DESCRICAO.asString = '' then begin
     Beep;
     cMsg := 'É preciso informar o campo "Descrição"!';
     EPER_DESCRICAO.SetFocus;
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     Exit;
  end;

  isGravar := True;

  FDTPER_DIREITOS.Clear;

  cAux := '';

  // Perfil
  cAux := cAux + ';' + 'PerfilMenu='       + GetValue(PerfilMenu);
  cAux := cAux + ';' + 'PerfilIncluir='    + GetValue(PerfilIncluir);
  cAux := cAux + ';' + 'PerfilAlterar='    + GetValue(PerfilAlterar);
  cAux := cAux + ';' + 'PerfilExcluir='    + GetValue(PerfilExcluir);

  // Usuário
  cAux := cAux + ';' + 'UsuarioMenu='      + GetValue(UsuarioMenu);
  cAux := cAux + ';' + 'UsuarioIncluir='   + GetValue(UsuarioIncluir);
  cAux := cAux + ';' + 'UsuarioAlterar='   + GetValue(UsuarioAlterar);
  cAux := cAux + ';' + 'UsuarioExcluir='   + GetValue(UsuarioExcluir);

  // País
  cAux := cAux + ';' + 'PaisMenu='         + GetValue(PaisMenu);
  cAux := cAux + ';' + 'PaisIncluir='      + GetValue(PaisIncluir);
  cAux := cAux + ';' + 'PaisAlterar='      + GetValue(PaisAlterar);
  cAux := cAux + ';' + 'PaisExcluir='      + GetValue(PaisExcluir);

  // Estado
  cAux := cAux + ';' + 'EstadoMenu='       + GetValue(EstadoMenu);
  cAux := cAux + ';' + 'EstadoIncluir='    + GetValue(EstadoIncluir);
  cAux := cAux + ';' + 'EstadoAlterar='    + GetValue(EstadoAlterar);
  cAux := cAux + ';' + 'EstadoExcluir='    + GetValue(EstadoExcluir);

  // Cidade
  cAux := cAux + ';' + 'CidadeMenu='       + GetValue(CidadeMenu);
  cAux := cAux + ';' + 'CidadeIncluir='    + GetValue(CidadeIncluir);
  cAux := cAux + ';' + 'CidadeExcluir='    + GetValue(CidadeExcluir);

  // Unidade
  cAux := cAux + ';' + 'UnidadeMenu='      + GetValue(UnidadeMenu);
  cAux := cAux + ';' + 'UnidadeIncluir='   + GetValue(UnidadeIncluir);
  cAux := cAux + ';' + 'UnidadeAlterar='   + GetValue(UnidadeAlterar);
  cAux := cAux + ';' + 'UnidadeExcluir='   + GetValue(UnidadeExcluir);

  // Grupo
  cAux := cAux + ';' + 'GrupoMenu='        + GetValue(GrupoMenu);
  cAux := cAux + ';' + 'GrupoIncluir='     + GetValue(GrupoIncluir);
  cAux := cAux + ';' + 'GrupoAlterar='     + GetValue(GrupoAlterar);
  cAux := cAux + ';' + 'GrupoExcluir='     + GetValue(GrupoExcluir);

  // Produto
  cAux := cAux + ';' + 'ProdutoMenu='      + GetValue(ProdutoMenu);
  cAux := cAux + ';' + 'ProdutoIncluir='   + GetValue(ProdutoIncluir);
  cAux := cAux + ';' + 'ProdutoAlterar='   + GetValue(ProdutoAlterar);
  cAux := cAux + ';' + 'ProdutoExcluir='   + GetValue(ProdutoExcluir);

  // Pessoa
  cAux := cAux + ';' + 'PessoaMenu='       + GetValue(PessoaMenu);
  cAux := cAux + ';' + 'PessoaIncluir='    + GetValue(PessoaIncluir);
  cAux := cAux + ';' + 'PessoaAlterar='    + GetValue(PessoaAlterar);
  cAux := cAux + ';' + 'PessoaExcluir='    + GetValue(PessoaExcluir);

  // Venda
  cAux := cAux + ';' + 'VendaManutencao='  + GetValue(VendaManutencao);
  cAux := cAux + ';' + 'VendaIncluir='     + GetValue(VendaIncluir);
  cAux := cAux + ';' + 'VendaAlterar='     + GetValue(VendaAlterar);
  cAux := cAux + ';' + 'VendaExcluir='     + GetValue(VendaExcluir);
  cAux := cAux + ';' + 'VendaConsultar='   + GetValue(VendaConsultar);
  cAux := cAux + ';' + 'VendaBaixar='      + GetValue(VendaBaixar);
  cAux := cAux + ';' + 'VendaEstornar='    + GetValue(VendaEstornar);
  cAux := cAux + ';' + 'VendaHistNum='     + GetValue(VendaHistNum);
  cAux := cAux + ';' + 'VendaHistCli='     + GetValue(VendaHistCli);
  cAux := cAux + ';' + 'VendaHistVen='     + GetValue(VendaHistVen);
  cAux := cAux + ';' + 'VendaQtd='         + GetValue(VendaQTD);

  // Compra
  cAux := cAux + ';' + 'CompraManutencao=' + GetValue(CompraManutencao);
  cAux := cAux + ';' + 'CompraIncluir='    + GetValue(CompraIncluir);
  cAux := cAux + ';' + 'CompraAlterar='    + GetValue(CompraAlterar);
  cAux := cAux + ';' + 'CompraExcluir='    + GetValue(CompraExcluir);
  cAux := cAux + ';' + 'CompraConsultar='  + GetValue(CompraConsultar);
  cAux := cAux + ';' + 'CompraBaixar='     + GetValue(CompraBaixar);
  cAux := cAux + ';' + 'CompraEstornar='   + GetValue(CompraEstornar);
  cAux := cAux + ';' + 'CompraHistNum='    + GetValue(CompraHistNum);
  cAux := cAux + ';' + 'CompraHistFor='    + GetValue(CompraHistFor);
  cAux := cAux + ';' + 'CompraHistCom='    + GetValue(CompraHistCom);
  cAux := cAux + ';' + 'CompraQtd='        + GetValue(CompraQTD);

  // Estoque
  cAux := cAux + ';' + 'EstoqueLancamento='   + GetValue(EstoqueLancamento);
  cAux := cAux + ';' + 'EstoquePosicao='   + GetValue(EstoquePosicao);
  cAux := cAux + ';' + 'EstoqueHisPro='   + GetValue(EstoqueHisPro);
  cAux := cAux + ';';

  FDTPER_DIREITOS.AsString := cAux;

  inherited;

  EPER_STATUS.Visible := True;

  isGravar := False;
end;

procedure TFrmCadPerfil.DSDataChange(Sender: TObject; Field: TField);
var cAux: String;
    cOpc: String;
    Comp: TCheckBox;
begin
  inherited;
  if isGravar then begin
     exit;
  end;

  cAux := FDTPER_DIREITOS.AsString;
  Parse(cAux,';');

  while cAux <> '' do begin
    Comp := TCheckBox(FindComponent(Parse(cAux,'=')));
    cOpc := Parse(cAux,';');
    if cOpc = 'S' then begin
       Comp.Checked := True;
    end else begin
       Comp.Checked := False;
    end;
  end;
end;

procedure TFrmCadPerfil.FDTCalcFields(DataSet: TDataSet);
begin
  inherited;
  if FDTPER_STATUS.asString = 'S' then begin
     FDTSTATUS.asString := 'Ativo';
  end else begin
     FDTSTATUS.asString := 'Inativo';
  end;
end;

procedure TFrmCadPerfil.FormCreate(Sender: TObject);
begin
  inherited;
  isGravar := False;
  Caption := 'Cadastro de Perfil';
  LCad.Caption := 'Cadastro de Perfil';
  FDT.Open();
  GetDireitos(ModoEdicao,'PerfilIncluir;PerfilAlterar;PerfilExcluir');
end;

procedure TFrmCadPerfil.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTPER_CODIGO,'Código');
  AddGrid(FDTPER_DESCRICAO,'Descrição');
  AddGrid(FDTSTATUS,'Situação');
  FinalizaGrid;
end;

end.

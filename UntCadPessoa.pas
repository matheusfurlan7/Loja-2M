
unit UntCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Dados, View, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadPessoa = class(TFrmCadPadrao)
    GDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CPF: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    RG: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EPes_Nome: TDBEdit;
    Pes_RazaoSocial: TDBEdit;
    EPes_CPFCNPJ: TDBEdit;
    EPes_Situacao: TDBComboBox;
    EPes_Codigo: TDBEdit;
    EPes_TipoDePessoa: TDBComboBox;
    EPes_RGIE: TDBEdit;
    EPes_DataNascimento: TDBEdit;
    EPes_Sexo: TDBComboBox;
    EPes_DataCadastro: TDBEdit;
    EPes_Telefone: TDBEdit;
    EPes_Celular: TDBEdit;
    EPes_Email: TDBEdit;
    GClassificacao: TGroupBox;
    EPes_Cliente: TDBCheckBox;
    EPes_Fornecedor: TDBCheckBox;
    GEndereco: TGroupBox;
    Label18: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    EPes_Complemento: TDBEdit;
    EPes_Endereco: TDBEdit;
    EPes_Cep: TDBEdit;
    EPes_Bairro: TDBEdit;
    EPes_Numero: TDBEdit;
    EPes_Pais: TDBEdit;
    EPes_Estado: TDBEdit;
    EPes_Cidade: TDBEdit;
    FDTPes_Nome: TStringField;
    FDTPes_RazaoSocial: TStringField;
    FDTPes_Situacao: TStringField;
    FDTPes_TipoDePessoa: TStringField;
    FDTPes_CPFCNPJ: TStringField;
    FDTPes_RGIE: TStringField;
    FDTPes_Telefone: TStringField;
    FDTPes_Celular: TStringField;
    FDTPes_Email: TStringField;
    FDTPes_Site: TStringField;
    FDTPes_Pais: TIntegerField;
    FDTPes_Estado: TStringField;
    FDTPes_Cidade: TStringField;
    FDTPes_Bairro: TStringField;
    FDTPes_Endereco: TStringField;
    FDTPes_Numero: TStringField;
    FDTPes_Complemento: TStringField;
    FDTPes_Cep: TStringField;
    FDTPes_Sexo: TStringField;
    FDTPes_Codigo: TIntegerField;
    FDTPes_DataCadastro: TDateField;
    FDTPes_DataNascimento: TDateField;
    CPes_Estado: TView;
    CPes_Cidade: TView;
    CPes_Pais: TView;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    FDTPes_Vendedor: TStringField;
    FDTPes_Cliente: TStringField;
    FDTPes_Fornecedor: TStringField;
    FDTPes_Comprador: TStringField;
    TPais: TFDTable;
    FDTPEs_PaisNome: TStringField;
    FDTPes_CPFCNPJAUX: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CPes_PaisActive(Sender: TObject);
    procedure EPes_TipoDePessoaChange(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure CPes_EstadoActive(Sender: TObject);
    procedure CPes_CidadeActive(Sender: TObject);
    procedure EPes_TipoDePessoaExit(Sender: TObject);
    procedure btn_PrimeiroClick(Sender: TObject);
    procedure btn_AnteriorClick(Sender: TObject);
    procedure btn_ProximoClick(Sender: TObject);
    procedure btn_UltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDTPes_DataNascimentoSetText(Sender: TField; const Text: string);
    procedure FDTPes_DataCadastroSetText(Sender: TField; const Text: string);
    procedure FDTCalcFields(DataSet: TDataSet);
    procedure PagesChange(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPessoa: TFrmCadPessoa;

implementation

{$R *.dfm}

uses UntView, Rotina, System.MaskUtils, untRelPessoa;

procedure TFrmCadPessoa.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  EPes_Nome.SetFocus;
end;

procedure TFrmCadPessoa.btn_AnteriorClick(Sender: TObject);
begin
  inherited;
  EPes_TipoDePessoaExit(Self);
end;

procedure TFrmCadPessoa.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelPessoa := TFrmRelPessoa.Create(Self);
   try
      FrmRelPessoa.ShowModal;
   finally
      FreeAndNil(FrmRelPessoa);
   end;
end;

procedure TFrmCadPessoa.btn_InserirClick(Sender: TObject);
begin
  inherited;
  FDTPes_DataCadastro.asDateTime := Date;
  FDTPes_Situacao.asString := 'Ativo';
  FDTPes_Sexo.asString := 'Masculino';
  FDTPes_TipoDePessoa.asString := 'Física';
  FDTPes_Cliente.AsString := 'Sim';
  FDTPes_Fornecedor.AsString := 'Não';
  FDTPes_Vendedor.AsString := 'Não';
  FDTPes_Comprador.AsString := 'Não';
  EPes_TipoDePessoaChange(Self);
  EPEs_TipoDePessoaExit(Self);
  EPes_Nome.SetFocus;
end;

procedure TFrmCadPessoa.btn_PrimeiroClick(Sender: TObject);
begin
  inherited;
  EPes_TipoDePessoaExit(Self);
end;

procedure TFrmCadPessoa.btn_ProximoClick(Sender: TObject);
begin
  inherited;
  EPes_TipoDePessoaExit(Self);
end;

procedure TFrmCadPessoa.btn_SalvarClick(Sender: TObject);
  procedure VerificaCampo;
  begin
     if (FDTPes_Codigo.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EPes_Codigo.CanFocus then EPes_Codigo.SetFocus;
        Application.MessageBox('É preciso informar o campo "Código"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPes_Nome.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EPes_Nome.CanFocus then EPes_Nome.SetFocus;
        Application.MessageBox('É preciso informar o campo "Nome"','Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPes_CPFCNPJ.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EPes_CPFCNPJ.CanFocus then EPes_CPFCNPJ.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "'+CPF.Caption+'"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPes_RGIE.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EPes_RGIE.CanFocus then EPes_RGIE.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "'+RG.Caption+'"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTPes_Cliente.asString = 'Não') and (FDTPes_Fornecedor.asString = 'Não') and
        (FDTPes_Vendedor.asString = 'Não') and (FDTPes_Comprador.asString = 'Não') then begin
        beep;
        Pages.ActivePage := P1;
        if GClassificacao.CanFocus then GClassificacao.SetFocus;
        Application.MessageBox(PChar('É preciso informar uma classificação'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;
  inherited;
end;

procedure TFrmCadPessoa.btn_UltimoClick(Sender: TObject);
begin
  inherited;
  EPes_TipoDePessoaExit(Self);
end;

procedure TFrmCadPessoa.CPes_CidadeActive(Sender: TObject);
begin
  inherited;
  if (FDTPes_Pais.asInteger = 0) then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPes_Pais.SetFocus;
     Abort;
  end;
  if (FDTPes_Estado.asString = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o estado'),'Aviso',MB_ICONINFORMATION);
     EPes_Estado.SetFocus;
     Abort;
  end;
  VCidade(CPes_Cidade,FDTPes_Pais.AsInteger,FDTPes_Estado.AsString);
end;

procedure TFrmCadPessoa.CPes_EstadoActive(Sender: TObject);
begin
  inherited;
  if (FDTPes_Pais.asInteger = 0) then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPes_Pais.SetFocus;
     Abort;
  end;
  VEstado(CPes_Estado,FDTPes_Pais.AsInteger);
end;

procedure TFrmCadPessoa.CPes_PaisActive(Sender: TObject);
begin
  inherited;
  VPais(CPEs_Pais);
end;

procedure TFrmCadPessoa.EPes_TipoDePessoaChange(Sender: TObject);
begin
  inherited;
  if FDT.State in [dsInsert,dsEdit] then begin
     FDTPes_CPFCNPJ.Clear;
     FDTPes_RGIE.Clear;
  end;
end;

procedure TFrmCadPessoa.EPes_TipoDePessoaExit(Sender: TObject);
begin
  inherited;
  if EPes_TipoDePessoa.Text = 'Física' then begin
    CPF.Caption:= 'CPF';
    RG.Caption:= 'RG';
    FDTPes_CPFCNPJ.EditMask:= '999.999.999-99;1;_';
  end else begin
    CPF.Caption:= 'CNPJ';
    RG.Caption:= 'IE';
    FDTPes_CPFCNPJ.EditMask:= '99.999.999/9999-99;1;_';
  end;
end;

procedure TFrmCadPessoa.FDTCalcFields(DataSet: TDataSet);
var cMask: String;
begin
  if FDTPes_TipoDePessoa.AsString = 'Física' then begin
     cMask := '000\.000\.000\-00;0;';
  end else begin
     cMask := '00\.000\.000\/0000\-00;0';
  end;

  FDTPes_CPFCNPJAUX.AsString := FormatmaskText(cMask,FDTPes_CPFCNPJ.asString);
end;

procedure TFrmCadPessoa.FDTPes_DataCadastroSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPessoa.FDTPes_DataNascimentoSetText(Sender: TField;
  const Text: string);
begin
   AjustaDataDBEdit(Sender,Text);
end;

procedure TFrmCadPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  LCad.Caption := 'Cadastro de Pessoa';
  Caption := 'Cadastro de Pessoa';
  FDT.Open();
  GetDireitos(ModoEdicao,'PessoaIncluir;PessoaAlterar;PessoaExcluir');
end;

procedure TFrmCadPessoa.FormShow(Sender: TObject);
begin
  inherited;
  EPes_TipoDePessoaExit(Self);

  ClearGrid;
  AddGrid(FDTPes_Codigo,'Código');
  AddGrid(FDTPes_RazaoSocial,'Razao Social');
  AddGrid(FDTPes_TipoDePessoa,'Tipo');
  AddGrid(FDTPes_CPFCNPJAUX,'CPF/CNPJ');
  AddGrid(FDTPes_Pais,'País');
  AddGrid(FDTPEs_PaisNome,'Nome');
  AddGrid(FDTPes_Estado,'Estado');
  AddGrid(FDTPes_Cidade,'Cidade');
  AddGrid(FDTPes_Situacao,'Situação');
  FinalizaGrid;
end;

procedure TFrmCadPessoa.PagesChange(Sender: TObject);
begin
  inherited;
  if Pages.ActivePage = P1 then begin
     EPes_TipoDePessoaExit(Self);
  end;
end;

end.

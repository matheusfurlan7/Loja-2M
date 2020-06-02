unit untRelPessoa;

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
  TFrmRelPessoa = class(TFrmRelPadrao)
    GCod: TGroupBox;
    De: TLabel;
    Até: TLabel;
    ECodDe: TEdit;
    ECodAte: TEdit;
    GNome: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ENomeDe: TEdit;
    ENomeAte: TEdit;
    GRazao: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ERazaoDe: TEdit;
    ERazaoAte: TEdit;
    Label6: TLabel;
    ESituacao: TComboBox;
    Label7: TLabel;
    ESexo: TComboBox;
    GCadastro: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ECadastroDe: TMaskEdit;
    ECadastroAte: TMaskEdit;
    GNascimento: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ENascimentoDe: TMaskEdit;
    ENascimentoAte: TMaskEdit;
    GPais: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GEstado: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    EEstadoDe: TMaskEdit;
    EEstadoAte: TMaskEdit;
    GCidade: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    ECidadeDe: TMaskEdit;
    ECidadeAte: TMaskEdit;
    CCidadeDe: TView;
    CCidadeAte: TView;
    CEstadoDe: TView;
    CEstadoAte: TView;
    CPaisDe: TView;
    CPaisAte: TView;
    EPaisDe: TEdit;
    EPaisAte: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ECliente: TComboBox;
    EFornecedor: TComboBox;
    EVendedor: TComboBox;
    EComprador: TComboBox;
    Label5: TLabel;
    ETipo: TComboBox;
    procedure ECadastroDeExit(Sender: TObject);
    procedure ECadastroAteExit(Sender: TObject);
    procedure ENascimentoDeExit(Sender: TObject);
    procedure ENascimentoAteExit(Sender: TObject);
    procedure CPaisDeActive(Sender: TObject);
    procedure CPaisAteActive(Sender: TObject);
    procedure CEstadoDeActive(Sender: TObject);
    procedure EPaisAteExit(Sender: TObject);
    procedure EPaisDeExit(Sender: TObject);
    procedure EEstadoDeExit(Sender: TObject);
    procedure EEstadoAteExit(Sender: TObject);
    procedure CEstadoAteActive(Sender: TObject);
    procedure CCidadeDeActive(Sender: TObject);
    procedure ECidadeAteExit(Sender: TObject);
    procedure ECidadeDeExit(Sender: TObject);
    procedure CCidadeAteActive(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
    procedure EPaisDeEnter(Sender: TObject);
    procedure EPaisAteEnter(Sender: TObject);
    procedure EEstadoDeEnter(Sender: TObject);
    procedure EEstadoAteEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPessoa: TFrmRelPessoa;

implementation

{$R *.dfm}

uses Rotina, UntView;

var PaisDe: String;
    PaisAte: String;
    EstadoDe: String;
    EstadoAte: String;

procedure TFrmRelPessoa.btn_ImprimirClick(Sender: TObject);
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
  Q.Sql.Add('SELECT Pes_Codigo, Pes_Nome, Pes_RazaoSocial, Pes_Situacao, Pes_TipoDePessoa,');
  Q.Sql.Add('Pes_CPFCNPJ, Pes_RGIE, Pes_Telefone, Pes_Celular, Pes_Email, Pes_Site, Pes_Pais,');
  Q.Sql.Add('Pes_Estado, Pes_Cidade, Pes_Bairro, Pes_Endereco, Pes_Numero, Pes_Complemento,');
  Q.Sql.Add('Pes_Cep, Pes_DataCadastro, Pes_DataNascimento, Pes_Cliente, Pes_Fornecedor,');
  Q.Sql.Add('Pes_Sexo, Pes_Vendedor, Pes_Comprador, Pai_Nome FROM Pessoa');
  Q.Sql.Add('INNER JOIN Pais on (Pai_Codigo = Pes_Pais)');

  // Código
  if Trim(ECodDe.Text) <> '' then begin
     AddWhere('Pes_Codigo >= ' + ECodDe.Text);
  end;

  if Trim(ECodAte.Text) <> '' then begin
     AddWhere('Pes_Codigo <= ' + ECodAte.Text);
  end;

  // Nome
  if Trim(ENomeDe.Text) <> '' then begin
     AddWhere('Pes_Nome >= ' + QuotedStr(ENomeDe.Text));
  end;

  if Trim(ENomeAte.Text) <> '' then begin
     AddWhere('Pes_Nome <= ' + QuotedStr(ENomeAte.Text));
  end;

  // Razao Social
  if Trim(ERazaoDe.Text) <> '' then begin
     AddWhere('Pes_Razao >= ' + QuotedStr(ERazaoDe.Text));
  end;

  if Trim(ERazaoAte.Text) <> '' then begin
     AddWhere('Pes_Razao <= ' + QuotedStr(ERazaoAte.Text));
  end;

  // Situacao
  if ESituacao.Text <> 'Ambos' then begin
     AddWhere('Pes_Situacao = ' + QuotedStr(ESituacao.Text));
  end;

  // Sexo
  if ESexo.Text <> 'Ambos' then begin
     AddWhere('Pes_Sexo = ' + QuotedStr(ESexo.Text));
  end;

  // Tipo
  if ETipo.Text <> 'Ambos' then begin
     AddWhere('Pes_Tipo = ' + QuotedStr(ETipo.Text));
  end;

  // Data de nascimento
  if ENascimentoDe.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pes_DataNascimento as date) >= ' + (GetSqlDate(StrToDate(ENascimentoDe.Text))));
  end;

  if ENascimentoAte.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pes_DataNascimento as date) <= ' + (GetSqlDate(StrToDate(ENascimentoAte.Text))));
  end;

  // Data de cadastro
  if ECadastroAte.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pes_DataCadastro as date) >= ' + (GetSqlDate(StrToDate(ECadastroAte.Text))));
  end;

  if ECadastroAte.Text <> '  /  /    ' then begin
     AddWhere('Cast(Pes_DataCadastro as date) <= ' + (GetSqlDate(StrToDate(ECadastroAte.Text))));
  end;

  // País
  if Trim(EPaisDe.Text) <> '' then begin
     AddWhere('Pes_Pais >= ' + EPaisDe.Text);
  end;

  if Trim(EPaisAte.Text) <> '' then begin
     AddWhere('Pes_Pais <= ' + EPaisAte.Text);
  end;

  // Estado
  if Trim(EEstadoDe.Text) <> '' then begin
     AddWhere('Pes_Estado >= ' + QuotedStr(EEstadoDe.Text));
  end;

  if Trim(EEstadoAte.Text) <> '' then begin
     AddWhere('Pes_Estado <= ' + QuotedStr(EEstadoAte.Text));
  end;

  // Cidade
  if Trim(ECidadeDe.Text) <> '' then begin
     AddWhere('Pes_Cidade >= ' + QuotedStr(ECidadeDe.Text));
  end;

  if Trim(ECidadeAte.Text) <> '' then begin
     AddWhere('Pes_Cidade <= ' + QuotedStr(ECidadeAte.Text));
  end;

  // Cliente
  if ECliente.Text <> 'Ambos' then begin
     AddWhere('Pes_Cliente = ' + QuotedStr(ECliente.Text));
  end;

  // Fornecedor
  if EFornecedor.Text <> 'Ambos' then begin
     AddWhere('Pes_Fornecedor = ' + QuotedStr(EFornecedor.Text));
  end;

  // Vendedor
  if Evendedor.Text <> 'Ambos' then begin
     AddWhere('Pes_Vendedor = ' + QuotedStr(Evendedor.Text));
  end;

  // Comprador
  if EComprador.Text <> 'Ambos' then begin
     AddWhere('Pes_Comprador = ' + QuotedStr(EComprador.Text));
  end;

  inherited;
end;

procedure TFrmRelPessoa.CCidadeAteActive(Sender: TObject);
begin
  if ((EPaisAte.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisAte.SetFocus;
     Abort;
  end;

  if (Trim(EEstadoAte.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o estado'),'Aviso',MB_ICONINFORMATION);
     EEstadoAte.SetFocus;
     Abort;
  end;
  VCidade(CCidadeAte,StrToInt(EPaisAte.Text),EEstadoAte.Text);
end;

procedure TFrmRelPessoa.CCidadeDeActive(Sender: TObject);
begin
  if ((EPaisDe.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisDe.SetFocus;
     Abort;
  end;

  if (Trim(EEstadoDe.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o estado'),'Aviso',MB_ICONINFORMATION);
     EEstadoDe.SetFocus;
     Abort;
  end;
  VCidade(CCidadeDe,StrToInt(EPaisDe.Text),EEstadoDe.Text);
end;

procedure TFrmRelPessoa.CEstadoAteActive(Sender: TObject);
begin
  if (Trim(EPaisAte.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisAte.SetFocus;
     Abort;
  end;
  VEstado(CEstadoAte,StrToInt(EPaisAte.Text));
end;

procedure TFrmRelPessoa.CEstadoDeActive(Sender: TObject);
begin
  if (Trim(EPaisDe.Text) = '') then begin
     Beep;
     Application.MessageBox(PChar('É preciso informar o país'),'Aviso',MB_ICONINFORMATION);
     EPaisDe.SetFocus;
     Abort;
  end;
  VEstado(CEstadoDe,StrToInt(EPaisDe.Text));
end;

procedure TFrmRelPessoa.CPaisAteActive(Sender: TObject);
begin
  VPais(CPaisAte);
end;

procedure TFrmRelPessoa.CPaisDeActive(Sender: TObject);
begin
  VPais(CPaisDe);
end;

procedure TFrmRelPessoa.ECadastroAteExit(Sender: TObject);
begin
   AjustaData(ECadastroAte);
end;

procedure TFrmRelPessoa.ECadastroDeExit(Sender: TObject);
begin
   AjustaData(ECadastroDe);
end;

procedure TFrmRelPessoa.ECidadeAteExit(Sender: TObject);
begin
   CCidadeAte.Valid;
end;

procedure TFrmRelPessoa.ECidadeDeExit(Sender: TObject);
begin
   CCidadeDe.Valid;
end;

procedure TFrmRelPessoa.EEstadoDeEnter(Sender: TObject);
begin
   EstadoDe := Trim(EEstadoDe.TexT);
end;

procedure TFrmRelPessoa.EEstadoDeExit(Sender: TObject);
begin
   CEstadoDe.Valid;
   if (Trim(EEstadoDe.Text) = '') or (Trim(EEstadoDe.Text) <> EstadoDe) then begin
      ECidadeDe.Clear;
      CCidadeDe.Clear;
   end;
end;

procedure TFrmRelPessoa.ENascimentoAteExit(Sender: TObject);
begin
   AjustaData(ENascimentoAte);
end;

procedure TFrmRelPessoa.ENascimentoDeExit(Sender: TObject);
begin
   AjustaData(ENascimentoDe);
end;

procedure TFrmRelPessoa.EPaisAteEnter(Sender: TObject);
begin
   PaisAte := Trim(EPaisAte.TexT);
end;

procedure TFrmRelPessoa.EPaisAteExit(Sender: TObject);
begin
   CPaisAte.Valid;
   if (Trim(EPaisAte.TexT) = '') or (Trim(EPaisAte.Text) <> PaisDe) then begin
      EEstadoAte.Clear;
      CEstadoAte.Valid;
      ECidadeAte.Clear;
      CCidadeAte.Clear;
   end;
end;

procedure TFrmRelPessoa.EPaisDeEnter(Sender: TObject);
begin
   PaisDe := Trim(EPaisDe.Text);
end;

procedure TFrmRelPessoa.EPaisDeExit(Sender: TObject);
begin
  CPaisDe.Valid;
  if (Trim(EPaisDe.TexT) = '') or (Trim(EPaisDe.Text) <> PaisDe) then begin
     EEstadoDe.Clear;
     CEstadoDe.Valid;
     ECidadeDe.Clear;
     CCidadeDe.Clear;
  end;
end;

procedure TFrmRelPessoa.EEstadoAteEnter(Sender: TObject);
begin
  EstadoAte := Trim(EEstadoAte.Text);
end;

procedure TFrmRelPessoa.EEstadoAteExit(Sender: TObject);
begin
   CEstadoDe.Valid;
   if (Trim(EEstadoAte.TexT) = '') or (Trim(EEstadoAte.Text) <> EstadoAte) then begin
      ECidadeAte.Clear;
      CCidadeAte.Clear;
   end;
end;

end.

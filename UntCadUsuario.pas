unit UntCadUsuario;

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
  TFrmCadUsuario = class(TFrmCadPadrao)
    FDTUSU_CODIGO: TFDAutoIncField;
    FDTUSU_STATUS: TStringField;
    FDTUSU_INCLUSAO: TDateField;
    FDTUSU_ALTERACAO: TDateField;
    FDTUSU_NOME: TStringField;
    FDTUSU_DEPARTAMENTO: TStringField;
    FDTUSU_SENHA: TStringField;
    FDTUSU_LOGIN: TStringField;
    FDTUSU_PERFIL: TIntegerField;
    Label1: TLabel;
    EUSU_CODIGO: TDBEdit;
    Label5: TLabel;
    EUSU_NOME: TDBEdit;
    Label6: TLabel;
    EUSU_DEPARTAMENTO: TDBEdit;
    Label7: TLabel;
    EUSU_SENHA: TDBEdit;
    Label8: TLabel;
    EUSU_LOGIN: TDBEdit;
    Label9: TLabel;
    EUSU_PERFIL: TDBEdit;
    EUSU_Status: TDBCheckBox;
    CUSU_PERFIL: TView;
    TPerfil: TFDTable;
    FDTUSU_PERFILDESCRICAO: TStringField;
    FDTSTATUS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure CUSU_PERFILActive(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDTCalcFields(DataSet: TDataSet);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.dfm}

uses UntView, Rotina, UntPrincipal, UntRelUsuario;

procedure TFrmCadUsuario.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  FDTUSU_ALTERACAO.AsDateTime := Date;
  if EUSU_NOME.CanFocus then EUSU_NOME.SetFocus;
end;

procedure TFrmCadUsuario.btn_CancelarClick(Sender: TObject);
begin
  inherited;
  EUSU_STATUS.Visible := True;
end;

procedure TFrmCadUsuario.btn_ExcluirClick(Sender: TObject);
begin
  if FrmPrincipal.UsuarioUSU_CODIGO.AsInteger = FDTUSU_CODIGO.AsInteger then begin
     Beep;
     Application.MessageBox('Não é permitido excluir o seu próprio usuário!','Aviso',MB_OK + MB_ICONINFORMATION);
     Exit;
  end;

  inherited;
end;

procedure TFrmCadUsuario.btn_ImprimirClick(Sender: TObject);
begin
   FrmRelUsuario := TFrmRelUsuario.Create(Self);
   try
      FrmRelUsuario.ShowModal;
   finally
      FreeAndNil(FrmRelUsuario);
   end;
end;

procedure TFrmCadUsuario.btn_InserirClick(Sender: TObject);
begin
  inherited;
  FDTUSU_INCLUSAO.AsDateTime := Date;
  FDTUSU_STATUS.AsString := 'S';
  EUSU_STATUS.Visible := False;

  if EUSU_NOME.CanFocus then EUSU_NOME.SetFocus;
end;

procedure TFrmCadUsuario.btn_SalvarClick(Sender: TObject);
  procedure VerificaCampo;
  var
    cSql: String;
  begin
     if (FDTUsu_Nome.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EUsu_Nome.CanFocus then EUsu_Nome.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Nome"!'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTUSU_DEPARTAMENTO.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EUSU_DEPARTAMENTO.CanFocus then EUSU_DEPARTAMENTO.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Departamento"!'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;
     
     if (FDTUsu_Login.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EUsu_login.CanFocus then EUsu_login.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Login"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTUsu_senha.asString = '') then begin
        beep;
        Pages.ActivePage := P1;
        if EUsu_senha.CanFocus then EUsu_senha.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Senha"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     if (FDTUsu_perfil.asInteger = 0) then begin
        beep;
        Pages.ActivePage := P1;
        if EUsu_perfil.CanFocus then EUsu_perfil.SetFocus;
        Application.MessageBox(PChar('É preciso informar o campo "Perfil"'),'Aviso',MB_ICONINFORMATION);
        Abort;
     end;

     cSql := 'select usu_codigo from usuario where usu_login='+QuotedStr(FDTUSU_LOGIN.AsString);
     if FDT.State = dsEdit then begin
        cSql := cSql + ' and usu_codigo <> '+FDTUSU_CODIGO.AsString;
     end;
     
     if D.GetIQuery('usu_codigo',cSql) <> 0 then begin
        Beep;
        Pages.ActivePage := P1;
        if EUsu_login.CanFocus then EUsu_login.SetFocus;
        Application.MessageBox(PChar('O login informado já esta em uso por outro usuário!'),'Aviso',MB_ICONINFORMATION);
        Abort;                
     end;
  end;
begin
  if PF1.CanFocus then PF1.SetFocus;
  VerificaCampo;

  inherited;

  EUSU_STATUS.Visible := True;
end;

procedure TFrmCadUsuario.CUSU_PERFILActive(Sender: TObject);
begin
  inherited;
  VPerfil(CUSU_PERFIL);
end;

procedure TFrmCadUsuario.FDTCalcFields(DataSet: TDataSet);
begin
   if FDTUSU_STATUS.AsString = 'S' then begin
      FDTSTATUS.asString := 'Ativo';
   end else begin
      FDTSTATUS.asString := 'Inativo';
   end;
end;

procedure TFrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := 'Cadastro de Usuário';
  LCad.Caption := 'Cadastro de Usuário';
  FDT.Open();
  GetDireitos(ModoEdicao,'UsuarioIncluir;UsuarioAlterar;UsuarioExcluir');
end;

procedure TFrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;

  ClearGrid;
  AddGrid(FDTUSU_CODIGO,'Código');
  AddGrid(FDTUSU_NOME,'Nome');
  AddGrid(FDTUSU_DEPARTAMENTO,'Departamento');
  AddGrid(FDTUSU_PERFIL,'Perfil');
  AddGrid(FDTUSU_PERFILDESCRICAO,'Descrição');
  AddGrid(FDTSTATUS,'Situação');
  FinalizaGrid;
end;

end.

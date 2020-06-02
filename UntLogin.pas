unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB, Vcl.Imaging.pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Senha2: TLabel;
    EUsuario: TEdit;
    ESenha: TEdit;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EUsuarioChange(Sender: TObject);
    procedure ESenhaChange(Sender: TObject);
    procedure EUsuarioEnter(Sender: TObject);
    procedure EUsuarioExit(Sender: TObject);
    procedure ESenhaExit(Sender: TObject);
    procedure ESenhaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregaBotao;
    procedure CarregaCorEdit(Sender: TObject; Cor: TColor);
    { Private declarations }
  public
    { Public declarations }
    Usuario: String;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Dados, Vcl.Imaging.jpeg, UntPrincipal;

var nTentativa: Integer;

procedure TFrmLogin.CarregaBotao;
begin
   BitBtn1.Enabled := (Length(ESenha.Text) > 0) and (Length(EUsuario.Text) > 0);
end;

procedure TFrmLogin.ESenhaChange(Sender: TObject);
begin
   Carregabotao;
end;

procedure TFrmLogin.ESenhaEnter(Sender: TObject);
begin
  CarregaCorEdit(Sender,clinfobk);
end;

procedure TFrmLogin.ESenhaExit(Sender: TObject);
begin
  CarregaCorEdit(Sender,clwindow);
end;

procedure TFrmLogin.EUsuarioChange(Sender: TObject);
begin
  CarregaBotao;
end;

procedure TFrmLogin.EUsuarioEnter(Sender: TObject);
begin
  CarregaCorEdit(Sender,clinfobk);
end;

procedure TFrmLogin.EUsuarioExit(Sender: TObject);
begin
  CarregaCorEdit(Sender,clwindow);
end;

procedure TFrmLogin.CarregaCorEdit(Sender: TObject; Cor: TColor);
begin
   TEdit(Sender).Color := Cor;
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
var cUsu: String;
    cSen: String;
begin
  EUsuarioExit(EUsuario);
  ESenhaExit(ESenha);

  cUsu := Trim(EUsuario.Text);
  cSen := Trim(ESenha.Text);

  FrmPrincipal.Usuario.Close;
  FrmPrincipal.Usuario.Sql.Clear;
  FrmPrincipal.Usuario.Sql.Add('select * from usuario u');
  FrmPrincipal.Usuario.Sql.Add('inner join perfil p on (p.per_codigo = u.usu_perfil) ');
  FrmPrincipal.Usuario.Sql.Add('where usu_login = ' + QuotedStr(cUsu) + ' and usu_senha = ' + QuotedStr(cSen));
  FrmPrincipal.Usuario.Open;

  if (FrmPrincipal.Usuario.RecordCount > 0) then begin
     if FrmPrincipal.UsuarioUsu_Status.AsString = 'S' then begin
        ModalResult  := MrOk;
        FrmPrincipal.PUsu.Caption := Trim(EUsuario.Text);
     end else begin
        Application.MessageBox('O seu login se encontra desativado atualmente'+#13 +
                               'Entre em contato com o administrador','Aviso',MB_ICONINFORMATION);
        Application.Terminate;
     end;
  end else begin
     Application.MessageBox('Usuário e/ou senha incorreta','Aviso',MB_ICONINFORMATION);
     EUsuario.Clear;
     ESenha.Clear;
     EUsuario.SetFocus;
     nTentativa := nTentativa + 1;
  end;

  if nTentativa >= 5 then begin
     Application.MessageBox('Suas tentativas foram excedidas!','Aviso',MB_ICONINFORMATION);
     Application.Terminate;
  end;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
   ModalResult := MrCancel;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then begin
      if (Trim(EUsuario.Text) <> '') and (Trim(ESenha.Text) <> '') then begin
         Key := #0;
         BitBtn1Click(nil);
      end else begin
         Key := #0;
         Perform(WM_NEXTDLGCTL,0,0);
      end;
   end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
   nTentativa := 0;
   EUsuario.SetFocus;
end;

end.

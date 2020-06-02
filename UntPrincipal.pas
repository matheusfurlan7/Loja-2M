unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Classes,
  Vcl.Graphics,Vcl.Controls, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Forms,
  System.ImageList, Vcl.ImgList, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Data.FMTBcd, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.Controls, Vcl.Bind.Navigator, Vcl.WinXCtrls, Vcl.DBCtrls, Dados,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFrmPrincipal = class(TForm)
    Timer1: TTimer;
    MMenu: TMainMenu;
    Rodape: TPanel;
    PData: TPanel;
    PUsu: TPanel;
    PMsgHint: TPanel;
    PTopo: TPanel;
    Sair1: TMenuItem;
    Shape1: TShape;
    Shape2: TShape;
    Cadastros1: TMenuItem;
    Pais1: TMenuItem;
    Black: TImageList;
    Estado1: TMenuItem;
    Usurio1: TMenuItem;
    PAux: TPanel;
    Cidade1: TMenuItem;
    Unidade1: TMenuItem;
    Grupo1: TMenuItem;
    Produto1: TMenuItem;
    Pessoas1: TMenuItem;
    N1: TMenuItem;
    Usuario: TFDQuery;
    Perfil1: TMenuItem;
    Venda1: TMenuItem;
    Compras1: TMenuItem;
    N3: TMenuItem;
    UsuarioUSU_CODIGO: TFDAutoIncField;
    UsuarioUSU_STATUS: TStringField;
    UsuarioUSU_INCLUSAO: TDateField;
    UsuarioUSU_ALTERACAO: TDateField;
    UsuarioUSU_NOME: TStringField;
    UsuarioUSU_DEPARTAMENTO: TStringField;
    UsuarioUSU_SENHA: TStringField;
    UsuarioUSU_LOGIN: TStringField;
    UsuarioUSU_PERFIL: TIntegerField;
    UsuarioPER_CODIGO: TFDAutoIncField;
    UsuarioPER_STATUS: TStringField;
    UsuarioPER_INCLUSAO: TDateField;
    UsuarioPER_ALTERACAO: TDateField;
    UsuarioPER_DESCRICAO: TStringField;
    UsuarioPER_DIREITOS: TMemoField;
    Manuteno1: TMenuItem;
    N4: TMenuItem;
    Hitiricopornmero1: TMenuItem;
    Histricoporcliente1: TMenuItem;
    Histricoporvendedor1: TMenuItem;
    Manuteno2: TMenuItem;
    N5: TMenuItem;
    Histricopornmero1: TMenuItem;
    Histricoporfornecedor1: TMenuItem;
    Histricoporcomprador1: TMenuItem;
    Estoque1: TMenuItem;
    Posiodeestoque1: TMenuItem;
    N6: TMenuItem;
    Histricodemovimentaoporproduto1: TMenuItem;
    Lanamento1: TMenuItem;
    Shape3: TShape;
    Image: TImage;
    N2: TMenuItem;
    Qtdedecompraporfornedor1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Pais1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Perfil1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure Hitiricopornmero1Click(Sender: TObject);
    procedure Histricoporcliente1Click(Sender: TObject);
    procedure Histricoporvendedor1Click(Sender: TObject);
    procedure Histricoporcomprador1Click(Sender: TObject);
    procedure Histricoporfornecedor1Click(Sender: TObject);
    procedure Histricopornmero1Click(Sender: TObject);
    procedure Manuteno2Click(Sender: TObject);
    procedure Histricodemovimentaoporproduto1Click(Sender: TObject);
    procedure Posiodeestoque1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Qtdedecompraporfornedor1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MensagemHint(Sender: TObject);
    procedure MainException(Sender: TObject; E: Exception);
    procedure Login;
    procedure AppMsg(var Msg: TMsg; var Handled: Boolean);
    procedure CorSystem;
    procedure CarregaDireitos;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UntLogin, Rotina,System.Variants,
     UntCadPais, UntCadEstado, UntCadCidade, UntCadGrupo,
     UntCadProduto, UntCadUnidade, UntCadPessoa, View, UntCadPerfil, UntCadUsuario,
     UntManPedidoVenda, UntVendaHistNum, UntVendaHistCli, UntVendaHistVen,
     UntManPedidoCompra, UntCompraHistCom, UntCompraHistFor, UntCompraHistNum,
     UntEstoqueHistPro, UntEstoquePosicao, UntCadEstoque, UntRelQtdPedidoVenda,
  UntRelQtdPedidoComprador;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if not FCreate then begin
       if Application.MessageBox('Deseja fechar do sistema?','Sair',MB_YESNO + MB_ICONINFORMATION) = ID_NO then begin
          CanClose := False;
       end;
    end;

    if FTransacao then begin
      D.Rollback;
    end;
end;

procedure TFrmPrincipal.CorSystem;
begin
   CarregaCor([PTopo,PAux,PData,PUsu,PMsgHint]);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   FTransacao := False;
   FCreate := False;
   FColorSystem := 'clBtnFace';
   FColorFontSystem := 'clBlack';

   Application.OnHint := MensagemHint;
   Application.OnException := MainException;
   Application.OnMessage := AppMsg;

   PData.Caption := FormatDateTime('dd" de "mmmm" de "yyyy", " dddd hh":"mm":"ss', now);

   FCreate := True;
end;

procedure TFrmPrincipal.Grupo1Click(Sender: TObject);
begin
   FrmCadGrupo := TFrmCadGrupo.Create(Self);
   try
      FrmCadGrupo.ShowModal;
   finally
      FreeAndNil(FrmCadGrupo);
   end;
end;

procedure TFrmPrincipal.Histricodemovimentaoporproduto1Click(Sender: TObject);
begin
   FrmEstoqueHistPro := TFrmEstoqueHistPro.Create(self);
   try
      FrmEstoqueHistPro.ShowModal;
   finally
      FreeAndNil(FrmEstoqueHistPro);
   end;
end;

procedure TFrmPrincipal.Histricoporcliente1Click(Sender: TObject);
begin
   FrmVendaHistCli := TFrmVendaHistCli.Create(Self);
   try
      FrmVendaHistCli.ShowModal;
   finally
      FreeAndNil(FrmVendaHistCli);
   end;
end;

procedure TFrmPrincipal.Histricoporcomprador1Click(Sender: TObject);
begin
   FrmCompraHistCom := TFrmCompraHistCom.Create(Self);
   try
      FrmCompraHistCom.ShowModal;
   finally
      FreeAndNil(FrmCompraHistCom);
   end;
end;

procedure TFrmPrincipal.Histricoporfornecedor1Click(Sender: TObject);
begin
   FrmCompraHistFor := TFrmCompraHistFor.Create(Self);
   try
      FrmCompraHistFor.ShowModal;
   finally
      FreeAndNil(FrmCompraHistFor);
   end;
end;

procedure TFrmPrincipal.Histricopornmero1Click(Sender: TObject);
begin
   FrmCompraHistNum := TFrmCompraHistNum.Create(Self);
   try
      FrmCompraHistNum.ShowModal;
   finally
      FreeAndNil(FrmCompraHistNum);
   end;
end;

procedure TFrmPrincipal.Histricoporvendedor1Click(Sender: TObject);
begin
   FrmVendaHistVen := TFrmVendaHistVen.Create(Self);
   try
      FrmVendaHistVen.ShowModal;
   finally
      FreeAndNil(FrmVendaHistVen);
   end;
end;

procedure TFrmPrincipal.Hitiricopornmero1Click(Sender: TObject);
begin
   FrmVendaHistNum := TFrmVendaHistNum.Create(Self);
   try
      FrmVendaHistNum.ShowModal;
   finally
      FreeAndNil(FrmVendaHistNum);
   end;
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
   if FCreate then begin
      Login;
   end;
end;

procedure TFrmPrincipal.Lanamento1Click(Sender: TObject);
begin
   FrmCadEstoque := TFrmCadEstoque.Create(Self);
   try
      FrmCadEstoque.ShowModal;
   finally
      FreeAndNil(FrmCadEstoque);
   end;
end;

procedure TFrmPrincipal.Login;
begin
   Menu := nil;
   Rodape.Visible := False;
   PTopo.Visible := False;
   Image.Visible := False;

   FrmLogin := TFrmLogin.Create(Self);
   try
     if FrmLogin.ShowModal = MrOk then begin
        CarregaDireitos;

        CorSystem;
        Rodape.Visible := True;
        Image.Top := Trunc((Screen.Height - Image.Height) / 2);
        Image.Left := Trunc((Screen.Width - Image.Width) / 2);
        Image.Visible := True;
        Menu :=  MMenu;

        FCreate := False;
        Application.BringToFront;
        FrmPrincipal.SetFocus;
     end else begin
        Application.Terminate;
     end;
   finally
     FreeAndNil(FrmLogin);
   end;
end;

procedure TFrmPrincipal.CarregaDireitos;
   procedure VisibleMenu(MMenu: TMenuItem);
   var X: Integer;
   begin
      for X := 0 to MMenu.Count -1 do begin
         VisibleMenu(MMenu.Items[X]);
      end;

      if MMenu.Tag <> -1 then begin
         MMenu.Visible := False;
      end;
   end;

var I: Integer;
    Direito: String;
begin
   for I := 0 to MMenu.Items.Count -1 do begin
       VisibleMenu(MMenu.Items[I]);
   end;

   Usuario.RefreshRecord;
   Direito := UsuarioPER_DIREITOS.AsString;

   // Direitos cadastro
   Perfil1.Visible := GetDireitoMenu('PERFILMENU',Direito);
   Usurio1.Visible := GetDireitoMenu('USUARIOMENU',Direito);
   Pais1.Visible := GetDireitoMenu('PAISMENU',Direito);
   Estado1.Visible := GetDireitoMenu('ESTADOMENU',Direito);
   Cidade1.Visible := GetDireitoMenu('CIDADEMENU',Direito);
   Pessoas1.Visible := GetDireitoMenu('PESSOAMENU',Direito);
   Unidade1.Visible := GetDireitoMenu('UNIDADEMENU',Direito);
   Grupo1.Visible := GetDireitoMenu('GRUPOMENU',Direito);
   Produto1.Visible := GetDireitoMenu('PRODUTOMENU',Direito);

   N3.Visible := (Perfil1.Visible or Usurio1.Visible) and (Pais1.Visible or Estado1.Visible or Cidade1.Visible);
   N1.Visible := (Pais1.Visible or Estado1.Visible or Cidade1.Visible or Pessoas1.Visible) and (Unidade1.Visible or Grupo1.Visible or Produto1.Visible);

   Cadastros1.Visible := Perfil1.Visible or Usurio1.Visible or Pais1.Visible or
                         Estado1.Visible or Cidade1.Visible or  Unidade1.Visible or Grupo1.Visible or
                         Produto1.Visible or Pessoas1.Visible;

   // Direito do pedido de venda
   Manuteno1.Visible := GetDireitoMenu('VENDAMANUTENCAO',Direito);

   Hitiricopornmero1.Visible := GetDireitoMenu('VENDAHISTNUM',Direito);
   Histricoporcliente1.Visible := GetDireitoMenu('VENDAHISTCLI',Direito);
   Histricoporvendedor1.Visible := GetDireitoMenu('VENDAHISTVEN',Direito);
   N2.Visible := GetDireitoMenu('VENDAQTD',Direito);

   N4.Visible := (Manuteno1.Visible) and (Hitiricopornmero1.Visible or Histricoporcliente1.Visible or Histricoporvendedor1.Visible or N2.Visible);

   Venda1.Visible := Manuteno1.Visible or Hitiricopornmero1.Visible or Histricoporcliente1.Visible or Histricoporvendedor1.Visible or N2.Visible;

   // Direito do pedido de compra
   Manuteno2.Visible := GetDireitoMenu('COMPRAMANUTENCAO',Direito);

   Histricopornmero1.Visible := GetDireitoMenu('COMPRAHISTNUM',Direito);
   Histricoporfornecedor1.Visible := GetDireitoMenu('COMPRAHISTFOR',Direito);
   Histricoporcomprador1.Visible := GetDireitoMenu('COMPRAHISTCOM',Direito);
   Qtdedecompraporfornedor1.Visible := GetDireitoMenu('COMPRAQTD',Direito);

   N5.Visible := (Manuteno2.Visible) and (Histricopornmero1.Visible or Histricoporfornecedor1.Visible or Histricoporcomprador1.Visible or Qtdedecompraporfornedor1.Visible);

   Compras1.Visible := Manuteno2.Visible or Histricopornmero1.Visible or Histricoporfornecedor1.Visible or Histricoporcomprador1.Visible or Qtdedecompraporfornedor1.Visible;

   // Direito do estoque
   Lanamento1.Visible := GetDireitoMenu('ESTOQUELANCAMENTO',Direito);
   Posiodeestoque1.Visible := GetDireitoMenu('ESTOQUEPOSICAO',Direito);
   Histricodemovimentaoporproduto1.Visible := GetDireitoMenu('ESTOQUEHISPRO',Direito);

   N6.Visible := (Posiodeestoque1.Visible) and (Histricodemovimentaoporproduto1.Visible);

   Estoque1.Visible := Posiodeestoque1.Visible or Histricodemovimentaoporproduto1.Visible;
end;

procedure TFrmPrincipal.AppMsg(var Msg: TMsg; var Handled: Boolean);
var nX: Integer;
    W: TWinControl;
begin
    if (Msg.wParam = VK_F9) then begin
       if GetKeyState(VK_CONTROL) < 0 then begin
          Handled := True;
       end else if GetKeyState(VK_SHIFT) < 0 then begin
          Handled := True;
       end else if GetKeyState(VK_MENU) < 0 then begin
          Handled := True;
       end else begin
          for nX := 0 to (Screen.ActiveForm.ComponentCount - 1) do begin
             if Screen.ActiveForm.Components[nX].ClassNameIs('TView') then begin
                W := TView(Screen.ActiveForm.Components[nX]).Associate;
                if (W.Enabled) and (W.Focused) then begin
                   TView(Screen.ActiveForm.Components[nX]).ViewActive;
                   Handled := True;
                end;
             end;
          end;
       end;
    end;
end;

procedure TFrmPrincipal.Cidade1Click(Sender: TObject);
begin
   FrmCadCidade := TFrmCadCidade.Create(Self);
   try
      FrmCadCidade.ShowModal;
   finally
      FreeAndNil(FrmCadCidade);
   end;
end;

procedure TFrmPrincipal.MensagemHint(Sender: TObject);
begin
  PMsgHint.Caption := GetLongHint(Application.Hint);
end;

procedure TFrmPrincipal.N2Click(Sender: TObject);
begin
   FrmRelQtdPedidoVenda := TFrmRelQtdPedidoVenda.Create(Self);
   try
      FrmRelQtdPedidoVenda.ShowModal;
   finally
      FreeAndNil(FrmRelQtdPedidoVenda);
   end;
end;

procedure TFrmPrincipal.Pais1Click(Sender: TObject);
begin
   FrmCadPais := TFrmCadPais.Create(Self);
   try
      FrmCadPais.ShowModal;
   finally
      FreeAndNil(FrmCadPais);
   end;
end;

procedure TFrmPrincipal.Perfil1Click(Sender: TObject);
begin
   FrmCadPerfil := TFrmCadPerfil.Create(Self);
   try
      FrmCadPerfil.ShowModal;
   finally
      FreeAndNil(FrmCadPerfil);
   end;
   CarregaDireitos;
end;

procedure TFrmPrincipal.Pessoas1Click(Sender: TObject);
begin
   FrmCadPessoa := TFrmCadPessoa.Create(Self);
   try
      FrmCadPessoa.ShowModal;
   finally
      FreeAndNil(FrmCadPessoa);
   end;
end;

procedure TFrmPrincipal.Posiodeestoque1Click(Sender: TObject);
begin
   FrmEstoquePosicao := TFrmEstoquePosicao.Create(Self);
   try
      FrmEstoquePosicao.ShowModal;
   finally
      FreeAndNil(FrmEstoquePosicao);
   end;
end;

procedure TFrmPrincipal.Produto1Click(Sender: TObject);
begin
   FrmCadProduto := TFrmCadProduto.Create(Self);
   try
      FrmCadProduto.ShowModal;
   finally
      FreeAndNil(FrmCadProduto);
   end;
end;

procedure TFrmPrincipal.Qtdedecompraporfornedor1Click(Sender: TObject);
begin
   FrmRelQtdPedidoComprador := TFrmRelQtdPedidoComprador.Create(Self);
   try
      FrmRelQtdPedidoComprador.ShowModal;
   finally
      FreeAndNil(FrmRelQtdPedidoComprador);
   end;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
    PData.Caption := FormatDateTime('dd" de "mmmm" de "yyyy", " dddd hh":"mm":"ss', now);
end;

procedure TFrmPrincipal.Unidade1Click(Sender: TObject);
begin
   FrmCadUnidade := TFrmCadUnidade.Create(Self);
   try
      FrmCadUnidade.ShowModal;
   finally
      FreeAndNil(FrmCadUnidade);
   end;
end;

procedure TFrmPrincipal.Usurio1Click(Sender: TObject);
begin
   FrmCadUsuario := TFrmCadUsuario.Create(Self);
   try
      FrmCadUsuario.ShowModal;
   finally
      FreeAndNil(FrmCadUsuario);
   end;
end;

procedure TFrmPrincipal.MainException(Sender: TObject; E: Exception);
begin
   if FTransacao then begin
      D.RollBack;
   end;

   Application.ShowException(E);
   if E.ClassName = 'EAccessViolation' then begin
      Application.Terminate;
   end;
 end;

procedure TFrmPrincipal.Manuteno1Click(Sender: TObject);
begin
   FrmManPedidoVenda := TFrmManPedidoVenda.Create(Self);
   try
      FrmManPedidoVenda.ShowModal;
   finally
      FreeAndNil(FrmManPedidoVenda);
   end;
end;

procedure TFrmPrincipal.Manuteno2Click(Sender: TObject);
begin
   FrmManPedidoCompra := TFrmManPedidoCompra.Create(Self);
   try
      FrmManPedidoCompra.ShowModal;
   finally
      FreeAndNil(FrmManPedidoCompra);
   end;
end;

{ --------------------------------- CHAMADOS ----------------------------------}

procedure TFrmPrincipal.Estado1Click(Sender: TObject);
begin
   FrmCadEstado := TFrmCadEstado.Create(Self);
   try
      FrmCadEstado.ShowModal;
   finally
      FreeAndNil(FrmCadEstado);
   end;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
   if (MDIChildCount > 0) then begin
      Application.MessageBox('É preciso fechar todas as telas antes de fazer logoff!','Aviso',MB_OK + MB_ICONINFORMATION);
      Exit;
   end;

   Login;
end;

end.

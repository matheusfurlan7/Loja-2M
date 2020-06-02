
program LOJA2M;

uses
  Vcl.Forms,
  Dados in 'Dados.pas' {D: TDataModule},
  Rotina in 'Rotina.pas',
  UntCadCidade in 'UntCadCidade.pas' {FrmCadCidade},
  UntCadEstado in 'UntCadEstado.pas' {FrmCadEstado},
  UntCadGrupo in 'UntCadGrupo.pas' {FrmCadGrupo},
  UntCadPadrao in 'UntCadPadrao.pas' {FrmCadPadrao},
  UntCadPadrao2 in 'UntCadPadrao2.pas' {FrmCadPadrao2},
  UntCadPadrao3 in 'UntCadPadrao3.pas' {FrmCadPadrao3},
  UntCadPais in 'UntCadPais.pas' {FrmCadPais},
  UntCadPedidoVenda in 'UntCadPedidoVenda.pas' {FrmCadPedidoVenda},
  UntCadPedidoVendaItem in 'UntCadPedidoVendaItem.pas' {FrmCadPedidoVendaItem},
  UntCadPerfil in 'UntCadPerfil.pas' {FrmCadPerfil},
  UntCadPessoa in 'UntCadPessoa.pas' {FrmCadPessoa},
  UntCadProduto in 'UntCadProduto.pas' {FrmCadProduto},
  UntCadUnidade in 'UntCadUnidade.pas' {FrmCadUnidade},
  UntCadUsuario in 'UntCadUsuario.pas' {FrmCadUsuario},
  UntConsultaPadrao in 'UntConsultaPadrao.pas' {FrmConsultaPadrao},
  UntEstoque in 'UntEstoque.pas',
  UntLogin in 'UntLogin.pas' {FrmLogin},
  UntManPadrao in 'UntManPadrao.pas' {FrmManPadrao},
  UntManPedidoVenda in 'UntManPedidoVenda.pas' {FrmManPedidoVenda},
  UntPrincipal in 'UntPrincipal.pas' {FrmPrincipal},
  UntVenda in 'UntVenda.pas',
  UntVendaHistCli in 'UntVendaHistCli.pas' {FrmVendaHistCli},
  UntVendaHistNum in 'UntVendaHistNum.pas' {FrmVendaHistNum},
  UntView in 'UntView.pas',
  UntVendaHistVen in 'UntVendaHistVen.pas' {FrmVendaHistVen},
  UntCompraHistCom in 'UntCompraHistCom.pas' {FrmCompraHistCom},
  UntCompra in 'UntCompra.pas',
  UntCompraHistFor in 'UntCompraHistFor.pas' {FrmCompraHistFor},
  UntCompraHistNum in 'UntCompraHistNum.pas' {FrmCompraHistNum},
  UntManPedidoCompra in 'UntManPedidoCompra.pas' {FrmManPedidoCompra},
  UntCadPedidoCompra in 'UntCadPedidoCompra.pas' {FrmCadPedidoCompra},
  UntCadPedidoCompraItem in 'UntCadPedidoCompraItem.pas' {FrmCadPedidoCompraItem},
  UntEstoqueHistPro in 'UntEstoqueHistPro.pas' {FrmEstoqueHistPro},
  UntEstoquePosicao in 'UntEstoquePosicao.pas' {FrmEstoquePosicao},
  UntCadEstoque in 'UntCadEstoque.pas' {FrmCadEstoque},
  UntRelPadrao in 'UntRelPadrao.pas' {FrmRelPadrao},
  untRelPessoa in 'untRelPessoa.pas' {FrmRelPessoa},
  UntRelGrupo in 'UntRelGrupo.pas' {FrmRelGrupo},
  UntRelUnidade in 'UntRelUnidade.pas' {FrmRelUnidade},
  UntRelPais in 'UntRelPais.pas' {FrmRelPais},
  UntRelEstado in 'UntRelEstado.pas' {FrmRelEstado},
  UntRelCidade in 'UntRelCidade.pas' {FrmRelCidade},
  UntRelProduto in 'UntRelProduto.pas' {FrmRelProduto},
  UntRelEstoqueHistPro in 'UntRelEstoqueHistPro.pas' {FrmRelEstoqueHistPro},
  UntRelEstoquePosicao in 'UntRelEstoquePosicao.pas' {FrmRelEstoquePosicao},
  UntRelCompra in 'UntRelCompra.pas' {FrmRelCompra},
  UntRelPerfil in 'UntRelPerfil.pas' {FrmRelPerfil},
  UntRelPadrao2 in 'UntRelPadrao2.pas' {FrmRelPadrao2},
  UntRelVenda in 'UntRelVenda.pas' {FrmRelVenda},
  UntRelUsuario in 'UntRelUsuario.pas' {FrmRelUsuario},
  UntRelQtdPedidoComprador in 'UntRelQtdPedidoComprador.pas' {FrmRelQtdPedidoComprador},
  UntRelQtdPedidoVenda in 'UntRelQtdPedidoVenda.pas' {FrmRelQtdPedidoVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'LOJA2M';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TD, D);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmRelUsuario, FrmRelUsuario);
  Application.CreateForm(TFrmRelQtdPedidoComprador, FrmRelQtdPedidoComprador);
  Application.CreateForm(TFrmRelQtdPedidoVenda, FrmRelQtdPedidoVenda);
  Application.Run;
end.

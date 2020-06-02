unit UntRelCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntRelPadrao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportRTF, frxExportImage,
  frxExportHTML, frxExportCSV, frxExportText, frxExportPDF, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Dados;

type
  TFrmRelCompra = class(TFrmRelPadrao)
    Pedido: TFDQuery;
    Pedidopec_codigo: TFDAutoIncField;
    Pedidopec_data: TDateField;
    PedidoPec_Baixa: TDateField;
    PedidoPec_Fornecedor: TIntegerField;
    PedidoPec_Comprador: TIntegerField;
    PedidoStatus: TStringField;
    PedidoPec_ValorTotal: TBCDField;
    PedidoPec_ValorDesconto: TBCDField;
    PedidoPec_ValorProduto: TBCDField;
    PedidoCompradorNome: TStringField;
    PedidoFornecedorNome: TStringField;
    Qpci_pedidocompra: TIntegerField;
    Qpci_produto: TIntegerField;
    Qpro_descricao: TStringField;
    Qpci_precounitario: TBCDField;
    Qpci_quantidade: TBCDField;
    Qpci_valortotal: TBCDField;
    Item: TFDQuery;
    Itempci_pedidocompra: TIntegerField;
    Itempci_produto: TIntegerField;
    Itempro_descricao: TStringField;
    Itempci_precounitario: TBCDField;
    Itempci_quantidade: TBCDField;
    Itempci_valortotal: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCompra: TFrmRelCompra;

implementation

{$R *.dfm}

end.

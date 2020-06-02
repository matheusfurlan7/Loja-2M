unit UntRelVenda;

interface

uses UntRelPadrao2, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxChart, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportRTF, frxExportImage,
  frxExportHTML, frxExportCSV, frxExportText, frxExportPDF, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Controls, Vcl.StdCtrls, System.Classes, Vcl.ExtCtrls;

type
  TFrmRelVenda = class(TFrmRelPadrao2)
    Pedido: TFDQuery;
    Pedidopev_codigo: TFDAutoIncField;
    Pedidopev_data: TDateField;
    PedidoPev_Baixa: TDateField;
    PedidoPev_Cliente: TIntegerField;
    PedidoPev_Vendedor: TIntegerField;
    PedidoStatus: TStringField;
    PedidoPev_ValorTotal: TBCDField;
    PedidoPev_ValorDesconto: TBCDField;
    PedidoPev_ValorProduto: TBCDField;
    PedidoClienteNome: TStringField;
    PedidoVendedorNome: TStringField;
    Q: TFDQuery;
    Qpvi_pedidovenda: TIntegerField;
    Qpvi_produto: TIntegerField;
    Qpro_descricao: TStringField;
    Qpvi_precounitario: TBCDField;
    Qpvi_quantidade: TBCDField;
    Qpvi_valortotal: TBCDField;
    DS: TDataSource;
    DBITEM: TfrxDBDataset;
    DBDS: TfrxDBDataset;
    Qpvi_codigo: TIntegerField;
    Item: TFDQuery;
    Itempvi_pedidovenda: TIntegerField;
    Itempvi_codigo: TIntegerField;
    Itempvi_produto: TIntegerField;
    Itempro_descricao: TStringField;
    Itempvi_precounitario: TBCDField;
    Itempvi_quantidade: TBCDField;
    Itempvi_valortotal: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVenda: TFrmRelVenda;

implementation

{$R *.dfm}

end.

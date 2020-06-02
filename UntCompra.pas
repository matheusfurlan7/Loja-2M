unit UntCompra;

interface

uses
  FireDAC.Comp.Client;

type TCompra = Class
  private
    Q: TFDQuery;
    procedure CarregaQuery;
  public
    procedure ExcluirPedido(nCodigo: Integer; isEstorno: Boolean = False);
    procedure BaixarPedido(nCodigo: Integer);
    procedure ConsultarPedido(nCodigo: Integer);
    procedure ImprimirCompra(Sql: String);
end;

var Compra: TCompra;

implementation

uses Dados, UntEstoque, UntCadPedidoCompra, Rotina, UntRelCompra,
     Vcl.Forms, System.UITypes, Winapi.Windows, System.SysUtils;

Const
   SelecionaItens = 'select * from PedidoCompraItem where Pci_PedidoCompra=';
   SelecionaPedido = 'select * from PedidoCompra where pec_Codigo=';
   DeletaPedido = 'delete from PedidoCompra where Pec_codigo=';
   DeletaItens = 'delete from PedidoCompraItem where Pci_PedidoCompra=';

procedure TCompra.ExcluirPedido(nCodigo: Integer; isEstorno: Boolean = False);
var cMsg: String;
    nRes: Integer;
    isOk: Boolean;
begin
   if isEstorno then cMsg := 'Confirma o estorno desse registro?'
   else cMsg := 'Confirma a exclusão desse registro?';

   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if nRes = IDYES then begin
     CarregaQuery;
     isOk := True;

     if (D.GetSQuery('Pec_Status',SelecionaPedido+IntToStr(nCodigo)) = 'B') then begin
        if not isEstorno then begin
           isOk := False;
           Beep;
           Application.MessageBox('Operação invalida! Pedido de Compra já se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
        end;
     end else begin
        if isEstorno then begin
           isOk := False;
           Beep;
           Application.MessageBox('Operação invalida! Pedido de Compra não se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
        end;
     end;

     if isOk then begin

        D.Transaction;

        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add(SelecionaItens+IntToStr(nCodigo));
        Q.Open;

        Q.First;
        while not Q.Eof do begin
           if isEstorno then begin
              Estoque.AdicionaEncomenda(Q.FieldByName('Pci_Produto').AsInteger,Q.FieldByName('Pci_Quantidade').AsFloat);
              Estoque.MovimentaSaldo(Q.FieldByName('Pci_Produto').AsInteger,Q.FieldByName('Pci_Quantidade').AsFloat,Date,'Saida');
           end else begin
              Estoque.RenoveEncomenda(Q.FieldByName('Pci_Produto').AsInteger,Q.FieldByName('Pci_Quantidade').AsFloat);
           end;

           Q.Next;
        end;

        Q.Close;
        Q.Sql.Clear;
        if isEstorno then begin
           Q.SQL.Add('update PedidoCompra set pec_baixa = null,pec_status = ''P'' where pec_codigo = '+IntToStr(nCodigo));
           Q.SQL.Add(';update PedidoCompraItem set pci_baixa = null,pci_status = ''P'' where pci_codigo = '+IntToStr(nCodigo));
        end else begin
           Q.SQL.Add(DeletaPedido+IntToStr(nCodigo));
           Q.SQL.Add(DeletaItens+IntToStr(nCodigo));
        end;
        Q.ExecSQL;

        D.Commit;

        Q.Close;

        if isEstorno then cMsg := 'O registro foi estornado com sucesso.'
        else cMsg := 'O registro foi excluido com sucesso.';

        Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     end;
  end else begin
    if isEstorno then cMsg := 'O estorno do registro foi abortada.'
    else cMsg := 'A exclusão do registro foi abortada.';

    Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TCompra.BaixarPedido(nCodigo: Integer);
var cMsg: String;
    nRes: Integer;
    isOk: Boolean;
begin
   cMsg := 'Confirma a baixa desse registro?';
   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if nRes = IDYES then begin
     CarregaQuery;
     isOk := True;

     if (D.GetSQuery('Pec_Status',SelecionaPedido+IntToStr(nCodigo)) = 'B') then begin
        isOk := False;
        Beep;
        Application.MessageBox('Operação invalida! Pedido de Compra já se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
     end;

     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add(SelecionaItens+IntToStr(nCodigo));
     Q.Open;

     if (Q.RecordCount = 0) then begin
        isOk := False;
        Beep;
        Application.MessageBox('Operação invalida! Pedido de Compra sem item!','Aviso',MB_OK + MB_ICONINFORMATION);
     end;

     if isOk then begin

        D.Transaction;

        Q.First;
        while not Q.Eof do begin
           Estoque.RenoveEncomenda(Q.FieldByName('Pci_Produto').AsInteger,Q.FieldByName('Pci_Quantidade').AsFloat);
           Estoque.MovimentaSaldo(Q.FieldByName('Pci_Produto').AsInteger,Q.FieldByName('Pci_Quantidade').AsFloat,Date,'Entrada');

           Q.Next;
        end;

        Q.SQL.Clear;
        Q.SQL.Add('update PedidoCompra set pec_baixa ='+GetSqlDate(date)+',pec_status = ''B'' where pec_codigo = '+IntToStr(nCodigo));
        Q.SQL.Add(';update PedidoCompraItem set pci_baixa ='+GetSqlDate(date)+',pci_status = ''B'' where pci_codigo = '+IntToStr(nCodigo));
        Q.ExecSQL;

        D.Commit;

        cMsg := 'O registro foi baixado com sucesso.';
        Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
     end;

     Q.Close;
  end else begin
     cMsg := 'A baixa do registro foi abortada.';
     Application.MessageBox(PChar(cMsg),'Informação',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TCompra.CarregaQuery;
begin
    if Q = nil then begin
       Q := TFDQuery.Create(nil);
       Q.Connection := D.FDCon;
    end;
end;

procedure TCompra.ConsultarPedido(nCodigo: Integer);
begin
   FrmCadPedidoCompra := TFrmCadPedidoCompra.Create(Application);
   try
      FrmCadPedidoCompra.FDT.FindKey([nCodigo]);
      FrmCadPedidoCompra.ShowModal;
   finally
      FreeAndNil(FrmCadPedidoCompra);
   end;
end;

procedure TCompra.ImprimirCompra(Sql: String);
begin
   FrmRelCompra := TFrmRelCompra.Create(Nil);
   try
       FrmRelCompra.Pedido.SQL.Add(Sql);
       FrmRelCompra.btn_imprimirClick(Nil);
   finally
      FreeAndNil(FrmRelCompra);
   end;
end;

initialization
   Compra := TCompra.Create;
finalization
   Compra.Free;
end.

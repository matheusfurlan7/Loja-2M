unit UntVenda;

interface

uses
  FireDAC.Comp.Client;

type TVenda = Class
  private
    Q: TFDQuery;
    procedure CarregaQuery;
  public
    procedure ExcluirPedido(nCodigo: Integer; isEstorno: Boolean = False);
    procedure BaixarPedido(nCodigo: Integer);
    procedure ConsultarPedido(nCodigo: Integer);
    procedure ImprimirVenda(Sql: String);
end;

var Venda: TVenda;

implementation

uses Dados, UntEstoque, UntCadPedidoVenda, Rotina, UntRelVenda,
     Vcl.Forms, System.UITypes, Winapi.Windows, System.SysUtils;

Const
   SelecionaItens = 'select * from PedidoVendaItem where Pvi_PedidoVenda=';
   SelecionaPedido = 'select * from pedidovenda where pev_Codigo=';
   DeletaPedido = 'delete from pedidovenda where Pev_codigo=';
   DeletaItens = 'delete from PedidoVendaItem where Pvi_PedidoVenda=';

procedure TVenda.ExcluirPedido(nCodigo: Integer; isEstorno: Boolean = False);
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

     if (D.GetSQuery('Pev_Status',SelecionaPedido+IntToStr(nCodigo)) = 'B') then begin
        if not isEstorno then begin
           isOk := False;
           Beep;
           Application.MessageBox('Operação invalida! Pedido de venda já se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
        end;
     end else begin
        if isEstorno then begin
           isOk := False;
           Beep;
           Application.MessageBox('Operação invalida! Pedido de venda não se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
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
              Estoque.AdicionaReserva(Q.FieldByName('Pvi_Produto').AsInteger,Q.FieldByName('Pvi_Quantidade').AsFloat);
              Estoque.MovimentaSaldo(Q.FieldByName('Pvi_Produto').AsInteger,Q.FieldByName('Pvi_Quantidade').AsFloat,Date,'Entrada');
           end else begin
              Estoque.RenoveReserva(Q.FieldByName('Pvi_Produto').AsInteger,Q.FieldByName('Pvi_Quantidade').AsFloat);
           end;

           Q.Next;
        end;

        Q.Close;
        Q.Sql.Clear;
        if isEstorno then begin
           Q.SQL.Add('update pedidovenda set pev_baixa = null,pev_status = ''P'' where pev_codigo = '+IntToStr(nCodigo));
           Q.SQL.Add(';update PedidoVendaItem set pvi_baixa = null,pvi_status = ''P'' where pvi_codigo = '+IntToStr(nCodigo));
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

procedure TVenda.BaixarPedido(nCodigo: Integer);
var cMsg: String;
    nRes: Integer;
    isOk: Boolean;
begin
   cMsg := 'Confirma a baixa desse registro?';
   nRes := Application.MessageBox(PChar(cMsg),'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if nRes = IDYES then begin
     CarregaQuery;
     isOk := True;

     if (D.GetSQuery('Pev_Status',SelecionaPedido+IntToStr(nCodigo)) = 'B') then begin
        isOk := False;
        Beep;
        Application.MessageBox('Operação invalida! Pedido de venda já se encontra baixado!','Aviso',MB_OK + MB_ICONINFORMATION);
     end;

     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add(SelecionaItens+IntToStr(nCodigo));
     Q.Open;

     if (Q.RecordCount = 0) then begin
        isOk := False;
        Beep;
        Application.MessageBox('Operação invalida! Pedido de venda sem item!','Aviso',MB_OK + MB_ICONINFORMATION);
     end;

     if isOk then begin

        D.Transaction;

        Q.First;
        while not Q.Eof do begin
           Estoque.RenoveReserva(Q.FieldByName('Pvi_Produto').AsInteger,Q.FieldByName('Pvi_Quantidade').AsFloat);
           Estoque.MovimentaSaldo(Q.FieldByName('Pvi_Produto').AsInteger,Q.FieldByName('Pvi_Quantidade').AsFloat,Date,'Saida');

           Q.Next;
        end;

        Q.SQL.Clear;
        Q.SQL.Add('update pedidovenda set pev_baixa = '+GetSqlDate(date)+',pev_status = ''B'' where pev_codigo = '+IntToStr(nCodigo));
        Q.SQL.Add(';update PedidoVendaItem set pvi_baixa ='+GetSqlDate(date)+',pvi_status = ''B'' where pvi_codigo = '+IntToStr(nCodigo));
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

procedure TVenda.CarregaQuery;
begin
    if Q = nil then begin
       Q := TFDQuery.Create(nil);
       Q.Connection := D.FDCon;
    end;
end;

procedure TVenda.ConsultarPedido(nCodigo: Integer);
begin
   FrmCadPedidoVenda := TFrmCadPedidoVenda.Create(Application);
   try
      FrmCadPedidoVenda.FDT.FindKey([nCodigo]);
      FrmCadPedidoVenda.ShowModal;
   finally
      FreeAndNil(FrmCadPedidoVenda);
   end;
end;

procedure TVenda.ImprimirVenda(Sql: String);
begin
   FrmRelVenda := TFrmRelVenda.Create(Nil);
   try
       FrmRelVenda.Pedido.SQL.Add(Sql);
       FrmRelVenda.btn_imprimirClick(Nil);
   finally
      FreeAndNil(FrmRelVenda);
   end;
end;

initialization
   Venda := TVenda.Create;
finalization
   Venda.Free;
end.

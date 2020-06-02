unit UntEstoque;

interface

uses Winapi.Windows;

type
  TEstoque = Class
  public
    function GetSequencia(nProduto: Integer; dData: TDateTime): Integer;
    procedure ProcessaSaldo(Pro: Integer; Dat: TDateTime; Seq: Integer);
    function ProdutoControlaEstoque(nProduto: Integer): Boolean;
    procedure MovimentaSaldo(nProduto: Integer; nQuantidade: Real; dData: TDateTime; cTipoDeMovimento: String);
    procedure AdicionaReserva(nProduto: Integer; nQuantidade: Real; isRenove: Boolean = False);
    procedure RenoveReserva(nProduto: Integer; nQuantidade: Real);
    procedure AdicionaEncomenda(nProduto: Integer; nQuantidade: Real; isRenove: Boolean = False);
    procedure RenoveEncomenda(nProduto: Integer; nQuantidade: Real);
end;

var Estoque: TEstoque;

implementation

uses Dados, Rotina, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Intf, System.Classes;

procedure TEstoque.AdicionaReserva(nProduto: Integer; nQuantidade: Real; isRenove: Boolean = False);
begin
    if nProduto = 0 then begin
       Beep;
       raise Exception.Create('É preciso informar o produto!');
    end;

    if not ProdutoControlaEstoque(nProduto) then begin
      Exit;
    end;

    if nQuantidade = 0 then begin
       Beep;
       raise Exception.Create('É preciso informar a quantidade!');
    end;

    if isRenove then begin
       nQuantidade := nQuantidade * -1;
    end;

    D.TSal.Open;
    try
       if D.TSal.FindKey([nProduto]) then begin
          if (D.TSalSal_Reserva.asFloat + nQuantidade < 0) then begin
              Beep;
              Raise Exception.Create('A reserva do produto ' + IntToStr(nProduto) + ' não pode ser negativa!');
          end;

          D.TSal.Edit;
          D.TsalSal_Reserva.asFloat :=  D.TSalSal_Reserva.asFloat + nQuantidade;
          D.TSal.Post;
       end else begin
          D.TSal.Append;
          D.TSalSal_Produto.AsInteger := nProduto;
          D.TsalSal_Reserva.asFloat :=  D.TSalSal_Reserva.asFloat + nQuantidade;
          D.TSal.Post;
       end;
    finally
       D.TSal.Close;
    end;
end;

procedure TEstoque.RenoveReserva(nProduto: Integer; nQuantidade: Real);
begin
   AdicionaReserva(nProduto,nQuantidade,True);
end;

procedure TEstoque.AdicionaEncomenda(nProduto: Integer; nQuantidade: Real; isRenove: Boolean = False);
begin
    if nProduto = 0 then begin
       Beep;
       raise Exception.Create('É preciso informar o produto!');
    end;

    if not ProdutoControlaEstoque(nProduto) then begin
      Exit;
    end;

    if nQuantidade = 0 then begin
       Beep;
       raise Exception.Create('É preciso informar a quantidade!');
    end;

    if isRenove then begin
       nQuantidade := nQuantidade * -1;
    end;

    D.TSal.Open;
    try
       if D.TSal.FindKey([nProduto]) then begin
          if (D.TSalSal_Encomenda.asFloat + nQuantidade < 0) then begin
              Beep;
              Raise Exception.Create('A encomenda do produto '+ IntToStr(nProduto) +' não pode ser negativa!');
          end;

          D.TSal.Edit;
          D.TsalSal_Encomenda.asFloat :=  D.TsalSal_Encomenda.asFloat + nQuantidade;
          D.TSal.Post;
       end else begin
          D.TSal.Append;
          D.TSalSal_Produto.AsInteger := nProduto;
          D.TsalSal_Encomenda.asFloat :=  D.TsalSal_Encomenda.asFloat + nQuantidade;
          D.TSal.Post;
       end;
    finally
       D.TSal.Close;
    end;
end;

procedure TEstoque.RenoveEncomenda(nProduto: Integer; nQuantidade: Real);
begin
    AdicionaEncomenda(nProduto,nQuantidade,True);
end;

function TEstoque.GetSequencia(nProduto: Integer;dData: TDateTime): Integer;
var Query: TFDQuery;
begin
   Query := TFDQuery.Create(nil);
   Query.Connection := D.FDCon;

   Query.SQL.Clear;
   Query.SQL.Add('select * from movimento');
   Query.SQL.Add('where mov_produto = '+IntToStr(nProduto));
   Query.Sql.Add('and cast(mov_data as date) = '+GetSqlDate(dData));

   Query.Open;
   Query.Last;

   Result := Query.FieldByName('Mov_Sequencia').AsInteger + 1;

   Query.Close;
   Query.Free;
end;

procedure TEstoque.MovimentaSaldo(nProduto: Integer; nQuantidade: Real; dData: TDateTime; cTipoDeMovimento: String);
var isTran: Boolean;
begin
   if nProduto = 0 then begin
      Beep;
      raise Exception.Create('É preciso informar o produto!');
   end;

   if not ProdutoControlaEstoque(nProduto) then begin
      Exit;
   end;

   if dData = 0 then begin
      Beep;
      raise Exception.Create('É preciso informar a Data!');
   end;

   if nQuantidade = 0 then begin
       Beep;
       raise Exception.Create('É preciso informar a quantidade!');
   end;

   if cTipoDeMovimento = '' then begin
      Beep;
      raise Exception.Create('É preciso informar o tipo de movimento!');
   end;

   if (cTipoDeMovimento <> 'Entrada') and (cTipoDeMovimento <> 'Saida') then begin
      Beep;
      raise Exception.Create('É preciso informar o tipo de movimento!');
   end;

   isTran := False;
   if not FTransacao then begin
      isTran := True;
      D.Transaction;
   end;

   D.TMov.Open;
   try
      D.TMov.Append;
      D.TMovMov_Produto.asInteger := nProduto;
      D.TMovMov_Data.asDateTime := dData;
      D.TMovMov_Sequencia.asInteger := GetSequencia(nProduto,dData);
      D.TMovMov_TipoDeMovimento.asString := cTipoDeMovimento;
      D.TMovMov_Quantidade.asFloat := nQuantidade;
      D.TMov.Post;

      ProcessaSaldo(nProduto,dData,D.TMovMov_Sequencia.asInteger);
   finally
      D.TMov.Close;
   end;

   if isTran then D.Commit;
end;

procedure TEstoque.ProcessaSaldo(Pro: Integer; Dat: TDateTime; Seq: Integer);
var nSal: Real;
    nQtd: Real;
    isDel: Boolean;
    cIndex: String;
    I: Integer;
begin
   D.TSal.Open;
   try
      cIndex := '';
      For I := 0 to (D.TMov.Indexes.Count-1) do begin
         if soPrimary in D.TMov.Indexes.Items[I].Options then begin
             cIndex := D.TMov.Indexes[I].Name;
             break;
         end;
      end;

      D.TMov.IndexName := cIndex;


      if not D.TMov.FindKey([Pro,Dat,Seq]) then begin
         Beep;
         raise Exception.Create('Não foi possivel encontrar o registro (ProcessaSaldo)');
      end;
      D.TMov.Prior;

      if (D.TMovMov_Produto.asInteger = Pro) and (not D.TMov.Bof) then begin
         nSal := D.TMovMov_SaldoAtual.asFloat;
      end else begin
         nSal := 0;
      end;

      if not D.TMov.Bof then begin
         D.TMov.Next;
      end;

      while (not D.TMov.Eof) and (D.TMovMov_Produto.asInteger = Pro) do begin
        D.TMov.Edit;
        D.TMovMov_SaldoAnterior.asFloat := nSal;

        if (D.TMovMov_TipoDeMovimento.asString = 'Entrada') then begin
           nQtd := D.TMovMov_SaldoAnterior.asFloat + D.TMovMov_Quantidade.asFloat;
        end else begin
           nQtd := D.TMovMov_SaldoAnterior.asFloat - D.TMovMov_Quantidade.asFloat;
        end;

        if nQtd < 0 then begin
           Beep;
           raise Exception.Create('O saldo do produto '+ IntToStr(Pro) +' não pode ser negativa');
        end;

        D.TMovMov_SaldoAtual.asFloat := nQtd;
        D.TMov.Post;
        nSal := D.TMovMov_SaldoAtual.asFloat;

        D.TMov.Next;
      end;

      if D.TSal.FindKey([Pro]) then begin
         D.TSal.Edit;
         D.TSalSal_Saldo.asFloat := nSal;
         D.TSal.Post;
      end else begin
         D.TSal.Append;
         D.TSalSal_Produto.asInteger := Pro;
         D.TSalSal_Saldo.asFloat := nSal;
         D.TSal.Post;
      end;

      isDel := True;
      isDel := isDel and (D.TSalSal_Saldo.asInteger = 0);
      isDel := isDel and (D.TSalSal_Reserva.asInteger = 0);
      isDel := isDel and (D.TSalSal_Encomenda.asInteger = 0);

      if isDel then begin
         D.TSal.Delete;
      end;
      
   finally
      D.TSal.Close;
   end;
end;

function TEstoque.ProdutoControlaEstoque(nProduto: Integer): Boolean;
var cSql: String;
begin
   Result := False;
   cSql := 'select pro_controlaEstoque from produto where pro_codigo = '+InTToStr(nProduto);
   if D.GetSQuery('Pro_ControlaEstoque',cSql) = 'Sim' then begin
      Result := True;
   end;
end;

initialization
   Estoque := TEstoque.Create;
finalization
   Estoque.Free;
end.

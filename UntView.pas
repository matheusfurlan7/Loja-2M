unit UntView;

interface

uses View;

procedure VPais(MV: TView);
procedure VEstado(MV: TView;nPais: Integer);
procedure VCidade(MV: TView;nPais: Integer;cEst: String);
procedure VGrupo(MV: TView);
procedure VUnidade(MV: TView);
procedure VPerfil(MV: TView);
procedure VProduto(MV: TView);
procedure VPessoa(MV: TView; Tipo: String);

implementation

uses
  System.SysUtils;

procedure VPais(MV: TView);
begin
   with MV do begin
      cTitle := 'País';

      KeyField := 'Pai_Codigo';
      ListField := 'Pai_Nome';

      SqlShow := 'select pai_codigo,pai_nome from pais';
      SqlValid := 'select * from pais where pai_codigo=:1';

      Clear;
      Add('Pai_Codigo;Código');
      Add('Pai_Nome;Nome');
   end;
end;

procedure VEstado(MV: TView;nPais: Integer);
begin
   with MV do begin
      cTitle := 'Estado';

      KeyField := 'Est_Estado';
      ListField := 'Est_Estado';

      SqlShow := 'select Est_Estado,Est_Cidade from Estado where Est_Pais = '+IntToStr(nPais);
      SqlValid := 'select * from Estado where Est_Pais = '+IntToStr(nPais) + ' and Est_Estado = '':1'' ';

      Clear;
      Add('Est_Estado;Sigla');
      Add('Est_Cidade;Estado');
   end;
end;

procedure VCidade(MV: TView;nPais: Integer;cEst: String);
begin
   with MV do begin
      cTitle := 'Cidade';

      KeyField := 'Cid_Cidade';
      ListField := 'Cid_Cidade';

      SqlShow := 'select Cid_Cidade from Cidade where Cid_Pais = '+IntToStr(nPais)+' and Cid_Estado = '+QuotedStr(cEst);
      SqlValid := 'select * from Cidade where Cid_Pais = '+IntToStr(nPais)+' and Cid_Estado = '+QuotedStr(cEst)+' and Cid_Cidade = '':1'' ';

      Clear;
      Add('Cid_Cidade;Cidade');
   end;
end;

procedure VGrupo(MV: TView);
begin
   with MV do begin
      cTitle := 'Grupo';

      KeyField := 'Gru_Codigo';
      ListField := 'Gru_Descricao';

      SqlShow := 'select Gru_Codigo,Gru_Descricao from Grupo';
      SqlValid := 'select * from Grupo where Gru_Codigo = :1 ';

      Clear;
      Add('Gru_Codigo;Código');
      Add('Gru_Descricao;Descrição');
   end;
end;

procedure VUnidade(MV: TView);
begin
   with MV do begin
      cTitle := 'Unidade';

      KeyField := 'Uni_Unidade';
      ListField := 'Uni_Descricao';

      SqlShow := 'select Uni_Unidade,Uni_Descricao from Unidade';
      SqlValid := 'select * from Unidade where Uni_Unidade = '':1'' ';

      Clear;
      Add('Uni_Unidade;Unidade');
      Add('Uni_Descricao;Descrição');
   end;
end;

procedure VPerfil(MV: TView);
begin
   with MV do begin
      cTitle := 'Perfil';

      KeyField := 'Per_Codigo';
      ListField := 'Per_Descricao';

      SqlShow := 'select Per_Codigo,Per_Descricao from Perfil where Per_Status = ''S'' ';
      SqlValid := 'select * from Perfil where Per_Codigo = :1 and Per_Status = ''S'' ';

      Clear;
      Add('Per_Codigo;Código');
      Add('Per_Descricao;Descrição');
   end;
end;

procedure VProduto(MV: TView);
begin
   with MV do begin
      cTitle := 'Produto';

      KeyField := 'Pro_Codigo';
      ListField := 'Pro_Descricao';

      SqlShow := 'select pro_codigo,pro_descricao from produto where pro_situacao = ''Ativo''';
      SqlValid := 'select pro_codigo,pro_descricao from produto where pro_situacao = ''Ativo'' and pro_codigo=:1';

      Clear;
      Add('pro_codigo;Código');
      Add('pro_descricao;Descrição');
   end;
end;

procedure VPessoa(MV: TView; Tipo: String);
begin
   with MV do begin
      cTitle := Tipo;

      KeyField := 'pes_codigo';
      ListField := 'pes_nome';


      SqlShow := 'select pes_codigo,pes_nome from pessoa where pes_situacao = ''Ativo'' ';
      SqlValid := 'select pes_codigo,pes_nome from pessoa where pes_situacao = ''Ativo'' and pes_codigo=:1';


      if Tipo = 'Cliente' then begin
         SqlShow  :=  SqlShow + ' and Pes_Cliente = ''Sim'' ';
         SqlValid := SqlValid + ' and Pes_Cliente = ''Sim'' ';
      end else if Tipo = 'Vendedor' then begin
         SqlShow  :=  SqlShow + ' and Pes_Vendedor = ''Sim'' ';
         SqlValid := SqlValid + ' and Pes_Vendedor = ''Sim'' ';
      end else if Tipo = 'Fornecedor' then begin
         SqlShow  :=  SqlShow + ' and Pes_Fornecedor = ''Sim'' ';
         SqlValid := SqlValid + ' and Pes_Fornecedor = ''Sim'' ';
      end else if Tipo = 'Comprador' then begin
         SqlShow  :=  SqlShow + ' and Pes_Comprador = ''Sim'' ';
         SqlValid := SqlValid + ' and Pes_Comprador = ''Sim'' ';
      end;

      Clear;
      Add('pes_codigo;Código');
      Add('pes_nome;Nome');
   end;
end;

end.

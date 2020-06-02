unit Dados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Data.FMTBcd,
  Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TD = class(TDataModule)
    FDTrans: TFDTransaction;
    FDCon: TFDConnection;
    TMov: TFDTable;
    TSal: TFDTable;
    DSMov: TDataSource;
    DSSal: TDataSource;
    TSalSal_Produto: TIntegerField;
    TSalSal_Reserva: TBCDField;
    TSalSal_Encomenda: TBCDField;
    TSalSal_Saldo: TBCDField;
    Q: TFDQuery;
    TMovMov_Produto: TIntegerField;
    TMovMov_Data: TDateField;
    TMovMov_Sequencia: TIntegerField;
    TMovMov_TipoDeMovimento: TStringField;
    TMovMov_SaldoAnterior: TBCDField;
    TMovMov_SaldoAtual: TBCDField;
    TMovMov_Quantidade: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Transaction;
    procedure Commit;
    procedure RollBack;
    function ExecSql(cSql: String): Boolean;
    function GetFQuery(cFiel, cSql: String): Real;
    function GetSQuery(cFiel, cSql: String): String;
    function GetIQuery(cFiel, cSql: String): Integer;
    function GetILastQuery(cFiel, cSql: String): Integer;
  end;

var
  D: TD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Rotina, Vcl.Forms, Vcl.Dialogs, IniFiles, IWSystem;

procedure TD.Transaction;
begin
   if FTransacao then begin
      raise Exception.Create('Sistema se encontra em transação no momento');
   end;

   if FTransacao = False then begin
      FTransacao := True;
      FDTrans.StartTransaction;
   end;
end;

procedure TD.Commit;
begin
   if FTransacao then begin
      FDTrans.Commit;
      FTransacao := False;
   end;
end;

procedure TD.DataModuleCreate(Sender: TObject);
var
  Arquivo: String;

  function LerIni(Chave1, Chave2: String; ValorPadrao: String = ''): String;
  var
    FileIni: TIniFile;
  begin
    result := ValorPadrao;
    try
      FileIni := TIniFile.Create(Arquivo);
      if FileExists(Arquivo) then
        result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
    finally
      FreeAndNil(FileIni)
    end;
  end;

begin
  Arquivo := gsAppPath + gsAppName + '.ini';
  try
    with FDCon do
      begin
        Params.Clear;
        Params.Values['DriverID'] := 'MSSQL';
        Params.Values['Server'] := LerIni('SQLSERVER','Server');
        Params.Values['OSAuthent'] := 'Yes';
        Params.Values['ApplicationName'] := 'Enterprise/Architect/Ultimate';
        Params.Values['DATABASE'] := LerIni('SQLSERVER','Database');
        Params.Values['MARS'] := 'yes';
        Connected := True;
      end;
  except
      ShowMessage('Ocorreu uma Falha na configuração no Banco SQL Server!');
      Application.Terminate;
  end;
end;

procedure TD.RollBack;
begin
   if FTransacao then begin
      FDTrans.Rollback;
      FTransacao := False;
   end;
end;

function TD.GetFQuery(cFiel,cSql: String): Real;
begin
   Q.SQl.Clear;
   Q.Sql.Add(cSql);
   Q.Open;

   Result := Q.FieldByName(cFiel).asFloat;
end;

function TD.GetSQuery(cFiel,cSql: String): String;
begin
   Result := '';
   Q.SQl.Clear;
   Q.Sql.Add(cSql);
   Q.Open;

   Result := Q.FieldByName(cFiel).asString;
end;

function TD.GetILastQuery(cFiel, cSql: String): Integer;
begin
   Q.SQl.Clear;
   Q.Sql.Add(cSql);
   Q.Open;
   Q.Last;

   Result := Q.FieldByName(cFiel).asInteger;
end;

function TD.GetIQuery(cFiel,cSql: String): Integer;
begin
   Q.SQl.Clear;
   Q.Sql.Add(cSql);
   Q.Open;

   Result := Q.FieldByName(cFiel).asInteger;
end;

function TD.ExecSql(cSql: String): Boolean;
begin
   Q.SQl.Clear;
   Q.Sql.Add(cSql);
   try
     Q.ExecSQL;
     Result := True;
   except on E: Exception do
     Result := False;
   end;
end;

end.

unit Rotina;

interface

uses Vcl.Controls, FireDAC.Comp.Client, Vcl.DBGrids, System.Types,
  Vcl.Graphics, Data.DB, Vcl.Grids;

type TCH = Class(TControl)
  public
  property Color;
  property Enabled;
end;

procedure CarregaCor(aWC: Array of  TControl);
function GetDireitoMenu(Menu,Direito: String): Boolean;
function GetDireitoManutencao(Menu,Direito: String): String;
function GetSqlDate(cDat: TDateTime):String;
function Parse(var S: String; Const Char: String): String;
procedure EnabledControls(aWC: Array of  TControl;isEnabled: Boolean; Color: String = 'clwindow');
procedure GetDireitos(var ModoEdicao: String;cAux: String);
procedure DBGridColor(G: TDBGrid; const Rect: TRect;DataCol: Integer; Column: TColumn;
  State: TGridDrawState; xBrush: TColor; xFont: TColor = clBlack);
function isContido(X: String; Comp: Array of String): Boolean;
procedure AjustaData(WC: TControl);
function StrTran(S,Char,Mudar: String): String;
function RemoveMask(Value: String; isTrim: Boolean = False): String;
function GetSqlBetween(Campo: String; dDatIni,dDatFim: TDateTime): String;
function AjustaDataDBEdit(Sender: TField; const Text: string): String;
function FilterTable(Table: TFDTable; DataType: TFieldType; Field, Value: String): Boolean;
procedure ZebraGrid(Grid: TDBGrid; const Rect: TRect; DataCol: Integer;
    Column: TColumn; State: TGridDrawState; var IsZebra: Boolean; CorImpar: TColor = clWindow; CorPar: TColor = clSilver);
procedure CorTitulo(Grid: TDBGrid);
procedure Concatena(var Variavel: String; Value,Concantenacao: String);

type TG = class(TDBGrid);

var
  FTransacao: Boolean;
  FCreate: Boolean;
  FColorSystem: String;
  FColorFontSystem: String;

implementation

uses
  System.SysUtils, UntPrincipal, Vcl.Mask, System.DateUtils, Vcl.Forms,
  Winapi.Windows, System.MaskUtils;

procedure Concatena(var Variavel: String; Value,Concantenacao: String);
begin
   if Trim(Variavel) <> '' then begin
      Variavel := Variavel + Concantenacao;
   end;

   Variavel := Variavel + Value;
end;

procedure DBGridColor(G: TDBGrid; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState; xBrush: TColor; xFont: TColor = clBlack);
begin
   G.Canvas.Brush.Color := xBrush;
   G.Canvas.Font.Color := xFont;
   G.Canvas.FillRect(Rect);
   G.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure CarregaCor(aWC: Array of  TControl);
var I: Integer;
begin
   for I := 0 to High(aWC) do begin
      if not (aWC[i].ClassName = 'TCheckBox') then
         TCH(aWC[I]).Color := StringToColor(FColorSystem);
      TCH(aWC[I]).Font.Color := StringToColor(FColorFontSystem);
   end;
end;

procedure EnabledControls(aWC: Array of  TControl;isEnabled: Boolean; Color: String = 'clwindow');
var I: Integer;
begin
   for I := 0 to High(aWC) do begin
      if Color <> '' then TCH(aWC[I]).Color := StringToColor(Color);
      TCH(aWC[I]).Enabled := isEnabled;
   end;
end;

// Separa a string pelo caracter informado
//////////////////////////////////////////
function Parse(var S: String; Const Char: String): String;
var
  nPos: Integer;
begin
  nPos := Pos(Char, S);
  if ( nPos > 0) then begin
      Result := Copy(S,1,nPos-1);
      S := Copy(S,nPos+1,Length(S)-nPos);
  end else begin
      Result := S;
      S := '';
  end;
end;

function GetDireitoManutencao(Menu,Direito: String): String;
begin
    if Pos(AnsiUpperCase(';'+Menu+'=S;'),AnsiUpperCase(Direito)) > 0 then begin
       Result := 'S';
    end else begin
       Result := 'N';
    end;
end;

function GetDireitoMenu(Menu,Direito: String): Boolean;
begin
    if Pos(AnsiUpperCase(';'+Menu+'=S;'),AnsiUpperCase(Direito)) > 0 then begin
       Result := True;
    end else begin
       Result := False;
    end;
end;

function GetSqlDate(cDat: TDateTime):String;
begin
   Result := QuotedStr(FormatDateTime('YYYY-MM-DD',cDat));
end;

procedure GetDireitos(var ModoEdicao: String;cAux: String);
var Direito: String;
begin
   Direito := FrmPrincipal.UsuarioPer_Direitos.asString;
   ModoEdicao := '';
   while cAux <> '' do begin
       ModoEdicao := ModoEdicao + GetDireitoManutencao(Parse(cAux,';'),Direito);
   end;
end;

procedure AjustaData(WC: TControl);
var isMaskDate: Boolean;
    cEditMask: String;
    Retorno: String;
begin
  if WC.ClassName = 'TMaskEdit' then begin
     Retorno := RemoveMask(TMaskEdit(WC).Text,True);

     if (Retorno = '') then begin
        Exit;
     end;

     cEditMask := TMaskEdit(WC).EditMask;
     isMaskDate := (Pos('99/99/9999',cEditMask) > 0);
     if isMaskDate then begin

        if Length(Retorno) = 2 then begin
           Retorno := Retorno + FormatDateTime('mmyyyyy',Date);
        end;

        if Length(Retorno) = 4 then begin
           Retorno := Retorno + FormatDateTime('yyyyy',Date);
        end;

        if Length(Retorno) = 6 then begin
           Retorno := Copy(Retorno,1,4) + '20' + Copy(Retorno,4,2);
        end;

        Retorno := FormatMaskText('00/00/0000;0;',Retorno);
        TMaskEdit(WC).Text := Retorno;

        try
           StrToDate(Retorno);
        except
           Application.MessageBox('A data digitada é invalida!','Aviso',MB_OK + MB_ICONINFORMATION);
           TMaskEdit(WC).Clear;
           TMaskEdit(WC).SetFocus;
           Exit;
        end;

        if StrToDate(Retorno) <= StrToDate('31/12/1899') then begin
           Application.MessageBox('A data digitada é invalida!','Aviso',MB_OK + MB_ICONINFORMATION);
           TMaskEdit(WC).Clear;
           TMaskEdit(WC).SetFocus;
        end;
     end;
  end;
end;

function AjustaDataDBEdit(Sender: TField; const Text: string): String;
var Retorno: String;
begin
   Retorno := Text;

   if (Retorno = '') then begin
      Exit;
   end;

   if (Retorno = '  /  /    ') then begin
      Sender.Clear;
      Exit;
   end;

   Retorno := RemoveMask(Retorno,True);

   if Length(Retorno) = 2 then begin
      Retorno := Retorno + FormatDateTime('mmyyyyy',Date);
   end;

   if Length(Retorno) = 4 then begin
      Retorno := Retorno + FormatDateTime('yyyyy',Date);
   end;

   if Length(Retorno) = 6 then begin
      Retorno := Copy(Retorno,1,4) + '20' + Copy(Retorno,5,2);
   end;

   Retorno := FormatMaskText('00/00/0000;0;',Retorno);

   try
      StrToDate(Retorno);
   except
      Application.MessageBox('A data digitada é invalida!','Aviso',MB_OK + MB_ICONINFORMATION);
      Sender.Clear;
      Sender.FocusControl;
      Exit;
   end;

   if StrToDate(Retorno) <= StrToDate('31/12/1899') then begin
      Application.MessageBox('A data digitada é invalida!','Aviso',MB_OK + MB_ICONINFORMATION);
      Sender.Clear;
      Sender.FocusControl;
      Exit;
   end;

   Sender.asString := Retorno;
end;

function isContido(X: String; Comp: Array of String): Boolean;
var
  nX: Integer;
begin
  Result := False;
  For nX := 0 to High(Comp) do
    if X = Comp[nX] then begin
      Result := True;
      Break;
    end;
end;

function RemoveMask(Value: String; isTrim: Boolean = False): String;
begin
   Value := StrTran(Value,'.','');
   Value := StrTran(Value,'/','');
   Value := StrTran(Value,'-','');
   Value := StrTran(Value,'_','');

   if isTrim then begin
      Value := Trim(Value)
   end;

   Result := Value;
end;

function StrTran(S,Char,Mudar: String): String;
var nPos: Integer;
begin
   Result := S;
   nPos := Pos(Char,Result);
   while nPos <> 0 do begin
      Result := Copy(Result,1,nPos-1) + Mudar+ Copy(Result,nPos+Length(Char),Length(Result)-nPos);
      nPos := Pos(Char,Result);
   end;
end;

function GetSqlBetween(Campo: String; dDatIni,dDatFim: TDateTime): String;
begin
   if (dDatIni > StrToDate('30/12/1899')) and (dDatFim > StrToDate('30/12/1899')) then begin
      Result := '(Cast('+Campo+' as date) Between '+ GetSqlDate(dDatIni)+' and '+ GetSqlDate(dDatFim)+')';
   end else if (dDatIni > StrToDate('31/12/1899')) then begin
      Result := '(Cast('+Campo+' as date) >= '+GetSqlDate(dDatIni)+ ')';
   end else if (dDatFim > StrToDate('31/12/1899')) then begin
      Result := '((Cast('+Campo+' as date) <= '+GetSqlDate(dDatFim)+ ') or (Cast('+Campo+' as date) is null))';
   end;
end;

function FilterTable(Table: TFDTable; DataType: TFieldType; Field, Value: String): Boolean;
var cAux: String;
    isDat: Boolean;
   function GetField(Valor: String): String;
   begin
       Result := '';

       if isDat then begin
          if cAux = '*' then begin
             Application.MessageBox('Não é possivel utilizar o recurso para campo de data!','Aviso',MB_OK);
             Exit;
          end;

          Result := 'Cast(' + Field + ' as date)';
       end;

       if cAux = '*' then begin
          // Contido
          Result :=  Result + '%' + Valor + '%';
       end else if cAux = '=' then begin
          // igual
          Result := Result + '=' + Valor;
       end else if cAux = '!' then begin
          // Diferente
          Result := Result + '<>' + Valor;
       end else if cAux = '>' then begin
          // Maior
          Result := Result + '>' + Valor;
       end else if cAux = '<' then begin
          // Menor
          Result := Result + '<' + Valor;
       end;
   end;

begin
   Result := False;

   cAux := Copy(Value,1,1);

   if not isContido(cAux,['*','=','!','>','<']) then begin
      Exit;
   end;

   Value := Copy(Value,2,Length(Value)-1);
   IsDat := False;
   if DataType = ftString then begin
      Value := QuotedStr(Value);
   end else if DataType in [ftInteger,ftBCD,ftFloat] then begin
      Value := StrTran(Value,'.','');
      Value := StrTran(Value,',','.');
   end else if DataType in [ftDate,ftDateTime] then begin
      IsDat := True;
      Value := StrTran(Value,'/','');
      Value := Copy(Value,5,4) + '-' + Copy(Value,3,2) + '-' + Copy(Value,1,2);
   end;

   Table.Filtered := False;
   Table.Filter := GetField(Value);
   Table.Filtered := True;

   Result := True;
end;

procedure ZebraGrid(Grid: TDBGrid; const Rect: TRect; DataCol: Integer;
    Column: TColumn; State: TGridDrawState; var IsZebra: Boolean; CorImpar: TColor = clWindow; CorPar: TColor = clSilver);

begin
   if (gdSelected in State) then begin
      DBGridColor(Grid,Rect,DataCol,Column,State,clSkyBlue);
   end else if Odd(TG(Grid).DataLink.ActiveRecord) then begin
      DBGridColor(Grid,Rect,DataCol,Column,State, CorImpar );
   end else begin
      DBGridColor(Grid,Rect,DataCol,Column,State,CorPar);
   end;

   if (DataCol = 0) and (TG(Grid).Row = 0) then begin
      Grid.Repaint;
   end;
end;

procedure CorTitulo(Grid: TDBGrid);
begin
   with Grid do begin
      FixedColor := RGB($CC,$CC,$CC);
      DrawingStyle := gdsClassic;
      Options := [dgTitles,dgIndicator{,dgRowLines},dgTabs,dgRowSelect,dgAlwaysShowSelection{,dgConfirmDelete,dgCancelOnExit},dgTitleClick];
   end;
end;

end.

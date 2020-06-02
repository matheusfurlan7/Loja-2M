object FrmConsultaPadrao: TFrmConsultaPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmConsultaPadrao'
  ClientHeight = 211
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PTopo: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Color = 15714450
    ParentBackground = False
    TabOrder = 0
    object LCad: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 92
      Height = 25
      Align = alClient
      Alignment = taCenter
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 173
    Width = 625
    Height = 38
    Align = alBottom
    BorderWidth = 1
    ButtonHeight = 30
    ButtonWidth = 81
    DisabledImages = FrmPrincipal.Black
    EdgeBorders = [ebTop, ebBottom]
    HotImages = FrmPrincipal.Black
    Images = FrmPrincipal.Black
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    object btn_consultar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Consultar registro'
      Caption = 'Consultar'
      ImageIndex = 11
      OnClick = btn_consultarClick
    end
    object btn_Estornar: TToolButton
      Left = 81
      Top = 0
      Hint = 'Estonar registro'
      Caption = 'Estornar'
      ImageIndex = 12
      OnClick = btn_EstornarClick
    end
    object Separador4: TToolButton
      Left = 162
      Top = 0
      Width = 8
      Caption = 'Separador4'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btn_Imprimir: TToolButton
      Left = 170
      Top = 0
      Hint = 'Imprimir Relat'#243'rio'
      Caption = 'Imprimir'
      ImageIndex = 10
      OnClick = btn_ImprimirClick
    end
    object Separador5: TToolButton
      Left = 251
      Top = 0
      Width = 8
      Caption = 'Separador5'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object btn_Sair: TToolButton
      Left = 259
      Top = 0
      Hint = 'Sair'
      Caption = 'Sair'
      ImageIndex = 5
      OnClick = btn_SairClick
    end
  end
  object Grid: TDBGrid
    Left = 0
    Top = 70
    Width = 625
    Height = 103
    Align = alClient
    Ctl3D = True
    DataSource = DS
    GradientEndColor = clSilver
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
    ParentCtl3D = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = GridTitleClick
    Columns = <
      item
        Expanded = False
        Width = 82
        Visible = True
      end>
  end
  object PTop: TPanel
    Left = 0
    Top = 36
    Width = 625
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Color = 15714450
    DragMode = dmAutomatic
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 3
      Top = 7
      Width = 46
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Pesquisar'
      Color = clBtnFace
      ParentBiDiMode = False
      ParentColor = False
    end
    object EPesquisa: TEdit
      Left = 210
      Top = 7
      Width = 387
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      OnChange = EPesquisaChange
    end
    object PColuna: TPanel
      Left = 55
      Top = 7
      Width = 149
      Height = 21
      BevelKind = bkFlat
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Caption = 'Coluna'
      Color = clInfoBk
      ParentBiDiMode = False
      ParentBackground = False
      PopupMenu = PM
      TabOrder = 1
    end
    object Separador1: TRichEdit
      Left = 0
      Top = 0
      Width = 625
      Height = 1
      Align = alTop
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Separador1')
      ParentFont = False
      TabOrder = 2
      Zoom = 100
    end
  end
  object DS: TDataSource
    DataSet = Query
    Left = 371
    Top = 63
  end
  object PM: TPopupMenu
    Left = 429
    Top = 63
  end
  object Query: TFDQuery
    Connection = D.FDCon
    Transaction = D.FDTrans
    Left = 400
    Top = 63
  end
end

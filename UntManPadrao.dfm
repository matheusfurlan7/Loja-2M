object FrmManPadrao: TFrmManPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmManPadrao'
  ClientHeight = 309
  ClientWidth = 645
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
    Width = 645
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
      Width = 129
      Height = 25
      Align = alClient
      Alignment = taCenter
      Caption = 'Manuten'#231#227'o'
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
    Top = 271
    Width = 645
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
    object btn_Inserir: TToolButton
      Left = 0
      Top = 0
      Hint = 'Inserir Registro'
      Caption = 'Inserir'
      ImageIndex = 0
      OnClick = btn_InserirClick
    end
    object btn_Alterar: TToolButton
      Left = 81
      Top = 0
      Hint = 'Alterar Registro'
      Caption = 'Alterar'
      ImageIndex = 2
      OnClick = btn_AlterarClick
    end
    object btn_consultar: TToolButton
      Left = 162
      Top = 0
      Hint = 'Consultar registro'
      Caption = 'Consultar'
      ImageIndex = 11
      OnClick = btn_consultarClick
    end
    object btn_Excluir: TToolButton
      Left = 243
      Top = 0
      Hint = 'Excluir Registro'
      Caption = 'Excluir'
      ImageIndex = 3
      OnClick = btn_ExcluirClick
    end
    object Separador3: TToolButton
      Left = 324
      Top = 0
      Width = 8
      Caption = 'Separador3'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btn_Baixar: TToolButton
      Left = 332
      Top = 0
      Hint = 'Baixar registro'
      Caption = 'Baixar'
      ImageIndex = 4
      OnClick = btn_BaixarClick
    end
    object Separador4: TToolButton
      Left = 413
      Top = 0
      Width = 8
      Caption = 'Separador4'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btn_Imprimir: TToolButton
      Left = 421
      Top = 0
      Hint = 'Imprimir Relat'#243'rio'
      Caption = 'Imprimir'
      ImageIndex = 10
      OnClick = btn_ImprimirClick
    end
    object Separador5: TToolButton
      Left = 502
      Top = 0
      Width = 8
      Caption = 'Separador5'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object btn_Sair: TToolButton
      Left = 510
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
    Width = 645
    Height = 201
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
    Width = 645
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Color = 15714450
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
      Width = 645
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
    DataSet = FDT
    Left = 514
    Top = 55
  end
  object FDT: TFDTable
    Connection = D.FDCon
    Transaction = D.FDTrans
    Left = 544
    Top = 55
  end
  object PM: TPopupMenu
    Left = 576
    Top = 54
  end
end

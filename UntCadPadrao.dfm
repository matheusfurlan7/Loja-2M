object FrmCadPadrao: TFrmCadPadrao
  Left = 0
  Top = 0
  BorderIcons = [biMaximize]
  BorderStyle = bsSingle
  ClientHeight = 216
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
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
    Width = 594
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
      Width = 588
      Height = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 95
      ExplicitHeight = 25
    end
  end
  object Pages: TPageControl
    Left = 0
    Top = 36
    Width = 594
    Height = 128
    ActivePage = P1
    Align = alClient
    TabOrder = 1
    OnChange = PagesChange
    OnChanging = PagesChanging
    object P1: TTabSheet
      Caption = 'Dados'
      object PF1: TPanel
        Left = 0
        Top = 0
        Width = 586
        Height = 100
        Align = alClient
        TabOrder = 0
      end
    end
    object P2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object Grid: TDBGrid
        Left = 0
        Top = 34
        Width = 586
        Height = 66
        Align = alClient
        DataSource = DS
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GridDrawColumnCell
        OnKeyDown = GridKeyDown
        OnMouseWheelDown = GridMouseWheelDown
        OnMouseWheelUp = GridMouseWheelUp
        OnTitleClick = GridTitleClick
      end
      object PTop: TPanel
        Left = 0
        Top = 0
        Width = 586
        Height = 34
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PM
        TabOrder = 1
        object LPesquisa: TLabel
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
          Width = 370
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
          Top = 33
          Width = 586
          Height = 1
          Align = alBottom
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
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 164
    Width = 594
    Height = 52
    Align = alBottom
    BorderWidth = 1
    ButtonHeight = 44
    ButtonWidth = 49
    DisabledImages = FrmPrincipal.Black
    EdgeBorders = [ebTop, ebBottom]
    HotImages = FrmPrincipal.Black
    Images = FrmPrincipal.Black
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 2
    object btn_Primeiro: TToolButton
      Left = 0
      Top = 0
      Hint = 'Primeiro Registro'
      Caption = 'Primeiro'
      ImageIndex = 8
      OnClick = btn_PrimeiroClick
    end
    object btn_Anterior: TToolButton
      Left = 49
      Top = 0
      Hint = 'Registro Anterior'
      Caption = 'Anterior'
      ImageIndex = 6
      OnClick = btn_AnteriorClick
    end
    object btn_Proximo: TToolButton
      Left = 98
      Top = 0
      Hint = 'Pr'#243'ximo Registro'
      Caption = 'Pr'#243'ximo'
      ImageIndex = 7
      OnClick = btn_ProximoClick
    end
    object btn_Ultimo: TToolButton
      Left = 147
      Top = 0
      Hint = #218'ltimo Registro'
      Caption = #218'ltimo'
      ImageIndex = 9
      OnClick = btn_UltimoClick
    end
    object Separador2: TToolButton
      Left = 196
      Top = 0
      Width = 8
      Caption = 'Separador2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btn_Inserir: TToolButton
      Left = 204
      Top = 0
      Hint = 'Inserir Registro'
      Caption = 'Inserir'
      ImageIndex = 0
      OnClick = btn_InserirClick
    end
    object btn_Alterar: TToolButton
      Left = 253
      Top = 0
      Hint = 'Alterar Registro'
      Caption = 'Alterar'
      ImageIndex = 2
      OnClick = btn_AlterarClick
    end
    object btn_Excluir: TToolButton
      Left = 302
      Top = 0
      Hint = 'Excluir Registro'
      Caption = 'Excluir'
      ImageIndex = 3
      OnClick = btn_ExcluirClick
    end
    object Separador3: TToolButton
      Left = 351
      Top = 0
      Width = 8
      Caption = 'Separador3'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btn_Salvar: TToolButton
      Left = 359
      Top = 0
      Hint = 'Salvar Registro'
      Caption = 'Salvar'
      ImageIndex = 4
      OnClick = btn_SalvarClick
    end
    object btn_Cancelar: TToolButton
      Left = 408
      Top = 0
      Hint = 'Cancelar Registro'
      Caption = 'Cancelar'
      ImageIndex = 1
      OnClick = btn_CancelarClick
    end
    object Separador4: TToolButton
      Left = 457
      Top = 0
      Width = 8
      Caption = 'Separador4'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btn_Imprimir: TToolButton
      Left = 465
      Top = 0
      Hint = 'Imprimir Relat'#243'rio'
      Caption = 'Imprimir'
      ImageIndex = 10
    end
    object Separador5: TToolButton
      Left = 514
      Top = 0
      Width = 8
      Caption = 'Separador5'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object btn_Sair: TToolButton
      Left = 522
      Top = 0
      Hint = 'Sair'
      Caption = 'Sair'
      ImageIndex = 5
      OnClick = btn_SairClick
    end
  end
  object DS: TDataSource
    DataSet = FDT
    OnDataChange = DSDataChange
    Left = 58
    Top = 7
  end
  object FDT: TFDTable
    Connection = D.FDCon
    Transaction = D.FDTrans
    Left = 88
    Top = 7
  end
  object PM: TPopupMenu
    Left = 118
    Top = 7
  end
end

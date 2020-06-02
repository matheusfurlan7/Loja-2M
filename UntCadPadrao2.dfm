object FrmCadPadrao2: TFrmCadPadrao2
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FrmCadPadrao2'
  ClientHeight = 262
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
      Width = 639
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
    Width = 645
    Height = 189
    ActivePage = P1
    Align = alClient
    TabOrder = 1
    object P1: TTabSheet
      Caption = 'Dados'
      object PF1: TPanel
        Left = 0
        Top = 0
        Width = 637
        Height = 161
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 225
    Width = 645
    Height = 37
    Align = alBottom
    BorderWidth = 1
    ButtonHeight = 30
    ButtonWidth = 77
    DisabledImages = FrmPrincipal.Black
    EdgeBorders = [ebTop, ebBottom]
    HotImages = FrmPrincipal.Black
    Images = FrmPrincipal.Black
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 2
    object btn_Salvar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Salvar Registro'
      Caption = 'Salvar'
      ImageIndex = 4
      OnClick = btn_SalvarClick
    end
    object btn_Cancelar: TToolButton
      Left = 77
      Top = 0
      Hint = 'Cancelar Registro'
      Caption = 'Cancelar'
      ImageIndex = 1
      OnClick = btn_CancelarClick
    end
  end
  object DS: TDataSource
    DataSet = FDT
    Left = 58
    Top = 7
  end
  object FDT: TFDTable
    Connection = D.FDCon
    Transaction = D.FDTrans
    Left = 88
    Top = 7
  end
end

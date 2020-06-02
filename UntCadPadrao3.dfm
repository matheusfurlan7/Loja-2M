inherited FrmCadPadrao3: TFrmCadPadrao3
  Caption = 'FrmCadPadrao3'
  ClientHeight = 310
  ExplicitWidth = 651
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    inherited LCad: TLabel
      Width = 639
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Height = 237
    ExplicitHeight = 237
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 637
      ExplicitHeight = 209
      inherited PF1: TPanel
        Height = 60
        ExplicitHeight = 60
      end
      object Grid: TDBGrid
        Left = 0
        Top = 97
        Width = 637
        Height = 112
        Align = alBottom
        Ctl3D = True
        DataSource = DS2
        GradientEndColor = clSilver
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Width = 82
            Visible = True
          end>
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 60
        Width = 637
        Height = 37
        Align = alBottom
        BorderWidth = 1
        ButtonHeight = 30
        ButtonWidth = 76
        DisabledImages = FrmPrincipal.Black
        EdgeBorders = [ebTop, ebBottom]
        HotImages = FrmPrincipal.Black
        Images = FrmPrincipal.Black
        List = True
        ParentShowHint = False
        ShowCaptions = True
        ShowHint = True
        TabOrder = 2
        object btn_Inserir: TToolButton
          Left = 0
          Top = 0
          Hint = 'Inserir Registro'
          Caption = 'Inserir'
          ImageIndex = 0
          OnClick = btn_InserirClick
        end
        object btn_Alterar: TToolButton
          Left = 76
          Top = 0
          Hint = 'Alterar Registro'
          Caption = 'Alterar'
          ImageIndex = 2
          OnClick = btn_AlterarClick
        end
        object btn_Consultar: TToolButton
          Left = 152
          Top = 0
          Hint = 'Consultar registro'
          Caption = 'Conultar'
          ImageIndex = 11
        end
        object btn_Excluir: TToolButton
          Left = 228
          Top = 0
          Hint = 'Excluir Registro'
          Caption = 'Excluir'
          ImageIndex = 3
          OnClick = btn_ExcluirClick
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 273
    ExplicitTop = 273
    object btn_Imprimir: TToolButton
      Left = 154
      Top = 0
      Caption = 'Imprimir'
      ImageIndex = 10
      OnClick = btn_ImprimirClick
    end
  end
  object FDT2: TFDTable
    Connection = D.FDCon
    Transaction = D.FDTrans
    Left = 88
    Top = 56
  end
  object DS2: TDataSource
    DataSet = FDT2
    Left = 58
    Top = 55
  end
end

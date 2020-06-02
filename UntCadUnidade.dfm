inherited FrmCadUnidade: TFrmCadUnidade
  Caption = 'FrmCadUnidade'
  ClientHeight = 194
  ClientWidth = 578
  ExplicitWidth = 584
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 578
    ExplicitWidth = 578
  end
  inherited Pages: TPageControl
    Width = 578
    Height = 106
    ExplicitWidth = 578
    ExplicitHeight = 106
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 78
      inherited PF1: TPanel
        Width = 570
        Height = 78
        ExplicitWidth = 570
        ExplicitHeight = 78
        object Label1: TLabel
          Left = 70
          Top = 15
          Width = 39
          Height = 13
          Caption = 'Unidade'
          FocusControl = EUni_Unidade
        end
        object Label2: TLabel
          Left = 65
          Top = 42
          Width = 46
          Height = 13
          Caption = 'Descricao'
          FocusControl = EUni_Descricao
        end
        object EUni_Unidade: TDBEdit
          Left = 115
          Top = 15
          Width = 69
          Height = 21
          DataField = 'Uni_Unidade'
          DataSource = DS
          TabOrder = 0
        end
        object EUni_Descricao: TDBEdit
          Left = 115
          Top = 42
          Width = 389
          Height = 21
          DataField = 'Uni_Descricao'
          DataSource = DS
          TabOrder = 1
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 78
      inherited Grid: TDBGrid
        Width = 570
        Height = 44
      end
      inherited PTop: TPanel
        Width = 570
        ExplicitWidth = 570
        inherited Separador1: TRichEdit
          Width = 570
          ExplicitWidth = 570
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 142
    Width = 578
    ExplicitTop = 142
    ExplicitWidth = 578
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Uni_Unidade'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Unidade'
    TableName = 'VS12019.dbo.Unidade'
    object FDTUni_Unidade: TStringField
      FieldName = 'Uni_Unidade'
      Origin = 'Uni_Unidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object FDTUni_Descricao: TStringField
      FieldName = 'Uni_Descricao'
      Origin = 'Uni_Descricao'
      Size = 40
    end
  end
end

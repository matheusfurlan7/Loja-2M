inherited FrmCadGrupo: TFrmCadGrupo
  Caption = 'FrmCadGrupo'
  ClientWidth = 578
  ExplicitWidth = 584
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 578
    ExplicitWidth = 578
    inherited LCad: TLabel
      Width = 572
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 578
    ActivePage = P1
    ExplicitWidth = 578
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 100
      inherited PF1: TPanel
        Width = 570
        ExplicitWidth = 570
        object Label1: TLabel
          Left = 83
          Top = 18
          Width = 33
          Height = 13
          Caption = 'Codigo'
          FocusControl = EGru_Codigo
        end
        object Label2: TLabel
          Left = 70
          Top = 50
          Width = 46
          Height = 13
          Caption = 'Descricao'
          FocusControl = EGru_Descricao
        end
        object EGru_Codigo: TDBEdit
          Left = 122
          Top = 18
          Width = 55
          Height = 21
          DataField = 'Gru_Codigo'
          DataSource = DS
          TabOrder = 0
        end
        object EGru_Descricao: TDBEdit
          Left = 122
          Top = 50
          Width = 378
          Height = 21
          DataField = 'Gru_Descricao'
          DataSource = DS
          TabOrder = 1
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 100
      inherited Grid: TDBGrid
        Width = 570
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
    Width = 578
    ExplicitWidth = 578
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Gru_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Grupo'
    TableName = 'VS12019.dbo.Grupo'
    object FDTGru_Descricao: TStringField
      FieldName = 'Gru_Descricao'
      Origin = 'Gru_Descricao'
      Size = 60
    end
    object FDTGru_Codigo: TFDAutoIncField
      FieldName = 'Gru_Codigo'
      Origin = 'Gru_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
end

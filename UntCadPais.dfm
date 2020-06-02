inherited FrmCadPais: TFrmCadPais
  Caption = 'FrmCadPais'
  ClientHeight = 207
  ClientWidth = 585
  ExplicitWidth = 591
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 585
    ExplicitWidth = 585
    inherited LCad: TLabel
      Width = 579
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 585
    Height = 119
    ActivePage = P1
    ExplicitWidth = 585
    ExplicitHeight = 119
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 577
      ExplicitHeight = 91
      inherited PF1: TPanel
        Width = 577
        Height = 91
        ExplicitWidth = 577
        ExplicitHeight = 91
        object LPai_Codigo: TLabel
          Left = 89
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = EPai_Codigo
        end
        object LPai_Nome: TLabel
          Left = 95
          Top = 50
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EPai_Nome
        end
        object EPai_Codigo: TDBEdit
          Left = 128
          Top = 20
          Width = 65
          Height = 21
          DataField = 'Pai_Codigo'
          DataSource = DS
          TabOrder = 0
        end
        object EPai_Nome: TDBEdit
          Left = 128
          Top = 50
          Width = 360
          Height = 21
          DataField = 'Pai_Nome'
          DataSource = DS
          TabOrder = 1
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 577
      ExplicitHeight = 91
      inherited Grid: TDBGrid
        Width = 577
        Height = 57
      end
      inherited PTop: TPanel
        Width = 577
        ExplicitWidth = 577
        inherited Separador1: TRichEdit
          Width = 577
          ExplicitWidth = 577
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 155
    Width = 585
    ExplicitTop = 155
    ExplicitWidth = 585
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Pai_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.pais'
    TableName = 'VS12019.dbo.pais'
    object FDTPai_Codigo: TFDAutoIncField
      FieldName = 'Pai_Codigo'
      Origin = 'Pai_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPai_Nome: TStringField
      FieldName = 'Pai_Nome'
      Origin = 'Pai_Nome'
      Size = 60
    end
  end
end

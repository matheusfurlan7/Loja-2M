inherited FrmCadCidade: TFrmCadCidade
  Caption = 'FrmCadCidade'
  ClientHeight = 205
  ClientWidth = 578
  ExplicitWidth = 584
  ExplicitHeight = 234
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
    Height = 117
    ActivePage = P1
    ExplicitWidth = 578
    ExplicitHeight = 117
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 89
      inherited PF1: TPanel
        Width = 570
        Height = 89
        ExplicitWidth = 570
        ExplicitHeight = 89
        object Label1: TLabel
          Left = 57
          Top = 19
          Width = 19
          Height = 13
          Caption = 'Pais'
          FocusControl = ECid_Pais
        end
        object Label2: TLabel
          Left = 43
          Top = 49
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = ECid_Estado
        end
        object Label4: TLabel
          Left = 148
          Top = 49
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = ECid_Cidade
        end
        object ECid_Pais: TDBEdit
          Left = 82
          Top = 19
          Width = 55
          Height = 21
          DataField = 'Cid_Pais'
          DataSource = DS
          TabOrder = 0
        end
        object ECid_Estado: TDBEdit
          Left = 82
          Top = 49
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Cid_Estado'
          DataSource = DS
          TabOrder = 1
        end
        object ECid_Cidade: TDBEdit
          Left = 187
          Top = 49
          Width = 340
          Height = 21
          DataField = 'Cid_Cidade'
          DataSource = DS
          TabOrder = 2
        end
        object CCid_Pais: TView
          Left = 143
          Top = 19
          Width = 384
          Height = 21
          Margins.Right = 10
          OnActive = CCid_PaisActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = ECid_Pais
          Color = clWindow
        end
        object CCid_Estado: TView
          Left = 112
          Top = 49
          Width = 25
          Height = 21
          Margins.Right = 10
          OnActive = CCid_EstadoActive
          Connection = D.FDCon
          ShowCaption = False
          Associate = ECid_Estado
          Color = clWindow
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 89
      inherited Grid: TDBGrid
        Width = 570
        Height = 55
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
    Top = 153
    Width = 578
    ExplicitTop = 153
    ExplicitWidth = 578
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Cid_Pais;Cid_Estado;Cid_Cidade'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Cidade'
    TableName = 'VS12019.dbo.Cidade'
    object FDTCid_Pais: TIntegerField
      FieldName = 'Cid_Pais'
      Origin = 'Cid_Pais'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTCid_Estado: TStringField
      FieldName = 'Cid_Estado'
      Origin = 'Cid_Estado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDTCid_Cidade: TStringField
      FieldName = 'Cid_Cidade'
      Origin = 'Cid_Cidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 40
    end
    object FDTCid_PaisNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Cid_PaisNome'
      LookupDataSet = TPais
      LookupKeyFields = 'Pai_Codigo'
      LookupResultField = 'Pai_Nome'
      KeyFields = 'Cid_Pais'
      Size = 60
      Lookup = True
    end
  end
  object TPais: TFDTable
    IndexFieldNames = 'Pai_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pais'
    TableName = 'VS12019.dbo.Pais'
    Left = 149
    Top = 8
  end
end

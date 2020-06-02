inherited FrmCadEstado: TFrmCadEstado
  Caption = 'FrmCadEstado'
  ClientWidth = 588
  ExplicitWidth = 594
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 588
    ExplicitWidth = 588
    inherited LCad: TLabel
      Width = 582
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 588
    ActivePage = P1
    ExplicitWidth = 588
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 580
      ExplicitHeight = 100
      object Label3: TLabel [0]
        Left = 120
        Top = 0
        Width = 3
        Height = 13
      end
      inherited PF1: TPanel
        Width = 580
        ExplicitWidth = 580
        object Label1: TLabel
          Left = 74
          Top = 19
          Width = 19
          Height = 13
          Caption = 'Pais'
          FocusControl = EEst_Pais
        end
        object Label2: TLabel
          Left = 71
          Top = 59
          Width = 22
          Height = 13
          Caption = 'Sigla'
          FocusControl = EEst_Estado
        end
        object Label4: TLabel
          Left = 140
          Top = 59
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = EEst_Cidade
        end
        object EEst_Pais: TDBEdit
          Left = 99
          Top = 19
          Width = 55
          Height = 21
          DataField = 'Est_Pais'
          DataSource = DS
          TabOrder = 0
        end
        object EEst_Estado: TDBEdit
          Left = 99
          Top = 59
          Width = 30
          Height = 21
          DataField = 'Est_Estado'
          DataSource = DS
          TabOrder = 1
        end
        object EEst_Cidade: TDBEdit
          Left = 179
          Top = 59
          Width = 340
          Height = 21
          DataField = 'Est_Cidade'
          DataSource = DS
          TabOrder = 2
        end
        object CEst_Pais: TView
          Left = 160
          Top = 19
          Width = 359
          Height = 21
          Margins.Right = 10
          OnActive = CEst_PaisActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EEst_Pais
          Color = clWindow
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 580
      ExplicitHeight = 100
      inherited Grid: TDBGrid
        Width = 580
      end
      inherited PTop: TPanel
        Width = 580
        ExplicitWidth = 580
        inherited Separador1: TRichEdit
          Width = 580
          ExplicitWidth = 580
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Width = 588
    ExplicitWidth = 588
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Est_Pais;Est_Cidade'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Estado'
    TableName = 'VS12019.dbo.Estado'
    object FDTEst_Pais: TIntegerField
      FieldName = 'Est_Pais'
      Origin = 'Est_Pais'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTEst_Estado: TStringField
      FieldName = 'Est_Estado'
      Origin = 'Est_Estado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDTEst_Cidade: TStringField
      FieldName = 'Est_Cidade'
      Origin = 'Est_Cidade'
      Required = True
      Size = 40
    end
    object FDTEst_PaisNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Est_PaisNome'
      LookupDataSet = TPais
      LookupKeyFields = 'Pai_Codigo'
      LookupResultField = 'Pai_Nome'
      KeyFields = 'Est_Pais'
      Size = 60
      Lookup = True
    end
  end
  object TPais: TFDTable
    IndexFieldNames = 'Pai_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pais'
    TableName = 'VS12019.dbo.Pais'
    Left = 152
    Top = 8
  end
end

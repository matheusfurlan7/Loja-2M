inherited FrmCadUsuario: TFrmCadUsuario
  Top = 222
  Caption = 'FrmCadUsuario'
  ClientHeight = 274
  ExplicitWidth = 600
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    inherited LCad: TLabel
      Width = 588
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Height = 186
    ActivePage = P1
    ExplicitHeight = 186
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 586
      ExplicitHeight = 158
      inherited PF1: TPanel
        Height = 158
        ExplicitHeight = 158
        object Label1: TLabel
          Left = 42
          Top = 16
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = EUSU_CODIGO
        end
        object Label5: TLabel
          Left = 48
          Top = 43
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EUSU_NOME
        end
        object Label6: TLabel
          Left = 6
          Top = 69
          Width = 69
          Height = 13
          Caption = 'Departamento'
          FocusControl = EUSU_DEPARTAMENTO
        end
        object Label7: TLabel
          Left = 394
          Top = 95
          Width = 30
          Height = 13
          Caption = 'Senha'
          FocusControl = EUSU_SENHA
        end
        object Label8: TLabel
          Left = 50
          Top = 95
          Width = 25
          Height = 13
          Caption = 'Login'
          FocusControl = EUSU_LOGIN
        end
        object Label9: TLabel
          Left = 51
          Top = 122
          Width = 24
          Height = 13
          Caption = 'Perfil'
          FocusControl = EUSU_PERFIL
        end
        object EUSU_CODIGO: TDBEdit
          Left = 81
          Top = 16
          Width = 73
          Height = 21
          DataField = 'USU_CODIGO'
          DataSource = DS
          TabOrder = 0
        end
        object EUSU_NOME: TDBEdit
          Left = 81
          Top = 43
          Width = 480
          Height = 21
          DataField = 'USU_NOME'
          DataSource = DS
          TabOrder = 2
        end
        object EUSU_DEPARTAMENTO: TDBEdit
          Left = 81
          Top = 69
          Width = 480
          Height = 21
          DataField = 'USU_DEPARTAMENTO'
          DataSource = DS
          TabOrder = 3
        end
        object EUSU_SENHA: TDBEdit
          Left = 427
          Top = 95
          Width = 134
          Height = 21
          DataField = 'USU_SENHA'
          DataSource = DS
          TabOrder = 5
        end
        object EUSU_LOGIN: TDBEdit
          Left = 81
          Top = 95
          Width = 264
          Height = 21
          DataField = 'USU_LOGIN'
          DataSource = DS
          TabOrder = 4
        end
        object EUSU_PERFIL: TDBEdit
          Left = 81
          Top = 122
          Width = 82
          Height = 21
          DataField = 'USU_PERFIL'
          DataSource = DS
          TabOrder = 6
        end
        object EUSU_Status: TDBCheckBox
          Left = 508
          Top = 16
          Width = 53
          Height = 17
          Caption = 'Ativo'
          DataField = 'USU_STATUS'
          DataSource = DS
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CUSU_PERFIL: TView
          Left = 169
          Top = 122
          Width = 392
          Height = 21
          Margins.Right = 10
          OnActive = CUSU_PERFILActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EUSU_PERFIL
          Color = clWindow
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 586
      ExplicitHeight = 158
      inherited Grid: TDBGrid
        Height = 124
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 222
    ExplicitTop = 222
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    OnCalcFields = FDTCalcFields
    IndexFieldNames = 'USU_CODIGO'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Usuario'
    TableName = 'VS12019.dbo.Usuario'
    object FDTUSU_CODIGO: TFDAutoIncField
      FieldName = 'USU_CODIGO'
      Origin = 'USU_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTUSU_STATUS: TStringField
      FieldName = 'USU_STATUS'
      Origin = 'USU_STATUS'
      FixedChar = True
      Size = 1
    end
    object FDTUSU_INCLUSAO: TDateField
      FieldName = 'USU_INCLUSAO'
      Origin = 'USU_INCLUSAO'
    end
    object FDTUSU_ALTERACAO: TDateField
      FieldName = 'USU_ALTERACAO'
      Origin = 'USU_ALTERACAO'
    end
    object FDTUSU_NOME: TStringField
      FieldName = 'USU_NOME'
      Origin = 'USU_NOME'
      Size = 80
    end
    object FDTUSU_DEPARTAMENTO: TStringField
      FieldName = 'USU_DEPARTAMENTO'
      Origin = 'USU_DEPARTAMENTO'
      Size = 80
    end
    object FDTUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Origin = 'USU_SENHA'
      Size = 10
    end
    object FDTUSU_LOGIN: TStringField
      FieldName = 'USU_LOGIN'
      Origin = 'USU_LOGIN'
    end
    object FDTUSU_PERFIL: TIntegerField
      FieldName = 'USU_PERFIL'
      Origin = 'USU_PERFIL'
    end
    object FDTUSU_PERFILDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'USU_PERFILDESCRICAO'
      LookupDataSet = TPerfil
      LookupKeyFields = 'PER_CODIGO'
      LookupResultField = 'PER_DESCRICAO'
      KeyFields = 'USU_PERFIL'
      Size = 50
      Lookup = True
    end
    object FDTSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 7
      Calculated = True
    end
  end
  object TPerfil: TFDTable
    IndexFieldNames = 'PER_CODIGO'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Perfil'
    TableName = 'VS12019.dbo.Perfil'
    Left = 152
    Top = 8
  end
end

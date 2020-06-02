inherited FrmCadProduto: TFrmCadProduto
  Caption = 'FrmCadProduto'
  ClientHeight = 332
  ClientWidth = 578
  ExplicitWidth = 584
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 578
    ExplicitWidth = 578
    inherited LCad: TLabel
      Width = 572
    end
  end
  inherited Pages: TPageControl
    Width = 578
    Height = 244
    ExplicitWidth = 578
    ExplicitHeight = 244
    inherited P1: TTabSheet
      ExplicitWidth = 570
      ExplicitHeight = 216
      inherited PF1: TPanel
        Width = 570
        Height = 216
        ExplicitWidth = 570
        ExplicitHeight = 216
        object Label1: TLabel
          Left = 106
          Top = 11
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = EPro_Codigo
        end
        object Label2: TLabel
          Left = 93
          Top = 35
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EPro_Descricao
        end
        object Label3: TLabel
          Left = 395
          Top = 11
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
        end
        object Label4: TLabel
          Left = 248
          Top = 11
          Width = 44
          Height = 13
          Caption = 'Cadastro'
          FocusControl = EPro_DataCadastro
        end
        object Label5: TLabel
          Left = 110
          Top = 59
          Width = 29
          Height = 13
          Caption = 'Grupo'
          FocusControl = EPro_Grupo
        end
        object Label6: TLabel
          Left = 411
          Top = 83
          Width = 39
          Height = 13
          Caption = 'Unidade'
        end
        object Label7: TLabel
          Left = 56
          Top = 83
          Width = 83
          Height = 13
          Caption = 'C'#243'digo De Barras'
        end
        object EPro_Codigo: TDBEdit
          Left = 145
          Top = 11
          Width = 73
          Height = 21
          DataField = 'Pro_Codigo'
          DataSource = DS
          TabOrder = 0
        end
        object EPro_Descricao: TDBEdit
          Left = 145
          Top = 35
          Width = 390
          Height = 21
          DataField = 'Pro_Descricao'
          DataSource = DS
          TabOrder = 3
        end
        object EPro_DataCadastro: TDBEdit
          Left = 298
          Top = 11
          Width = 65
          Height = 21
          DataField = 'Pro_DataCadastro'
          DataSource = DS
          TabOrder = 1
        end
        object EPro_Grupo: TDBEdit
          Left = 145
          Top = 59
          Width = 71
          Height = 21
          DataField = 'Pro_Grupo'
          DataSource = DS
          TabOrder = 4
        end
        object EPro_CodigoDeBarras: TDBEdit
          Left = 145
          Top = 83
          Width = 220
          Height = 21
          DataField = 'Pro_CodigoDeBarras'
          DataSource = DS
          TabOrder = 5
        end
        object EPro_Situacao: TDBComboBox
          Left = 440
          Top = 11
          Width = 95
          Height = 21
          Style = csDropDownList
          DataField = 'Pro_Situacao'
          DataSource = DS
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 2
        end
        object GEstoque: TGroupBox
          Left = 35
          Top = 108
          Width = 500
          Height = 48
          Caption = 'Estoque'
          TabOrder = 7
          object Label8: TLabel
            Left = 338
            Top = 17
            Width = 74
            Height = 13
            Caption = 'Estoque m'#237'nimo'
            FocusControl = EPro_EstoqueMinimo
          end
          object Label12: TLabel
            Left = 35
            Top = 17
            Width = 41
            Height = 13
            Caption = 'Controla'
          end
          object EPro_EstoqueMinimo: TDBEdit
            Left = 415
            Top = 17
            Width = 75
            Height = 21
            DataField = 'Pro_EstoqueMinimo'
            DataSource = DS
            TabOrder = 1
          end
          object EPro_ControlaEstoque: TDBComboBox
            Left = 82
            Top = 17
            Width = 75
            Height = 21
            Style = csDropDownList
            DataField = 'Pro_ControlaEstoque'
            DataSource = DS
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 0
          end
        end
        object GPreco: TGroupBox
          Left = 35
          Top = 158
          Width = 500
          Height = 47
          Caption = 'Pre'#231'o'
          TabOrder = 8
          object Label9: TLabel
            Left = 17
            Top = 17
            Width = 59
            Height = 13
            Caption = 'Custo m'#233'dio'
            FocusControl = EPro_CustoMedio
          end
          object Label10: TLabel
            Left = 189
            Top = 17
            Width = 83
            Height = 13
            Caption = 'Margem lucro(%)'
          end
          object Label11: TLabel
            Left = 347
            Top = 17
            Width = 62
            Height = 13
            Caption = 'Pr. de venda'
            FocusControl = EPro_PrecoVenda
          end
          object EPro_CustoMedio: TDBEdit
            Left = 82
            Top = 17
            Width = 75
            Height = 21
            DataField = 'Pro_CustoMedio'
            DataSource = DS
            TabOrder = 0
            OnExit = EPro_CustoMedioExit
          end
          object EPro_PrecoVenda: TDBEdit
            Left = 415
            Top = 17
            Width = 75
            Height = 21
            DataField = 'Pro_PrecoVenda'
            DataSource = DS
            ReadOnly = True
            TabOrder = 2
          end
          object EPro_MargemLucro: TDBEdit
            Left = 278
            Top = 17
            Width = 44
            Height = 21
            DataField = 'Pro_MargemLucro'
            DataSource = DS
            TabOrder = 1
            OnExit = EPro_MargemLucroExit
          end
        end
        object EPro_Unidade: TDBEdit
          Left = 456
          Top = 83
          Width = 55
          Height = 21
          DataField = 'Pro_Unidade'
          DataSource = DS
          TabOrder = 6
        end
        object CPro_Grupo: TView
          Left = 220
          Top = 59
          Width = 315
          Height = 21
          Margins.Right = 10
          OnActive = CPro_GrupoActive
          Connection = D.FDCon
          ShowCaption = True
          Associate = EPro_Grupo
          Color = clWindow
        end
        object CPro_Unidade: TView
          Left = 511
          Top = 83
          Width = 24
          Height = 21
          Margins.Right = 10
          OnActive = CPro_UnidadeActive
          Connection = D.FDCon
          ShowCaption = False
          Associate = EPro_Unidade
          Color = clWindow
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitWidth = 570
      ExplicitHeight = 216
      inherited Grid: TDBGrid
        Width = 570
        Height = 182
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
    Top = 280
    Width = 578
    ExplicitTop = 280
    ExplicitWidth = 578
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    IndexFieldNames = 'Pro_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Produto'
    TableName = 'VS12019.dbo.Produto'
    object FDTPro_Codigo: TFDAutoIncField
      FieldName = 'Pro_Codigo'
      Origin = 'Pro_Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPro_Descricao: TStringField
      FieldName = 'Pro_Descricao'
      Origin = 'Pro_Descricao'
      Required = True
      Size = 50
    end
    object FDTPro_Situacao: TStringField
      FieldName = 'Pro_Situacao'
      Origin = 'Pro_Situacao'
      Required = True
      Size = 7
    end
    object FDTPro_Grupo: TIntegerField
      FieldName = 'Pro_Grupo'
      Origin = 'Pro_Grupo'
      Required = True
    end
    object FDTPro_CodigoDeBarras: TStringField
      FieldName = 'Pro_CodigoDeBarras'
      Origin = 'Pro_CodigoDeBarras'
    end
    object FDTPro_Unidade: TStringField
      FieldName = 'Pro_Unidade'
      Origin = 'Pro_Unidade'
      Required = True
      Size = 5
    end
    object FDTPro_ControlaEstoque: TStringField
      FieldName = 'Pro_ControlaEstoque'
      Origin = 'Pro_ControlaEstoque'
      Required = True
      FixedChar = True
      Size = 3
    end
    object FDTPro_EstoqueMinimo: TBCDField
      FieldName = 'Pro_EstoqueMinimo'
      Origin = 'Pro_EstoqueMinimo'
      Required = True
      Precision = 12
    end
    object FDTPro_CustoMedio: TBCDField
      FieldName = 'Pro_CustoMedio'
      Origin = 'Pro_CustoMedio'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 12
    end
    object FDTPro_MargemLucro: TBCDField
      FieldName = 'Pro_MargemLucro'
      Origin = 'Pro_MargemLucro'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 5
      Size = 2
    end
    object FDTPro_PrecoVenda: TBCDField
      FieldName = 'Pro_PrecoVenda'
      Origin = 'Pro_PrecoVenda'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 12
    end
    object FDTPro_DataCadastro: TDateField
      FieldName = 'Pro_DataCadastro'
      Origin = 'Pro_DataCadastro'
      OnSetText = FDTPro_DataCadastroSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPro_GrupoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'Pro_GrupoDescricao'
      LookupDataSet = TGrupo
      LookupKeyFields = 'Gru_Codigo'
      LookupResultField = 'Gru_Descricao'
      KeyFields = 'Pro_Grupo'
      Size = 60
      Lookup = True
    end
  end
  object TGrupo: TFDTable
    IndexFieldNames = 'Gru_Codigo'
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Grupo'
    TableName = 'VS12019.dbo.Grupo'
    Left = 149
    Top = 7
  end
end

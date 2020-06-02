inherited FrmCadPessoa: TFrmCadPessoa
  Caption = 'FrmCadPessoa'
  ClientHeight = 497
  ClientWidth = 619
  ExplicitWidth = 625
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTopo: TPanel
    Width = 619
    ExplicitWidth = 619
    inherited LCad: TLabel
      Width = 613
    end
  end
  inherited Pages: TPageControl
    Width = 619
    Height = 409
    ExplicitWidth = 619
    ExplicitHeight = 409
    inherited P1: TTabSheet
      ExplicitWidth = 611
      ExplicitHeight = 381
      inherited PF1: TPanel
        Width = 611
        Height = 381
        ExplicitWidth = 611
        ExplicitHeight = 381
        object GDados: TGroupBox
          Left = 5
          Top = 8
          Width = 596
          Height = 206
          TabOrder = 0
          object Label1: TLabel
            Left = 35
            Top = 12
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 41
            Top = 39
            Width = 27
            Height = 13
            Caption = 'Nome'
            FocusControl = EPes_Nome
          end
          object Label3: TLabel
            Left = 9
            Top = 66
            Width = 59
            Height = 13
            Caption = 'Raz'#227'o social'
            FocusControl = Pes_RazaoSocial
          end
          object CPF: TLabel
            Left = 49
            Top = 119
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'CPF'
            FocusControl = EPes_CPFCNPJ
          end
          object Label5: TLabel
            Left = 354
            Top = 12
            Width = 41
            Height = 13
            Caption = 'Situa'#231#227'o'
          end
          object Label7: TLabel
            Left = 48
            Top = 92
            Width = 20
            Height = 13
            Caption = 'Tipo'
          end
          object RG: TLabel
            Left = 414
            Top = 119
            Width = 14
            Height = 13
            Alignment = taRightJustify
            Caption = 'RG'
            FocusControl = EPes_RGIE
          end
          object Label26: TLabel
            Left = 178
            Top = 92
            Width = 95
            Height = 13
            Caption = 'Data de nascimento'
            FocusControl = EPes_DataNascimento
          end
          object Label27: TLabel
            Left = 373
            Top = 92
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label6: TLabel
            Left = 196
            Top = 12
            Width = 44
            Height = 13
            Caption = 'Cadastro'
            FocusControl = EPes_DataCadastro
          end
          object Label4: TLabel
            Left = 26
            Top = 145
            Width = 42
            Height = 13
            Caption = 'Telefone'
            FocusControl = EPes_Telefone
          end
          object Label8: TLabel
            Left = 398
            Top = 145
            Width = 33
            Height = 13
            Caption = 'Celular'
            FocusControl = EPes_Celular
          end
          object Label9: TLabel
            Left = 40
            Top = 172
            Width = 28
            Height = 13
            Caption = 'E-Mail'
            FocusControl = EPes_Email
          end
          object EPes_Nome: TDBEdit
            Left = 74
            Top = 39
            Width = 405
            Height = 21
            DataField = 'Pes_Nome'
            DataSource = DS
            TabOrder = 3
          end
          object Pes_RazaoSocial: TDBEdit
            Left = 74
            Top = 66
            Width = 405
            Height = 21
            DataField = 'Pes_RazaoSocial'
            DataSource = DS
            TabOrder = 4
          end
          object EPes_CPFCNPJ: TDBEdit
            Left = 74
            Top = 119
            Width = 121
            Height = 21
            DataField = 'Pes_CPFCNPJ'
            DataSource = DS
            TabOrder = 9
          end
          object EPes_Situacao: TDBComboBox
            Left = 401
            Top = 12
            Width = 78
            Height = 21
            Style = csDropDownList
            DataField = 'Pes_Situacao'
            DataSource = DS
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 2
          end
          object EPes_Codigo: TDBEdit
            Left = 74
            Top = 12
            Width = 73
            Height = 21
            DataField = 'Pes_Codigo'
            DataSource = DS
            TabOrder = 0
          end
          object EPes_TipoDePessoa: TDBComboBox
            Left = 74
            Top = 92
            Width = 65
            Height = 21
            Style = csDropDownList
            DataField = 'Pes_TipoDePessoa'
            DataSource = DS
            Items.Strings = (
              'F'#237'sica'
              'Jur'#237'dica')
            TabOrder = 6
            OnChange = EPes_TipoDePessoaChange
            OnExit = EPes_TipoDePessoaExit
          end
          object EPes_RGIE: TDBEdit
            Left = 434
            Top = 119
            Width = 153
            Height = 21
            DataField = 'Pes_RGIE'
            DataSource = DS
            TabOrder = 10
          end
          object EPes_DataNascimento: TDBEdit
            Left = 279
            Top = 92
            Width = 65
            Height = 21
            DataField = 'Pes_DataNascimento'
            DataSource = DS
            TabOrder = 7
          end
          object EPes_Sexo: TDBComboBox
            Left = 401
            Top = 92
            Width = 78
            Height = 21
            Style = csDropDownList
            DataField = 'Pes_Sexo'
            DataSource = DS
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 8
          end
          object EPes_DataCadastro: TDBEdit
            Left = 246
            Top = 12
            Width = 65
            Height = 21
            DataField = 'Pes_DataCadastro'
            DataSource = DS
            TabOrder = 1
          end
          object EPes_Telefone: TDBEdit
            Left = 74
            Top = 145
            Width = 150
            Height = 21
            DataField = 'Pes_Telefone'
            DataSource = DS
            TabOrder = 11
          end
          object EPes_Celular: TDBEdit
            Left = 434
            Top = 145
            Width = 153
            Height = 21
            DataField = 'Pes_Celular'
            DataSource = DS
            TabOrder = 12
          end
          object EPes_Email: TDBEdit
            Left = 74
            Top = 172
            Width = 513
            Height = 21
            DataField = 'Pes_Email'
            DataSource = DS
            TabOrder = 13
          end
          object GClassificacao: TGroupBox
            Left = 488
            Top = 12
            Width = 99
            Height = 101
            Caption = 'Classifica'#231#227'o'
            TabOrder = 5
            object EPes_Cliente: TDBCheckBox
              Left = 9
              Top = 14
              Width = 87
              Height = 17
              Caption = 'Cliente'
              DataField = 'Pes_Cliente'
              DataSource = DS
              TabOrder = 0
              ValueChecked = 'Sim'
              ValueUnchecked = 'N'#227'o'
            end
            object EPes_Fornecedor: TDBCheckBox
              Left = 9
              Top = 36
              Width = 87
              Height = 17
              Caption = 'Fornecedor'
              DataField = 'Pes_Fornecedor'
              DataSource = DS
              TabOrder = 1
              ValueChecked = 'Sim'
              ValueUnchecked = 'N'#227'o'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 9
              Top = 58
              Width = 87
              Height = 17
              Caption = 'Vendedor'
              DataField = 'Pes_Vendedor'
              DataSource = DS
              TabOrder = 2
              ValueChecked = 'Sim'
              ValueUnchecked = 'N'#227'o'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 9
              Top = 80
              Width = 87
              Height = 17
              Caption = 'Comprador'
              DataField = 'Pes_Comprador'
              DataSource = DS
              TabOrder = 3
              ValueChecked = 'Sim'
              ValueUnchecked = 'N'#227'o'
            end
          end
        end
        object GEndereco: TGroupBox
          Left = 5
          Top = 218
          Width = 596
          Height = 151
          Caption = 'Endere'#231'o'
          TabOrder = 1
          object Label18: TLabel
            Left = 9
            Top = 91
            Width = 65
            Height = 13
            Caption = 'Complemento'
          end
          object Label10: TLabel
            Left = 29
            Top = 64
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object Label11: TLabel
            Left = 163
            Top = 37
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label13: TLabel
            Left = 41
            Top = 37
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label14: TLabel
            Left = 493
            Top = 118
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object Label12: TLabel
            Left = 46
            Top = 118
            Width = 28
            Height = 13
            Caption = 'Bairro'
          end
          object Label23: TLabel
            Left = 367
            Top = 118
            Width = 12
            Height = 13
            Caption = 'N'#186
          end
          object Label28: TLabel
            Left = 55
            Top = 12
            Width = 19
            Height = 13
            Caption = 'Pa'#237's'
            FocusControl = EPes_Pais
          end
          object EPes_Complemento: TDBEdit
            Left = 79
            Top = 91
            Width = 507
            Height = 21
            DataField = 'Pes_Complemento'
            DataSource = DS
            TabOrder = 4
          end
          object EPes_Endereco: TDBEdit
            Left = 79
            Top = 63
            Width = 507
            Height = 21
            DataField = 'Pes_Endereco'
            DataSource = DS
            TabOrder = 3
          end
          object EPes_Cep: TDBEdit
            Left = 518
            Top = 118
            Width = 68
            Height = 21
            DataField = 'Pes_Cep'
            DataSource = DS
            TabOrder = 7
          end
          object EPes_Bairro: TDBEdit
            Left = 79
            Top = 118
            Width = 250
            Height = 21
            DataField = 'Pes_Bairro'
            DataSource = DS
            TabOrder = 5
          end
          object EPes_Numero: TDBEdit
            Left = 385
            Top = 118
            Width = 61
            Height = 21
            DataField = 'Pes_Numero'
            DataSource = DS
            TabOrder = 6
          end
          object EPes_Pais: TDBEdit
            Left = 79
            Top = 12
            Width = 71
            Height = 21
            DataField = 'Pes_Pais'
            DataSource = DS
            TabOrder = 0
          end
          object EPes_Estado: TDBEdit
            Left = 79
            Top = 37
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            DataField = 'Pes_Estado'
            DataSource = DS
            TabOrder = 1
          end
          object EPes_Cidade: TDBEdit
            Left = 202
            Top = 37
            Width = 360
            Height = 21
            DataField = 'Pes_Cidade'
            DataSource = DS
            TabOrder = 2
          end
          object CPes_Estado: TView
            Left = 126
            Top = 37
            Width = 24
            Height = 21
            Margins.Right = 10
            OnActive = CPes_EstadoActive
            Connection = D.FDCon
            ShowCaption = False
            Associate = EPes_Estado
            Color = clWindow
          end
          object CPes_Cidade: TView
            Left = 562
            Top = 37
            Width = 24
            Height = 21
            Margins.Right = 10
            OnActive = CPes_CidadeActive
            Connection = D.FDCon
            ShowCaption = False
            Associate = EPes_Cidade
            Color = clWindow
          end
          object CPes_Pais: TView
            Left = 153
            Top = 12
            Width = 433
            Height = 21
            Margins.Right = 10
            OnActive = CPes_PaisActive
            Connection = D.FDCon
            ShowCaption = True
            Associate = EPes_Pais
            Color = clWindow
          end
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitWidth = 611
      ExplicitHeight = 381
      inherited Grid: TDBGrid
        Width = 611
        Height = 347
      end
      inherited PTop: TPanel
        Width = 611
        ExplicitWidth = 611
        inherited Separador1: TRichEdit
          Width = 611
          ExplicitWidth = 611
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 445
    Width = 619
    ExplicitTop = 445
    ExplicitWidth = 619
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    OnCalcFields = FDTCalcFields
    IndexFieldNames = 'Pes_Codigo'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pessoa'
    TableName = 'VS12019.dbo.Pessoa'
    object FDTPes_Nome: TStringField
      FieldName = 'Pes_Nome'
      Origin = 'Pes_Nome'
      Size = 50
    end
    object FDTPes_RazaoSocial: TStringField
      FieldName = 'Pes_RazaoSocial'
      Origin = 'Pes_RazaoSocial'
      Size = 50
    end
    object FDTPes_Situacao: TStringField
      FieldName = 'Pes_Situacao'
      Origin = 'Pes_Situacao'
      Size = 7
    end
    object FDTPes_TipoDePessoa: TStringField
      FieldName = 'Pes_TipoDePessoa'
      Origin = 'Pes_TipoDePessoa'
      Size = 8
    end
    object FDTPes_CPFCNPJ: TStringField
      FieldName = 'Pes_CPFCNPJ'
      Origin = 'Pes_CPFCNPJ'
      Size = 18
    end
    object FDTPes_RGIE: TStringField
      FieldName = 'Pes_RGIE'
      Origin = 'Pes_RGIE'
      Size = 14
    end
    object FDTPes_Telefone: TStringField
      FieldName = 'Pes_Telefone'
      Origin = 'Pes_Telefone'
    end
    object FDTPes_Celular: TStringField
      FieldName = 'Pes_Celular'
      Origin = 'Pes_Celular'
    end
    object FDTPes_Email: TStringField
      FieldName = 'Pes_Email'
      Origin = 'Pes_Email'
      Size = 100
    end
    object FDTPes_Site: TStringField
      FieldName = 'Pes_Site'
      Origin = 'Pes_Site'
      Size = 100
    end
    object FDTPes_Pais: TIntegerField
      FieldName = 'Pes_Pais'
      Origin = 'Pes_Pais'
    end
    object FDTPes_Estado: TStringField
      FieldName = 'Pes_Estado'
      Origin = 'Pes_Estado'
      FixedChar = True
      Size = 2
    end
    object FDTPes_Cidade: TStringField
      FieldName = 'Pes_Cidade'
      Origin = 'Pes_Cidade'
      Size = 40
    end
    object FDTPes_Bairro: TStringField
      FieldName = 'Pes_Bairro'
      Origin = 'Pes_Bairro'
      Size = 30
    end
    object FDTPes_Endereco: TStringField
      FieldName = 'Pes_Endereco'
      Origin = 'Pes_Endereco'
      Size = 50
    end
    object FDTPes_Numero: TStringField
      FieldName = 'Pes_Numero'
      Origin = 'Pes_Numero'
      Size = 5
    end
    object FDTPes_Complemento: TStringField
      FieldName = 'Pes_Complemento'
      Origin = 'Pes_Complemento'
      Size = 50
    end
    object FDTPes_Cep: TStringField
      FieldName = 'Pes_Cep'
      Origin = 'Pes_Cep'
      EditMask = '##.###-###;0;_'
      Size = 8
    end
    object FDTPes_Sexo: TStringField
      FieldName = 'Pes_Sexo'
      Origin = 'Pes_Sexo'
      Size = 9
    end
    object FDTPes_Codigo: TIntegerField
      FieldName = 'Pes_Codigo'
      Origin = 'Pes_Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTPes_DataCadastro: TDateField
      FieldName = 'Pes_DataCadastro'
      Origin = 'Pes_DataCadastro'
      OnSetText = FDTPes_DataCadastroSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPes_DataNascimento: TDateField
      FieldName = 'Pes_DataNascimento'
      Origin = 'Pes_DataNascimento'
      OnSetText = FDTPes_DataNascimentoSetText
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object FDTPes_Vendedor: TStringField
      FieldName = 'Pes_Vendedor'
      Origin = 'Pes_Vendedor'
      FixedChar = True
      Size = 3
    end
    object FDTPes_Cliente: TStringField
      FieldName = 'Pes_Cliente'
      Origin = 'Pes_Cliente'
      Size = 3
    end
    object FDTPes_Fornecedor: TStringField
      FieldName = 'Pes_Fornecedor'
      Origin = 'Pes_Fornecedor'
      Size = 3
    end
    object FDTPes_Comprador: TStringField
      FieldName = 'Pes_Comprador'
      Origin = 'Pes_Comprador'
      FixedChar = True
      Size = 3
    end
    object FDTPEs_PaisNome: TStringField
      FieldKind = fkLookup
      FieldName = 'PEs_PaisNome'
      LookupDataSet = TPais
      LookupKeyFields = 'Pai_Codigo'
      LookupResultField = 'Pai_Nome'
      KeyFields = 'Pes_Pais'
      Size = 60
      Lookup = True
    end
    object FDTPes_CPFCNPJAUX: TStringField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Pes_CPFCNPJAUX'
      Size = 25
      Calculated = True
    end
  end
  object TPais: TFDTable
    Connection = D.FDCon
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Pais'
    TableName = 'VS12019.dbo.Pais'
    Left = 152
    Top = 8
  end
end

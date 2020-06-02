inherited FrmCadPerfil: TFrmCadPerfil
  Caption = 'FrmCadPerfil'
  ClientHeight = 514
  ClientWidth = 595
  ExplicitWidth = 601
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  object Label39: TLabel [0]
    Left = 25
    Top = 400
    Width = 24
    Height = 13
    Caption = 'Perfil'
  end
  inherited PTopo: TPanel
    Width = 595
    ExplicitWidth = 595
    inherited LCad: TLabel
      Width = 589
      Height = 30
    end
  end
  inherited Pages: TPageControl
    Width = 595
    Height = 426
    ActivePage = P1
    ExplicitWidth = 595
    ExplicitHeight = 426
    inherited P1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 587
      ExplicitHeight = 398
      inherited PF1: TPanel
        Width = 587
        Height = 398
        ExplicitWidth = 587
        ExplicitHeight = 398
        object Label1: TLabel
          Left = 29
          Top = 8
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = EPER_CODIGO
        end
        object Label5: TLabel
          Left = 16
          Top = 35
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EPER_DESCRICAO
        end
        object EPER_CODIGO: TDBEdit
          Left = 66
          Top = 8
          Width = 71
          Height = 21
          DataField = 'PER_CODIGO'
          DataSource = DS
          TabOrder = 0
        end
        object EPER_DESCRICAO: TDBEdit
          Left = 66
          Top = 35
          Width = 505
          Height = 21
          DataField = 'PER_DESCRICAO'
          DataSource = DS
          TabOrder = 2
        end
        object EPER_STATUS: TDBCheckBox
          Left = 522
          Top = 8
          Width = 49
          Height = 17
          Caption = 'Ativo'
          DataField = 'PER_STATUS'
          DataSource = DS
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object GCadastro: TGroupBox
          Left = 16
          Top = 62
          Width = 555
          Height = 115
          Caption = 'Cadastro'
          TabOrder = 3
          object Label38: TLabel
            Left = 21
            Top = 14
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
          end
          object Label41: TLabel
            Left = 9
            Top = 33
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usu'#225'rio'
          end
          object Label42: TLabel
            Left = 305
            Top = 14
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object Label43: TLabel
            Left = 291
            Top = 53
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade'
          end
          object Label44: TLabel
            Left = 7
            Top = 91
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Produto'
          end
          object Label45: TLabel
            Left = 6
            Top = 53
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidade'
          end
          object Label46: TLabel
            Left = 16
            Top = 72
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object Label47: TLabel
            Left = 290
            Top = 72
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pessoa'
          end
          object Label40: TLabel
            Left = 291
            Top = 33
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object PerfilMenu: TCheckBox
            Left = 49
            Top = 14
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 0
          end
          object PerfilIncluir: TCheckBox
            Left = 100
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 1
          end
          object PerfilAlterar: TCheckBox
            Left = 155
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 2
          end
          object PerfilExcluir: TCheckBox
            Left = 214
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 3
          end
          object UsuarioIncluir: TCheckBox
            Left = 100
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 5
          end
          object UsuarioExcluir: TCheckBox
            Left = 214
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 7
          end
          object UsuarioAlterar: TCheckBox
            Left = 155
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 6
          end
          object UsuarioMenu: TCheckBox
            Left = 49
            Top = 33
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 4
          end
          object PaisIncluir: TCheckBox
            Left = 379
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 21
          end
          object PaisExcluir: TCheckBox
            Left = 493
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 23
          end
          object PaisAlterar: TCheckBox
            Left = 434
            Top = 14
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 22
          end
          object PaisMenu: TCheckBox
            Left = 328
            Top = 14
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 20
          end
          object CidadeIncluir: TCheckBox
            Left = 379
            Top = 53
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 29
          end
          object CidadeExcluir: TCheckBox
            Left = 493
            Top = 53
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 30
          end
          object CidadeMenu: TCheckBox
            Left = 328
            Top = 53
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 28
          end
          object UnidadeIncluir: TCheckBox
            Left = 100
            Top = 53
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 9
          end
          object UnidadeExcluir: TCheckBox
            Left = 214
            Top = 53
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 11
          end
          object UnidadeAlterar: TCheckBox
            Left = 155
            Top = 53
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 10
          end
          object UnidadeMenu: TCheckBox
            Left = 49
            Top = 53
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 8
          end
          object GrupoIncluir: TCheckBox
            Left = 100
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 13
          end
          object GrupoExcluir: TCheckBox
            Left = 214
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 15
          end
          object GrupoAlterar: TCheckBox
            Left = 155
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 14
          end
          object GrupoMenu: TCheckBox
            Left = 49
            Top = 72
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 12
          end
          object ProdutoIncluir: TCheckBox
            Left = 100
            Top = 91
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 17
          end
          object ProdutoExcluir: TCheckBox
            Left = 214
            Top = 91
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 19
          end
          object ProdutoAlterar: TCheckBox
            Left = 155
            Top = 91
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 18
          end
          object ProdutoMenu: TCheckBox
            Left = 49
            Top = 91
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 16
          end
          object PessoaIncluir: TCheckBox
            Left = 379
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 32
          end
          object PessoaExcluir: TCheckBox
            Left = 493
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 34
          end
          object PessoaAlterar: TCheckBox
            Left = 434
            Top = 72
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 33
          end
          object PessoaMenu: TCheckBox
            Left = 328
            Top = 72
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 31
          end
          object RichEdit1: TRichEdit
            Left = 280
            Top = 11
            Width = 1
            Height = 100
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'R'
              'i'
              'c'
              'h'
              'E'
              'd'
              'i'
              't'
              '1')
            ParentFont = False
            TabOrder = 35
            Zoom = 100
          end
          object EstadoIncluir: TCheckBox
            Left = 379
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 25
          end
          object EstadoExcluir: TCheckBox
            Left = 493
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 27
          end
          object EstadoAlterar: TCheckBox
            Left = 434
            Top = 33
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 26
          end
          object EstadoMenu: TCheckBox
            Left = 328
            Top = 33
            Width = 47
            Height = 17
            Caption = 'Menu'
            TabOrder = 24
          end
        end
        object GVenda: TGroupBox
          Left = 16
          Top = 176
          Width = 555
          Height = 63
          Caption = 'Venda'
          TabOrder = 4
          object VENDAMANUTENCAO: TCheckBox
            Left = 18
            Top = 13
            Width = 82
            Height = 17
            Caption = 'Manuten'#231#227'o'
            TabOrder = 0
          end
          object VENDAINCLUIR: TCheckBox
            Left = 119
            Top = 13
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 1
          end
          object VENDAALTERAR: TCheckBox
            Left = 188
            Top = 13
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 2
          end
          object VENDAEXCLUIR: TCheckBox
            Left = 259
            Top = 13
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 3
          end
          object VENDAHISTCLI: TCheckBox
            Left = 140
            Top = 34
            Width = 114
            Height = 17
            Caption = 'Hist'#243'rico por cliente'
            TabOrder = 8
          end
          object VENDAHISTVEN: TCheckBox
            Left = 277
            Top = 34
            Width = 130
            Height = 17
            Caption = 'Hist'#243'rico por vendedor'
            TabOrder = 9
          end
          object VENDAHISTNUM: TCheckBox
            Left = 16
            Top = 34
            Width = 119
            Height = 17
            Caption = 'Hist'#243'rico por n'#250'mero'
            TabOrder = 7
          end
          object VENDABAIXAR: TCheckBox
            Left = 416
            Top = 13
            Width = 51
            Height = 17
            Caption = 'Baixar'
            TabOrder = 5
          end
          object VENDAESTORNAR: TCheckBox
            Left = 485
            Top = 13
            Width = 57
            Height = 17
            Caption = 'Estornar'
            TabOrder = 6
          end
          object VENDACONSULTAR: TCheckBox
            Left = 331
            Top = 13
            Width = 69
            Height = 17
            Caption = 'Consultar'
            TabOrder = 4
          end
          object VENDAQTD: TCheckBox
            Left = 414
            Top = 34
            Width = 133
            Height = 17
            Caption = 'Qtde. pedido por cliente'
            TabOrder = 10
          end
        end
        object GCompra: TGroupBox
          Left = 14
          Top = 244
          Width = 555
          Height = 74
          Caption = 'Compra'
          TabOrder = 5
          object COMPRAMANUTENCAO: TCheckBox
            Left = 18
            Top = 20
            Width = 82
            Height = 17
            Caption = 'Manuten'#231#227'o'
            TabOrder = 0
          end
          object COMPRAINCLUIR: TCheckBox
            Left = 119
            Top = 20
            Width = 51
            Height = 17
            Caption = 'Incluir'
            TabOrder = 1
          end
          object COMPRAALTERAR: TCheckBox
            Left = 188
            Top = 20
            Width = 51
            Height = 17
            Caption = 'Alterar'
            TabOrder = 2
          end
          object COMPRAEXCLUIR: TCheckBox
            Left = 259
            Top = 20
            Width = 51
            Height = 17
            Caption = 'Excluir'
            TabOrder = 3
          end
          object COMPRAHISTFOR: TCheckBox
            Left = 142
            Top = 43
            Width = 134
            Height = 17
            Caption = 'Hist'#243'rico por fornecedor'
            TabOrder = 8
          end
          object COMPRAHISTCOM: TCheckBox
            Left = 279
            Top = 43
            Width = 131
            Height = 17
            Caption = 'Hist'#243'rico por comprador'
            TabOrder = 9
          end
          object COMPRAHISTNUM: TCheckBox
            Left = 18
            Top = 43
            Width = 120
            Height = 17
            Caption = 'Hist'#243'rico por n'#250'mero'
            TabOrder = 7
          end
          object COMPRABAIXAR: TCheckBox
            Left = 416
            Top = 22
            Width = 51
            Height = 17
            Caption = 'Baixar'
            TabOrder = 5
          end
          object COMPRAESTORNAR: TCheckBox
            Left = 487
            Top = 22
            Width = 57
            Height = 17
            Caption = 'Estornar'
            TabOrder = 6
          end
          object COMPRACONSULTAR: TCheckBox
            Left = 331
            Top = 20
            Width = 69
            Height = 17
            Caption = 'Consultar'
            TabOrder = 4
          end
          object COMPRAQTD: TCheckBox
            Left = 416
            Top = 45
            Width = 156
            Height = 17
            Caption = 'Qtde. pedido por fornec.'
            TabOrder = 10
          end
        end
        object GEstoque: TGroupBox
          Left = 14
          Top = 325
          Width = 555
          Height = 50
          Caption = 'Estoque'
          TabOrder = 6
          object ESTOQUEPOSICAO: TCheckBox
            Left = 192
            Top = 20
            Width = 118
            Height = 17
            Caption = 'Posi'#231#227'o de estoque'
            TabOrder = 1
          end
          object ESTOQUEHISPRO: TCheckBox
            Left = 332
            Top = 20
            Width = 207
            Height = 17
            Caption = 'Hist'#243'rico de movimenta'#231#227'o por produto'
            TabOrder = 2
          end
          object ESTOQUELANCAMENTO: TCheckBox
            Left = 18
            Top = 20
            Width = 118
            Height = 17
            Caption = 'Lan'#231'amento manual'
            TabOrder = 0
          end
        end
      end
    end
    inherited P2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 587
      ExplicitHeight = 398
      inherited Grid: TDBGrid
        Width = 587
        Height = 364
      end
      inherited PTop: TPanel
        Width = 587
        ExplicitWidth = 587
        inherited Separador1: TRichEdit
          Width = 587
          ExplicitWidth = 587
        end
      end
    end
  end
  inherited ToolBar1: TToolBar
    Top = 462
    Width = 595
    ExplicitTop = 462
    ExplicitWidth = 595
    inherited btn_Imprimir: TToolButton
      OnClick = btn_ImprimirClick
    end
  end
  inherited FDT: TFDTable
    OnCalcFields = FDTCalcFields
    IndexFieldNames = 'PER_CODIGO'
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Perfil'
    TableName = 'VS12019.dbo.Perfil'
    object FDTPER_CODIGO: TFDAutoIncField
      FieldName = 'PER_CODIGO'
      Origin = 'PER_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTPER_STATUS: TStringField
      FieldName = 'PER_STATUS'
      Origin = 'PER_STATUS'
      FixedChar = True
      Size = 1
    end
    object FDTPER_INCLUSAO: TDateField
      FieldName = 'PER_INCLUSAO'
      Origin = 'PER_INCLUSAO'
    end
    object FDTPER_ALTERACAO: TDateField
      FieldName = 'PER_ALTERACAO'
      Origin = 'PER_ALTERACAO'
    end
    object FDTPER_DESCRICAO: TStringField
      FieldName = 'PER_DESCRICAO'
      Origin = 'PER_DESCRICAO'
      Size = 50
    end
    object FDTPER_DIREITOS: TMemoField
      FieldName = 'PER_DIREITOS'
      Origin = 'PER_DIREITOS'
      BlobType = ftMemo
    end
    object FDTSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 7
      Calculated = True
    end
  end
end

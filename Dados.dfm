object D: TD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 178
  Width = 393
  object FDTrans: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Options.DisconnectAction = xdRollback
    Options.EnableNested = False
    Connection = FDCon
    Left = 85
    Top = 16
  end
  object FDCon: TFDConnection
    Params.Strings = (
      'Server=MATHEUS\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'DATABASE=VS12019'
      'MARS=yes'
      'Workstation=NOTEMATHEUSFURL'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    TxOptions.DisconnectAction = xdRollback
    TxOptions.EnableNested = False
    ConnectedStoredUsage = []
    LoginPrompt = False
    Transaction = FDTrans
    Left = 40
    Top = 16
  end
  object TMov: TFDTable
    Connection = FDCon
    Transaction = FDTrans
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Movimento'
    TableName = 'VS12019.dbo.Movimento'
    Left = 88
    Top = 64
    object TMovMov_Produto: TIntegerField
      FieldName = 'Mov_Produto'
      Origin = 'Mov_Produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMovMov_Data: TDateField
      FieldName = 'Mov_Data'
      Origin = 'Mov_Data'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMovMov_Sequencia: TIntegerField
      FieldName = 'Mov_Sequencia'
      Origin = 'Mov_Sequencia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMovMov_TipoDeMovimento: TStringField
      FieldName = 'Mov_TipoDeMovimento'
      Origin = 'Mov_TipoDeMovimento'
      Size = 11
    end
    object TMovMov_SaldoAnterior: TBCDField
      FieldName = 'Mov_SaldoAnterior'
      Origin = 'Mov_SaldoAnterior'
      Precision = 14
      Size = 2
    end
    object TMovMov_SaldoAtual: TBCDField
      FieldName = 'Mov_SaldoAtual'
      Origin = 'Mov_SaldoAtual'
      Precision = 14
      Size = 2
    end
    object TMovMov_Quantidade: TBCDField
      FieldName = 'Mov_Quantidade'
      Origin = 'Mov_Quantidade'
      Precision = 14
      Size = 2
    end
  end
  object TSal: TFDTable
    IndexFieldNames = 'Sal_Produto'
    Connection = FDCon
    Transaction = FDTrans
    UpdateOptions.UpdateTableName = 'VS12019.dbo.Saldo'
    TableName = 'VS12019.dbo.Saldo'
    Left = 88
    Top = 112
    object TSalSal_Produto: TIntegerField
      FieldName = 'Sal_Produto'
      Origin = 'Sal_Produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TSalSal_Reserva: TBCDField
      FieldName = 'Sal_Reserva'
      Origin = 'Sal_Reserva'
      Precision = 14
      Size = 2
    end
    object TSalSal_Encomenda: TBCDField
      FieldName = 'Sal_Encomenda'
      Origin = 'Sal_Encomenda'
      Precision = 14
      Size = 2
    end
    object TSalSal_Saldo: TBCDField
      FieldName = 'Sal_Saldo'
      Origin = 'Sal_Saldo'
      Precision = 14
      Size = 2
    end
  end
  object DSMov: TDataSource
    DataSet = TMov
    Left = 40
    Top = 64
  end
  object DSSal: TDataSource
    DataSet = TSal
    Left = 40
    Top = 112
  end
  object Q: TFDQuery
    Connection = FDCon
    Left = 176
    Top = 128
  end
end

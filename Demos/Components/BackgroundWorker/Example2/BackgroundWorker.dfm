object FibonacciForm: TFibonacciForm
  Left = 0
  Top = 0
  Caption = 'Fibonacci Calculator'
  ClientHeight = 144
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object resultLabel: TLabel
    Left = 183
    Top = 24
    Width = 162
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Color = clInfoBk
    ParentColor = False
    Transparent = False
    Layout = tlCenter
  end
  object startAsyncButton: TButton
    Left = 40
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Start Async'
    TabOrder = 0
    OnClick = startAsyncButtonClick
  end
  object cancelAsyncButton: TButton
    Left = 199
    Top = 88
    Width = 146
    Height = 25
    Caption = 'Cancel Async'
    TabOrder = 1
    OnClick = cancelAsyncButtonClick
  end
  object progressBar1: TProgressBar
    Left = 40
    Top = 65
    Width = 305
    Height = 17
    TabOrder = 2
  end
  object EditValue: TEdit
    Left = 40
    Top = 24
    Width = 137
    Height = 21
    TabOrder = 3
    Text = '42'
  end
  object CnBackgroundWorker1: TCnBackgroundWorker
    WorkerReportsProgress = True
    WorkerSupportsCancellation = True
    OnDoWork = CnBackgroundWorker1DoWork
    OnProgressChanged = CnBackgroundWorker1ProgressChanged
    OnRunWorkerCompleted = CnBackgroundWorker1RunWorkerCompleted
    Left = 328
    Top = 88
  end
end

object frmSerialPort: TfrmSerialPort
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Serial Port Interface'
  Caption = 'Serial Port Interface'
  ClientHeight = 291
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 312
    Top = 216
    Width = 50
    Height = 13
    Caption = 'Send Data'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 169
    Caption = 'COM Serial Port Settings'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 50
      Height = 13
      Caption = 'COM Port:'
    end
    object Label3: TLabel
      Left = 16
      Top = 51
      Width = 54
      Height = 13
      Caption = 'Baud Rate:'
    end
    object Label4: TLabel
      Left = 16
      Top = 79
      Width = 32
      Height = 13
      Caption = 'Parity:'
    end
    object Label5: TLabel
      Left = 16
      Top = 107
      Width = 47
      Height = 13
      Caption = 'Data Bits:'
    end
    object Label6: TLabel
      Left = 16
      Top = 135
      Width = 46
      Height = 13
      Caption = 'Stop Bits:'
    end
    object cmbPortName: TComboBox
      Left = 104
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Select Port Name'
    end
    object cmbBauderate: TComboBox
      Left = 104
      Top = 48
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Select Baude Rate'
      Items.Strings = (
        '1200'
        '2400'
        '4800'
        '9600'
        '19200'
        '38400'
        '57600'
        '115200')
    end
    object cmbParity: TComboBox
      Left = 104
      Top = 76
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'Select Parity'
      Items.Strings = (
        'None'
        'Odd'
        'Even'
        'Mark'
        'Space'
        '')
    end
    object cmbDataBits: TComboBox
      Left = 104
      Top = 104
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'Select Data Bits'
      Items.Strings = (
        '7'
        '8'
        '9')
    end
    object cmbStopBits: TComboBox
      Left = 104
      Top = 132
      Width = 145
      Height = 21
      TabOrder = 4
      Text = 'Select Stop Bits'
      Items.Strings = (
        'None'
        'One'
        'Two'
        'OnePointFive')
    end
  end
  object btnConnect: TButton
    Left = 183
    Top = 216
    Width = 106
    Height = 49
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 183
    Width = 169
    Height = 82
    Caption = 'Data Mode'
    TabOrder = 2
    object rdText: TRadioButton
      Left = 32
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Text'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdHex: TRadioButton
      Left = 32
      Top = 47
      Width = 113
      Height = 17
      Caption = 'Hex'
      TabOrder = 1
    end
  end
  object txtSend: TEdit
    Left = 368
    Top = 213
    Width = 257
    Height = 21
    TabOrder = 3
  end
  object btnSend: TButton
    Left = 469
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Send'
    Enabled = False
    TabOrder = 4
    OnClick = btnSendClick
  end
  object btnClear: TButton
    Left = 550
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = btnClearClick
  end
  object rtxtDataArea: TRichEdit
    Left = 312
    Top = 8
    Width = 313
    Height = 199
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object CnSerialPort1: TCnSerialPort
    OnDataReceived = CnSerialPort1DataReceived
    Left = 480
    Top = 136
  end
end

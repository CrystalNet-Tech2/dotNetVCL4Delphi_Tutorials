object frmEventLog: TfrmEventLog
  Left = 0
  Top = 0
  Caption = 'Event Log'
  ClientHeight = 181
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateEventSource: TButton
    Left = 8
    Top = 16
    Width = 153
    Height = 41
    Caption = 'Create Event Source'
    TabOrder = 0
    OnClick = btnCreateEventSourceClick
  end
  object btnRaiseOnEntryWrittenEvent: TButton
    Left = 192
    Top = 16
    Width = 153
    Height = 41
    Caption = 'Raise OnEntryWritten Event'
    TabOrder = 1
    OnClick = btnRaiseOnEntryWrittenEventClick
  end
  object btnWriteEntry: TButton
    Left = 192
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Write Entry'
    Enabled = False
    TabOrder = 2
    OnClick = btnWriteEntryClick
  end
  object btnStopEvent: TButton
    Left = 270
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Stop Event'
    Enabled = False
    TabOrder = 3
    OnClick = btnStopEventClick
  end
  object CnEventLog1: TCnEventLog
    MachineName = '.'
    Left = 56
    Top = 72
  end
  object CnEventLog2: TCnEventLog
    Log = 'MyNewLog'
    MachineName = '.'
    Source = 'MySource'
    OnEntryWritten = CnEventLog2EntryWritten
    Left = 240
    Top = 112
  end
end

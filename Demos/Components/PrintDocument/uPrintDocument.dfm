object frmPrintDocument: TfrmPrintDocument
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Print Document'
  ClientHeight = 368
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrintPreview: TButton
    Left = 194
    Top = 335
    Width = 88
    Height = 25
    Caption = 'Print Preview'
    TabOrder = 0
    OnClick = btnPrintPreviewClick
  end
  object btnPrint: TButton
    Left = 113
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 1
    OnClick = btnPrintClick
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 16
    Width = 273
    Height = 313
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'The CnPrintDocument '
      'component allows users to '
      'send an output to a printer.')
    ParentFont = False
    TabOrder = 2
  end
  object CnPrintDocument1: TCnPrintDocument
    OnPrintPage = CnPrintDocument1PrintPage
    Left = 72
    Top = 160
  end
  object CnPrintDialog1: TCnPrintDialog
    Document = CnPrintDocument1
    Left = 72
    Top = 240
  end
  object CnPrintPreviewDialog1: TCnPrintPreviewDialog
    Document = CnPrintDocument1
    Left = 184
    Top = 184
  end
end

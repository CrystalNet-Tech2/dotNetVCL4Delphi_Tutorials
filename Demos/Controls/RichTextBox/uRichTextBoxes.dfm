object Form28: TForm28
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '.Net RichTextBox control in Delphi'
  ClientHeight = 360
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CnRichTextBox1: TCnRichTextBox
    Left = 8
    Top = 8
    Width = 433
    Height = 344
    Location.X = 8
    Location.Y = 8
    Size.Width = 433
    Size.Height = 344
    TabOrder = 0
    BackColor.HexCode = 'LightGreen'
    BackColor.Name = 'LightGreen'
    Font.Name = 'Courier New'
    Font.Size = 9.750000000000000000
    Font.Style = [fsBold]
    ForeColor.HexCode = 'Crimson'
    ForeColor.Name = 'Crimson'
    Text = 'Testing.... '#10#10'http://crystalnet-tech.com'
    Lines.Strings = (
      'Testing.... '
      ''
      'http://crystalnet-tech.com')
    ShowSelectionMargin = True
    ZoomFactor = 1.000000000000000000
    OnLinkClicked = CnRichTextBox1LinkClicked
  end
end

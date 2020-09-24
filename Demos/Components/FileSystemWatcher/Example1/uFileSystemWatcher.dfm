object frmFileSystemWatcher: TfrmFileSystemWatcher
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Monitor Files/Folder with .Net FileSystemWatcher'
  ClientHeight = 508
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    495
    508)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Path'
  end
  object Label2: TLabel
    Left = 8
    Top = 102
    Width = 24
    Height = 13
    Caption = 'Filter'
  end
  object btnStart: TButton
    Left = 48
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 129
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 1
    OnClick = btnStopClick
  end
  object GroupBox1: TGroupBox
    Left = 321
    Top = 8
    Width = 166
    Height = 193
    Caption = 'Notify Filter'
    TabOrder = 2
    object chkFilename: TCheckBox
      Left = 24
      Top = 24
      Width = 97
      Height = 17
      Caption = 'FileName'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkFilenameClick
    end
    object chkAttributes: TCheckBox
      Left = 24
      Top = 70
      Width = 97
      Height = 17
      Caption = 'Attributes'
      TabOrder = 1
      OnClick = chkAttributesClick
    end
    object chkDirectoryName: TCheckBox
      Left = 24
      Top = 47
      Width = 97
      Height = 17
      Caption = 'DirectoryName'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkDirectoryNameClick
    end
    object chkCreationTime: TCheckBox
      Left = 24
      Top = 162
      Width = 97
      Height = 17
      Caption = 'Creation Time'
      TabOrder = 3
      OnClick = chkCreationTimeClick
    end
    object chkSize: TCheckBox
      Left = 24
      Top = 93
      Width = 97
      Height = 17
      Caption = 'Size'
      TabOrder = 4
      OnClick = chkSizeClick
    end
    object chkLastAccess: TCheckBox
      Left = 24
      Top = 139
      Width = 97
      Height = 17
      Caption = 'Last Access'
      TabOrder = 5
      OnClick = chkLastAccessClick
    end
    object chkLastWrite: TCheckBox
      Left = 24
      Top = 116
      Width = 97
      Height = 17
      Caption = 'Last Write'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = chkLastWriteClick
    end
  end
  object txtPath: TEdit
    Left = 48
    Top = 8
    Width = 217
    Height = 85
    AutoSize = False
    TabOrder = 3
    Text = 'C:\'
    OnChange = txtPathChange
  end
  object chkIncludeSubDir: TCheckBox
    Left = 48
    Top = 126
    Width = 153
    Height = 17
    Caption = 'Include Subdirectories'
    TabOrder = 4
    OnClick = chkIncludeSubDirClick
  end
  object txtFilter: TEdit
    Left = 48
    Top = 99
    Width = 217
    Height = 21
    TabOrder = 5
    Text = '*.*'
    OnChange = txtFilterChange
  end
  object btnBrowse: TButton
    Left = 271
    Top = 8
    Width = 34
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = btnBrowseClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 207
    Width = 479
    Height = 268
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Log'
    TabOrder = 7
    object MemoLog: TMemo
      Left = 2
      Top = 15
      Width = 475
      Height = 251
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object btnClose: TButton
    Left = 412
    Top = 481
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 8
    OnClick = btnCloseClick
  end
  object CnFileSystemWatcher1: TCnFileSystemWatcher
    Filter = '*.*'
    OnChanged = CnFileSystemWatcher1Changed
    OnCreated = CnFileSystemWatcher1Created
    OnDeleted = CnFileSystemWatcher1Deleted
    OnRenamed = CnFileSystemWatcher1Renamed
    Left = 112
    Top = 176
  end
  object CnFolderBrowserDialog1: TCnFolderBrowserDialog
    Description = 'Select folder path to monitor:'
    ShowNewFolderButton = False
    Left = 272
    Top = 40
  end
end

object fmWWWTool: TfmWWWTool
  Left = 270
  Top = 166
  Width = 702
  Height = 469
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 397
    Top = 0
    Height = 404
    Align = alRight
    Beveled = True
    ResizeStyle = rsUpdate
    Visible = False
  end
  object Browser: TWebBrowser
    Left = 144
    Top = 8
    Width = 249
    Height = 33
    TabStop = False
    TabOrder = 3
    OnDocumentComplete = BrowserDocumentComplete
    ControlData = {
      4C000000BC190000690300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 404
    Width = 694
    Height = 19
    Panels = <>
    SimplePanel = True
    Visible = False
  end
  object pnResults: TPanel
    Left = 400
    Top = 0
    Width = 294
    Height = 404
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object ResSplitter: TSplitter
      Left = 0
      Top = 310
      Width = 294
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      ResizeStyle = rsUpdate
    end
    object sgResults: TStringGrid
      Left = 0
      Top = 0
      Width = 294
      Height = 310
      Align = alClient
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      OnDrawCell = sgResultsDrawCell
      OnMouseDown = sgResultsMouseDown
      RowHeights = (
        24
        24)
    end
    object cbLevel: TComboBox
      Left = 8
      Top = 8
      Width = 49
      Height = 21
      BevelEdges = []
      BevelKind = bkFlat
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      OnChange = cbLevelChange
    end
    object ptmp: TPanel
      Left = 0
      Top = 313
      Width = 294
      Height = 91
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object PageControl: TPageControl
        Left = 0
        Top = 0
        Width = 294
        Height = 91
        ActivePage = tsUsually
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = PageControlChange
        object tsEvenly: TTabSheet
          Caption = #1054#1090#1073#1086#1088#1086#1095#1085#1072#1103
          DesignSize = (
            286
            63)
          object lbLCount: TLabel
            Left = 184
            Top = 0
            Width = 80
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1083#1080#1075
          end
          object vleLevels: TValueListEditor
            Left = 0
            Top = 0
            Width = 169
            Height = 63
            TabStop = False
            Align = alLeft
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            TitleCaptions.Strings = (
              #1051#1080#1075#1072
              #1050#1086#1084#1072#1085#1076)
            ColWidths = (
              113
              52)
          end
          object seLCount: TSpinEdit
            Left = 219
            Top = 19
            Width = 62
            Height = 22
            Anchors = [akTop, akRight]
            MaxValue = 100
            MinValue = 1
            TabOrder = 1
            Value = 3
            OnChange = seLCountChange
          end
          object cbUseNull: TCheckBox
            Left = 184
            Top = 46
            Width = 97
            Height = 17
            Anchors = [akRight, akBottom]
            Caption = #1053#1091#1083#1077#1074#1099#1093' '#1090#1086#1078#1077' '
            TabOrder = 2
            OnClick = cbUseNullClick
          end
        end
        object tsUsually: TTabSheet
          Caption = #1054#1095#1077#1088#1077#1076#1085#1072#1103
          ImageIndex = 1
          object lbBLevel: TLabel
            Left = 8
            Top = 8
            Width = 75
            Height = 13
            Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1083#1080#1075#1072
          end
          object lbCMoveUp: TLabel
            Left = 8
            Top = 38
            Width = 70
            Height = 13
            Caption = #1055#1086#1076#1085#1080#1084#1072#1102#1090#1089#1103
          end
          object lbCMoveDown: TLabel
            Left = 152
            Top = 38
            Width = 63
            Height = 13
            Caption = #1054#1087#1091#1089#1082#1072#1102#1090#1089#1103
          end
          object seCMoveUp: TSpinEdit
            Left = 88
            Top = 35
            Width = 54
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 3
            OnChange = seCMoveUpChange
          end
          object edBLevel: TEdit
            Left = 88
            Top = 3
            Width = 171
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object sbBLevel: TSpinButton
            Left = 261
            Top = 3
            Width = 18
            Height = 21
            Ctl3D = True
            DownGlyph.Data = {
              0E010000424D0E01000000000000360000002800000009000000060000000100
              200000000000D800000000000000000000000000000000000000008080000080
              8000008080000080800000808000008080000080800000808000008080000080
              8000008080000080800000808000000000000080800000808000008080000080
              8000008080000080800000808000000000000000000000000000008080000080
              8000008080000080800000808000000000000000000000000000000000000000
              0000008080000080800000808000000000000000000000000000000000000000
              0000000000000000000000808000008080000080800000808000008080000080
              800000808000008080000080800000808000}
            FocusControl = edBLevel
            ParentCtl3D = False
            TabOrder = 2
            UpGlyph.Data = {
              0E010000424D0E01000000000000360000002800000009000000060000000100
              200000000000D800000000000000000000000000000000000000008080000080
              8000008080000080800000808000008080000080800000808000008080000080
              8000000000000000000000000000000000000000000000000000000000000080
              8000008080000080800000000000000000000000000000000000000000000080
              8000008080000080800000808000008080000000000000000000000000000080
              8000008080000080800000808000008080000080800000808000000000000080
              8000008080000080800000808000008080000080800000808000008080000080
              800000808000008080000080800000808000}
            OnDownClick = sbBLevelDownClick
            OnUpClick = sbBLevelUpClick
          end
          object seCMoveDown: TSpinEdit
            Left = 224
            Top = 35
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 3
            OnChange = seCMoveUpChange
          end
        end
        object tsWithoutly: TTabSheet
          Caption = #1041#1077#1079' '#1083#1080#1075
          ImageIndex = 2
          object lbCaption: TLabel
            Left = 0
            Top = 0
            Width = 286
            Height = 63
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'WWWTool'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -48
            Font.Name = 'Staccato222 BT'
            Font.Style = []
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
        end
      end
    end
  end
  object pnLeft: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 404
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object sgGame: TStringGrid
      Left = 0
      Top = 0
      Width = 397
      Height = 404
      Align = alClient
      ColCount = 2
      DefaultColWidth = 30
      DefaultDrawing = False
      RowCount = 2
      PopupMenu = pmGrid
      TabOrder = 0
      OnClick = sgGameClick
      OnDrawCell = sgGameDrawCell
      OnGetEditText = sgGameGetEditText
      OnKeyPress = sgGameKeyPress
      OnMouseDown = sgGameMouseDown
      OnMouseMove = sgGameMouseMove
      OnMouseUp = sgGameMouseUp
      OnSetEditText = sgGameSetEditText
    end
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 104
    object mGame: TMenuItem
      Caption = #1048#1075#1088#1072
      object mGameName: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077'...'
        ShortCut = 16462
        OnClick = mGameNameClick
      end
      object mSaveState: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
        ShortCut = 16467
        OnClick = mSaveStateClick
      end
      object mLoadState: TMenuItem
        Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100'...'
        OnClick = mLoadStateClick
      end
      object mPrintBlanks: TMenuItem
        Caption = #1041#1083#1072#1085#1082#1080' '#1086#1090#1074#1077#1090#1086#1074'...'
        ShortCut = 16464
        OnClick = mPrintBlanksClick
      end
      object mEmpty1: TMenuItem
        Caption = '-'
      end
      object mClose: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mCloseClick
      end
    end
    object mQuests: TMenuItem
      Caption = #1042#1086#1087#1088#1086#1089#1099
      object mRasminkaExist: TMenuItem
        Caption = #1056#1072#1079#1084#1080#1085#1082#1072
        ShortCut = 16466
        OnClick = mRasminkaExistClick
      end
      object mQCount: TMenuItem
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1086#1087#1088#1086#1089#1086#1074'...'
        ShortCut = 16453
        OnClick = mQCountClick
      end
      object mAddCopy: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1102' '#1088#1072#1091#1085#1076#1072'...'
        OnClick = mAddCopyClick
      end
      object mQErase: TMenuItem
        Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1087#1088#1086#1089'...'
        OnClick = mQEraseClick
      end
      object mEmpty9: TMenuItem
        Caption = '-'
      end
      object mQCost: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072'...'
        ShortCut = 16451
        OnClick = mQCostClick
      end
      object mQCostComm: TMenuItem
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072' '#1082#1086#1084#1072#1085#1076#1099'...'
        OnClick = mQCostCommClick
      end
    end
    object mCommands: TMenuItem
      Caption = #1050#1086#1084#1072#1085#1076#1099
      object mAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
        ShortCut = 45
        OnClick = mAddClick
      end
      object mDelete: TMenuItem
        Caption = #1059#1073#1088#1072#1090#1100'...'
        OnClick = mDeleteClick
      end
      object mJumpTo: TMenuItem
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082'...'
        ShortCut = 16454
        OnClick = mJumpToClick
      end
      object mEmpty2: TMenuItem
        Caption = '-'
      end
      object mToTheEnd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1082#1086#1085#1077#1094
        OnClick = mDrawGridPropClick
      end
      object mJumpTo1: TMenuItem
        Caption = #1055#1077#1088#1077#1093#1086#1076#1080#1090#1100' '#1082' '#1074#1086#1087#1088#1086#1089#1091' '#8470'1'
        Checked = True
        OnClick = mDrawGridPropClick
      end
      object mJumpThenCheck: TMenuItem
        Caption = #1055#1086#1084#1077#1095#1072#1090#1100' '#1087#1086#1089#1083#1077' '#1087#1077#1088#1077#1093#1086#1076#1072
        Enabled = False
        OnClick = mDrawGridPropClick
      end
      object mEmpty3: TMenuItem
        Caption = '-'
      end
      object mLoadComms: TMenuItem
        Tag = 1
        Caption = #1048#1079#1074#1077#1089#1090#1085#1099#1077' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1080#1079'...'
        ShortCut = 16472
        OnClick = mLoadCommsClick
      end
    end
    object mResults: TMenuItem
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      object mResult: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        ShortCut = 116
        OnClick = mResultClick
      end
      object mPlaceType: TMenuItem
        Caption = #1054#1076#1080#1085' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' - '#1086#1076#1085#1086' '#1084#1077#1089#1090#1086
        OnClick = mPlaceTypeClick
      end
      object mUpdateResults: TMenuItem
        Tag = 1
        Caption = #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
        Checked = True
        OnClick = mDrawGridPropClick
      end
      object mEmpty4: TMenuItem
        Caption = '-'
      end
      object mSum: TMenuItem
        Caption = #1048#1090#1086#1075#1080' '#1087#1086' '#1080#1075#1088#1072#1084'...'
        ShortCut = 118
        OnClick = mSumClick
      end
      object mEmpty5: TMenuItem
        Caption = '-'
      end
      object mExport: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1055#1077#1088#1074#1077#1085#1089#1090#1074#1086'...'
        Enabled = False
        OnClick = mExportClick
      end
    end
    object mParams: TMenuItem
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      object mTFCheck: TMenuItem
        Caption = #1055#1086#1084#1077#1095#1072#1090#1100' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1077
        OnClick = mTFCheckClick
      end
      object mAllowEmptyAnswers: TMenuItem
        AutoCheck = True
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1091#1089#1090#1099#1077' '#1082#1083#1077#1090#1082#1080
        OnClick = mAllowEmptyAnswersClick
      end
      object mRoundLength: TMenuItem
        Tag = 4
        Caption = #1044#1083#1080#1085#1072' '#1088#1072#1091#1085#1076#1072'...'
        OnClick = mRoundLengthClick
      end
      object mEmpty6: TMenuItem
        Caption = '-'
      end
      object mScanerMode: TMenuItem
        Tag = 1
        AutoCheck = True
        Caption = #1056#1077#1078#1080#1084' '#1089#1082#1072#1085#1077#1088#1072
        Checked = True
        OnClick = mScanerModeClick
      end
      object mShowNames: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1082#1086#1084#1072#1085#1076
        OnClick = mShowNamesClick
      end
      object mShowCost: TMenuItem
        AutoCheck = True
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
        OnClick = mShowCostClick
      end
      object mShowRating: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1077#1081#1090#1080#1085#1075
        Checked = True
        OnClick = mDrawGridPropClick
      end
      object mShowAnss: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1090#1074#1077#1090#1086#1074
        OnClick = mShowAnssClick
      end
      object mShowFocus: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1092#1086#1082#1091#1089' '#1074#1074#1086#1076#1072
        Checked = True
        Visible = False
        OnClick = mDrawGridPropClick
      end
      object mStatusBar: TMenuItem
        Caption = #1057#1090#1088#1086#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
        OnClick = mStatusBarClick
      end
      object mEmpty7: TMenuItem
        Caption = '-'
      end
      object mTimerLength: TMenuItem
        Tag = 60
        Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1074#1088#1077#1084#1077#1085#1080'...'
        OnClick = mTimerLengthClick
      end
    end
    object mHelp: TMenuItem
      Caption = '?'
      object mHTMLHelp: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072'...'
        ShortCut = 112
        OnClick = mHTMLHelpClick
      end
      object mEmpty8: TMenuItem
        Caption = '-'
      end
      object mMail: TMenuItem
        Caption = #1055#1080#1089#1100#1084#1086' '#1072#1074#1090#1086#1088#1072#1084
        Visible = False
        OnClick = mMailClick
      end
      object mGNUGPL: TMenuItem
        Caption = 'GNU General Public License'
        OnClick = mGNUGPLClick
      end
      object mruGNUGPL: TMenuItem
        Caption = #1056#1091#1089#1089#1082#1080#1081' '#1087#1077#1088#1077#1074#1086#1076' GNU GPL'
        OnClick = mruGNUGPLClick
      end
      object mAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = mAboutClick
      end
    end
    object mTime: TMenuItem
      Caption = #1042#1088#1077#1084#1103'!'
      ShortCut = 120
      OnClick = mTimeClick
    end
  end
  object HTMLCreator: THTMLCreator
    OnGetValue = HTMLCreatorGetValue
    Left = 40
    Top = 104
  end
  object SaveDialog: TSaveDialog
    Filter = 
      #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1080#1075#1088#1099' WWWTool|*.state|'#1055#1088#1086#1090#1086#1082#1086#1083' '#1080#1075#1088#1099' (HTML '#1092#1072#1081#1083#1099')|*.html' +
      ';*.htm|'#1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1075#1088#1099' (HTML '#1092#1072#1081#1083#1099')|*.html;*.htm'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 72
    Top = 104
  end
  object OpenResult: TOpenDialog
    Filter = 
      #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1075#1088' WWWTool|*.html|HTM '#1092#1072#1081#1083#1099'|*.html;*.htm|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*' +
      '.*'
    Left = 104
    Top = 104
  end
  object pmGrid: TPopupMenu
    AutoPopup = False
    Left = 136
    Top = 104
    object pmCommName: TMenuItem
      Enabled = False
    end
    object mPrivQCost: TMenuItem
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1074#1086#1087#1088#1086#1089#1072'...'
      OnClick = mPrivQCostClick
    end
    object mEmpty: TMenuItem
      Caption = '-'
    end
    object mComp: TMenuItem
      Caption = #1042' '#1079#1072#1095#1077#1090
      OnClick = mCompClick
    end
    object mNotComp: TMenuItem
      Caption = #1053#1077' '#1074' '#1079#1072#1095#1077#1090
      OnClick = mNotCompClick
    end
  end
  object OpenState: TOpenDialog
    DefaultExt = 'state'
    Filter = #1057#1086#1089#1090#1086#1103#1085#1080#1103' '#1080#1075#1088#1099' WWWTool|*.state|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Title = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1080#1075#1088#1099
    Left = 104
    Top = 136
  end
  object sdExport: TSaveDialog
    DefaultExt = '1'
    Filter = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1041#1086#1083#1100#1096#1086#1081' '#1080#1075#1088#1099'|*.1'
    Left = 72
    Top = 136
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 168
    Top = 104
  end
  object ScanerTimer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = ScanerTimerTimer
    Left = 168
    Top = 136
  end
end

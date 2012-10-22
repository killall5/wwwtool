object fmSum: TfmSum
  Left = 192
  Top = 107
  Width = 723
  Height = 504
  Caption = #1055#1086#1076#1074#1077#1076#1077#1085#1080#1077' '#1080#1090#1086#1075#1086#1074
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object wbHiddenPrev: TWebBrowser
    Left = 352
    Top = 0
    Width = 336
    Height = 434
    TabOrder = 0
    OnDocumentComplete = wbHiddenPrevDocumentComplete
    ControlData = {
      4C000000BA220000DB2C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126200000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object sgSum: TStringGrid
    Left = 0
    Top = 0
    Width = 715
    Height = 450
    Align = alClient
    BorderStyle = bsNone
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Left = 40
    Top = 8
    object mResults: TMenuItem
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      object mAddResult: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090'...'
        ShortCut = 45
        OnClick = mAddResultClick
      end
      object mDelCol: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1086#1083#1073#1077#1094
        OnClick = mDelColClick
      end
      object mDelRow: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        OnClick = mDelRowClick
      end
      object mEmpty1: TMenuItem
        Caption = '-'
      end
      object mLoadSum: TMenuItem
        Tag = 1
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1090#1086#1075#1080'...'
        ShortCut = 16463
        OnClick = mAddResultClick
      end
      object mSaveSum: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1090#1086#1075#1080'...'
        ShortCut = 16467
        OnClick = mSaveSumClick
      end
      object mEmpty2: TMenuItem
        Caption = '-'
      end
      object mClose: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = mCloseClick
      end
    end
  end
  object OpenResult: TOpenDialog
    Filter = 
      #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1075#1088' WWWTool|*.html|HTM '#1092#1072#1081#1083#1099'|*.html;*.htm|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*' +
      '.*'
    Left = 8
    Top = 8
  end
  object HTMLCreator: THTMLCreator
    OnGetValue = HTMLCreatorGetValue
    Left = 72
    Top = 8
  end
  object SaveTotals: TSaveDialog
    DefaultExt = 'html'
    Filter = #1060#1072#1081#1083#1099' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074'|*.html'
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1080#1090#1086#1075#1086#1074' '#1075#1086#1076#1072
    Left = 104
    Top = 8
  end
end

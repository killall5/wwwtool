unit unMain;
(*
    WWWTool - "What? Where? When?" Tool -
    Инструмент для проведения игр рода "Что? Где? Когда?"
    Copyright (C) 2004-2007, Тамаревская Анна Георгиевна и Тамаревский Алексей

    This file is free software, and not subject to GNU Public License
    restrictions; you can redistribute it and/or modify it in any way
    you see fit. This file is suitable for inclusion in a derivative
    work, regardless of license on the work or availability of source code
    to the work. If you redistribute this file, you must leave this
    header intact.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    С авторами данной программы можно связаться по адресу mirror@lyceum.nstu.ru.
*)
{$WEAKPACKAGEUNIT ON}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, ExtCtrls, ValEdit, StdCtrls, Spin, HTMLCreator,
  OleCtrls, SHDocVw;

type
  TfmWWWTool = class(TForm)
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    mCommands: TMenuItem;
    mAdd: TMenuItem;
    mParams: TMenuItem;
    mClose: TMenuItem;
    mResult: TMenuItem;
    mStatusBar: TMenuItem;
    mShowNames: TMenuItem;
    pnResults: TPanel;
    sgResults: TStringGrid;
    Splitter: TSplitter;
    cbLevel: TComboBox;
    HTMLCreator: THTMLCreator;
    SaveDialog: TSaveDialog;
    ResSplitter: TSplitter;
    mShowRating: TMenuItem;
    mShowFocus: TMenuItem;
    mUpdateResults: TMenuItem;
    mShowAnss: TMenuItem;
    mGameName: TMenuItem;
    mJumpTo: TMenuItem;
    mEmpty1: TMenuItem;
    mHelp: TMenuItem;
    mAbout: TMenuItem;
    mSum: TMenuItem;
    mEmpty4: TMenuItem;
    mTFCheck: TMenuItem;
    mMail: TMenuItem;
    ptmp: TPanel;
    PageControl: TPageControl;
    tsEvenly: TTabSheet;
    lbLCount: TLabel;
    vleLevels: TValueListEditor;
    seLCount: TSpinEdit;
    cbUseNull: TCheckBox;
    tsUsually: TTabSheet;
    lbBLevel: TLabel;
    lbCMoveUp: TLabel;
    seCMoveUp: TSpinEdit;
    edBLevel: TEdit;
    sbBLevel: TSpinButton;
    tsWithoutly: TTabSheet;
    mLoadComms: TMenuItem;
    OpenResult: TOpenDialog;
    Browser: TWebBrowser;
    lbCaption: TLabel;
    mGame: TMenuItem;
    mResults: TMenuItem;
    mPlaceType: TMenuItem;
    mEmpty6: TMenuItem;
    mEmpty2: TMenuItem;
    mDelete: TMenuItem;
    lbCMoveDown: TLabel;
    seCMoveDown: TSpinEdit;
    pmGrid: TPopupMenu;
    mComp: TMenuItem;
    mNotComp: TMenuItem;
    mSaveState: TMenuItem;
    mLoadState: TMenuItem;
    OpenState: TOpenDialog;
    mGNUGPL: TMenuItem;
    mruGNUGPL: TMenuItem;
    sdExport: TSaveDialog;
    mEmpty5: TMenuItem;
    mExport: TMenuItem;
    mTime: TMenuItem;
    Timer: TTimer;
    mEmpty7: TMenuItem;
    mTimerLength: TMenuItem;
    mHTMLHelp: TMenuItem;
    mEmpty8: TMenuItem;
    mJumpTo1: TMenuItem;
    mJumpThenCheck: TMenuItem;
    mEmpty3: TMenuItem;
    pnLeft: TPanel;
    sgGame: TStringGrid;
    mRoundLength: TMenuItem;
    pmCommName: TMenuItem;
    mEmpty: TMenuItem;
    ScanerTimer: TTimer;
    mScanerMode: TMenuItem;
    mPrintBlanks: TMenuItem;
    mToTheEnd: TMenuItem;
    mAllowEmptyAnswers: TMenuItem;
    mShowCost: TMenuItem;
    mQuests: TMenuItem;
    mRasminkaExist: TMenuItem;
    mQCount: TMenuItem;
    mQErase: TMenuItem;
    mQCost: TMenuItem;
    mAddCopy: TMenuItem;
    mQCostComm: TMenuItem;
    mEmpty9: TMenuItem;
    mPrivQCost: TMenuItem;
    procedure mAddClick(Sender: TObject);
    procedure mQCountClick(Sender: TObject);
    procedure sgGameMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgGameDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure mStatusBarClick(Sender: TObject);
    procedure sgGameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mCloseClick(Sender: TObject);
    procedure mResultClick(Sender: TObject);
    procedure seLCountChange(Sender: TObject);
    procedure cbUseNullClick(Sender: TObject);
    procedure sgResultsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbLevelChange(Sender: TObject);
    procedure HTMLCreatorGetValue(Sender: TObject; Name: String;
      var Value: String);
    procedure mDrawGridPropClick(Sender: TObject);
    procedure mShowNamesClick(Sender: TObject);
    procedure mShowAnssClick(Sender: TObject);
    procedure sgGameKeyPress(Sender: TObject; var Key: Char);
    procedure sgResultsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure mGameNameClick(Sender: TObject);
    procedure mJumpToClick(Sender: TObject);
    procedure mRasminkaExistClick(Sender: TObject);
    procedure mAboutClick(Sender: TObject);
    procedure mSumClick(Sender: TObject);
    procedure sbBLevelUpClick(Sender: TObject);
    procedure sbBLevelDownClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure mTFCheckClick(Sender: TObject);
    procedure sgGameSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sgGameGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure sgGameClick(Sender: TObject);
    procedure mMailClick(Sender: TObject);
    procedure seCMoveUpChange(Sender: TObject);
    procedure mLoadCommsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BrowserDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure mPlaceTypeClick(Sender: TObject);
    procedure mDeleteClick(Sender: TObject);
    procedure mCompClick(Sender: TObject);
    procedure mNotCompClick(Sender: TObject);
    procedure mSaveStateClick(Sender: TObject);
    procedure mLoadStateClick(Sender: TObject);
    procedure sgGameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mGNUGPLClick(Sender: TObject);
    procedure mruGNUGPLClick(Sender: TObject);
    procedure mExportClick(Sender: TObject);
    procedure mTimeClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure mTimerLengthClick(Sender: TObject);
    procedure mHTMLHelpClick(Sender: TObject);
    procedure mQEraseClick(Sender: TObject);
    procedure mRoundLengthClick(Sender: TObject);
    procedure ScanerTimerTimer(Sender: TObject);
    procedure mScanerModeClick(Sender: TObject);
    procedure mPrintBlanksClick(Sender: TObject);
    procedure mQCostClick(Sender: TObject);
    procedure mShowCostClick(Sender: TObject);
    procedure mAllowEmptyAnswersClick(Sender: TObject);
    procedure mAddCopyClick(Sender: TObject);
    procedure mQCostCommClick(Sender: TObject);
    procedure mPrivQCostClick(Sender: TObject);
  private
    WM_WWWTOOL_SCANER: Cardinal;
    MousePress: Boolean;
    cmdList: TStringList;
    StoredValue: integer;
    Scaner: String;
    function WWWToolScanerEndRead(var info: TMessage): boolean;
    procedure SetUniformLevels;
    procedure SetUsualLevels(BaseLevel: integer);
    procedure CountLevels;
    function ColorInd(Row: integer): integer;
    procedure ChangeCost(Question: integer; command: integer = 0);
    function AddCommQuery(var CName: string; var CDesk: integer; var Competition: boolean): boolean;
    function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean; overload;
    function InputQuery(const ACaption, APrompt: string; var iValue: integer; const iMaxValue: integer = 0): Boolean; overload;
  public
    function Row2Desk(ARow: integer): integer;
    function Desk2Row(Desk: integer): integer;
    function DeskExist(Desk: integer): boolean;
    function comCount: integer;
    function Cost(ind, Question: integer; command: integer = 0): integer;
    function Rating(Question: integer): integer;
    // Имя лиги по ее номеру: -1 нет лиги, 0 высшая, 1 первая...
    function GetLevelName(Level: integer): String;
    // существует ли разминка? 0 = нет, 1 = да
    function RE: integer;
    // пересчет результатов игры
    procedure UpdateResults(force: boolean);
    function MaxComNameWidth: integer;
    procedure procSaveState(const FileName: String);
    procedure procLoadState(const FileName: String);
    procedure seKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  end;

var
  fmWWWTool: TfmWWWTool;

{$R WindowsXP.res}

implementation
uses unSum, math, ShellAPI, unAddCommand, unPrintBlank, StrUtils, unQCost;

const
  ID_STR = 'WWWTool v0.5';
  ANS_RIGHT = '+';
  ANS_WRONG = '-';
  ColorSet: array[0..2] of TColor = ($00F0F0F0, $00FFDDDD, $00DDFFDD);
  HTMLColorSet: array[0..2] of ShortString = ('#F0F0F0', '#DDDDFF', '#DDFFDD');

{$R *.dfm}

// функция, аналогичная InputQuery из Dialogs, списанная оттуда же, но только
// вместо обычной формы берет форму из проекта fmAddCommand.
// CName - введенное название команды, CDesk - номер столика,
// CCompetition - в зачет ли играет команда.
// функция возвращает true, если пользователь нажал "добавить"

// в форме fmAddCommand присутствует cbComName: TComboBox, в Items которого
// берутся загружаемые команды

function TfmWWWTool.AddCommQuery(var CName: string; var CDesk: integer; var Competition: boolean): boolean;
var
  done, editmode: boolean;
  pos_: integer;
begin
  editmode:= (trim(CName) <> '') and (CDesk <> 0);

  if editmode then
    fmAddCommand.Caption:= 'Изменить команду'
  else
    fmAddCommand.Caption:= 'Добавить команду';

  if not editmode then
    if mToTheEnd.Checked then
      CDesk:= Row2Desk(sgGame.FixedRows + comCount - 1) + 1
    else begin
      CDesk:= 1;
      done:= false;

      // ищу первый незанятый столик
      repeat
        if DeskExist(CDesk) then
          inc(CDesk)
        else
          done:= true;

        // если найденный номер столика перевалил за количество команд, то останавливаюсь
        if CDesk > comCount then
          done:= true

      until done;
    end;

  with fmAddCommand do begin
    cbComName.Items.Assign(cmdList);
    cbComName.Text:= CName;

    seDesk.Value:= CDesk;
    if editmode then
      cbCompetition.Checked:= Competition
    else
      // по умолчанию - команда в зачет
      cbCompetition.Checked:= true;

    Position:= poMainFormCenter;

    if ShowModal = mrOk then begin
      if cbComName.ItemIndex = -1 then
        CName:= cbComName.Text
      else begin
        CName:= cbComName.Items[cbComName.ItemIndex];
        // удаляю команду из списка существующих
        cmdList.Delete(cbComName.ItemIndex);
      end;

      // удаляю служебные символы " | "
      pos_:= pos(' | ', CName);
      if pos_ > 0 then
        CName:= copy(CName, 1, pos_-1);

      CDesk:= seDesk.Value;
      Competition:= cbCompetition.Checked;

      Result:= true
    end else
      Result:= false
  end;
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

// функция, аналогичная InputQuery, но по-русски

function TfmWWWTool.InputQuery(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result:= False;
  Form:= TForm.Create(Application);
  with Form do
    try
      Canvas.Font:= Font;
      DialogUnits:= GetAveCharSize(Canvas);
      BorderStyle:= bsDialog;
      Caption:= ACaption;
      ClientWidth:= MulDiv(180, DialogUnits.X, 4);
      Position:= poScreenCenter;
      Prompt:= TLabel.Create(Form);
      with Prompt do begin
        Parent:= Form;
        Caption:= APrompt;
        Left:= MulDiv(8, DialogUnits.X, 4);
        Top:= MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth:= MulDiv(164, DialogUnits.X, 4);
        WordWrap:= True
      end;
      Edit:= TEdit.Create(Form);
      with Edit do begin
        Parent:= Form;
        Left:= Prompt.Left;
        Top:= Prompt.Top + Prompt.Height + 5;
        Width:= MulDiv(164, DialogUnits.X, 4);
        MaxLength:= 255;
        Text:= Value;
        SelectAll
      end;
      ButtonTop:= Edit.Top + Edit.Height + 15;
      ButtonWidth:= MulDiv(50, DialogUnits.X, 4);
      ButtonHeight:= MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do begin
        Parent:= Form;
        Caption:= 'Да';
        ModalResult:= mrOk;
        Default:= True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight)
      end;
      with TButton.Create(Form) do begin
        Parent:= Form;
        Caption:= 'Нет';
        ModalResult:= mrCancel;
        Cancel:= True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15, ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13
      end;
      if ShowModal = mrOk then begin
        Value:= Edit.Text;
        Result:= True
      end
    finally
      Form.Free
    end
end;

procedure TfmWWWTool.seKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ((Sender as TControl).Parent as TForm).ModalResult:= mrOk
  else
    if Key = VK_ESCAPE then
      ((Sender as TControl).Parent as TForm).ModalResult:= mrCancel
end;

// функция, аналогичная InputQuery, но для ввода чисел

function TfmWWWTool.InputQuery(const ACaption, APrompt: string;
  var iValue: integer; const iMaxValue: integer = 0): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TSpinEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result:= False;
  Form:= TForm.Create(Application);
  with Form do
    try
      Canvas.Font:= Font;
      Font.Name:= 'Tahoma';
      DialogUnits:= GetAveCharSize(Canvas);
      BorderStyle:= bsDialog;
      Caption:= ACaption;
      ClientWidth:= MulDiv(180, DialogUnits.X, 4);
      Position:= poScreenCenter;
      Prompt:= TLabel.Create(Form);
      with Prompt do begin
        Parent:= Form;
        Caption:= APrompt;
        Left:= MulDiv(8, DialogUnits.X, 4);
        Top:= MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth:= MulDiv(164, DialogUnits.X, 4);
        WordWrap:= True
      end;
      Edit:= TSpinEdit.Create(Form);
      with Edit do begin
        Parent:= Form;
        Left:= Prompt.Left;
        Top:= Prompt.Top + Prompt.Height + 5;
        Width:= MulDiv(164, DialogUnits.X, 4);
        Value:= iValue;
        OnKeyDown:= seKeyDown;
        MinValue:= 0;
        if iMaxValue <> 0 then
          MaxValue:= iMaxValue
        else
          MaxValue:= MaxInt;
        SelectAll;
      end;
      ButtonTop:= Edit.Top + Edit.Height + 15;
      ButtonWidth:= MulDiv(50, DialogUnits.X, 4);
      ButtonHeight:= MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do begin
        Parent:= Form;
        Caption:= 'Да';
        ModalResult:= mrOk;
        Default:= True; // ?
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do begin
        Parent:= Form;
        Caption:= 'Нет';
        ModalResult:= mrCancel;
        Cancel:= True; // ?
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight:= Top + Height + 13;
      end;
      if ShowModal = mrOk then begin
        iValue:= Edit.Value;
        Result:= True;
      end;
    finally
      Form.Free;
    end;
end;

// возвращает номер столика по строке

function TfmWWWTool.Row2Desk(ARow: integer): integer;
var
  pos_: integer;
begin
  pos_:= Pos(' ', sgGame.Cells[0, ARow]);
  if pos_ > 0 then
    Result:= abs(StrToInt(Copy(sgGame.Cells[0, ARow], 1, pos_-1)))
  else
    Result:= 0
end;

// Количество строк в sgGame, первый столбик у которых не пустая строка

function TfmWWWTool.comCount: integer;
begin
  Result:= sgGame.RowCount - sgGame.FixedRows;
  if sgGame.Cells[0, sgGame.FixedRows-1 + Result] = '' then
    dec(Result)
end;

function TfmWWWTool.Cost(ind, Question: integer; command: integer = 0): integer;
var
  tmp: string;
  ltmp, spcount, i, sign: integer;
begin
  tmp:= sgGame.Cells[sgGame.FixedCols + RE + Question - 1, command];
  ltmp:= length(tmp);
  i:= 1;
  spcount:= 0;
  while (i <= ltmp) and (spcount <= ind) do begin
    if tmp[i] = ' ' then
      inc(spcount);
    inc(i)
  end;

  if i = ltmp + 1 then
    if ind = 0 then
      Result:= 1
    else
      Result:= 0
  else begin
    if tmp[i] = '-' then begin
      sign:= -1;
      inc(i);
      if i = ltmp + 1 then begin
        Result:= 0;
        exit
      end;
    end else
      sign:= 1;

    Result:= 0;
    while (i <= ltmp) and (tmp[i] <> ' ') do begin
      Result:= Result*10 + ord(tmp[i]) - ord('0');
      inc(i);
    end;

    Result:= Result*sign
  end;

end;

function TfmWWWTool.Rating(Question: integer): integer;
var
  pos_: integer;
begin
  pos_:= Pos(' ', sgGame.Cells[sgGame.FixedCols + RE + Question - 1, 0]);
  if pos_ = 0 then
    Result:= StrToIntDef(sgGame.Cells[sgGame.FixedCols + RE + Question - 1, 0], 0)
  else
    Result:= StrToIntDef(Copy(sgGame.Cells[sgGame.FixedCols + RE + Question - 1, 0], 1, pos_ - 1), 0)
end;

function Answer(str: string): string;
var
  i, l: integer;
begin
  l:= length(str);
  i:= 1;
  Result:= '';
  while (i <= l) and (str[i] <> ' ') do begin
    Result:= Result + str[i];
    inc(i)
  end;
end;

function Tail(str: string): string;
var
  pos_: integer;
begin
  pos_:= pos(' ', str);

  if pos_ = 0 then
    result:= ''
  else
    result:= copy(str, pos_, length(str))
end;

// Разминка существует?

function TfmWWWTool.RE: integer;
begin
  if mRasminkaExist.Checked then
    Result:= 1
  else
    Result:= 0
end;

// функция быстрого поиска в упорядоченном массиве номеров столика
// бинарный поиск.

function TfmWWWTool.Desk2Row(Desk: integer): integer;
var
  a, b: integer;
begin
  a:= sgGame.FixedRows;
  b:= comCount + sgGame.FixedRows;

  while a < b do begin
    Result:= (a + b) div 2;

    if Row2Desk(Result) < Desk then
      a:= Result + 1
    else
      b:= Result
  end;

  Result:= a
end;

// занят ли столик

function TfmWWWTool.DeskExist(Desk: integer): boolean;
begin
  Result:= Row2Desk(Desk2Row(Desk)) = Desk
end;

// работа с сообщениями
function TfmWWWTool.WWWToolScanerEndRead(var info: TMessage): boolean;
var
  row: integer;
  ch: char;
begin
  Result:= info.Msg = WM_WWWTOOL_SCANER;
  if Result then begin
    row:= Desk2Row(info.WParam);

    if (Row2Desk(row) = info.WParam) and (info.LParam >= 0) then try
      sgGame.Row:= row;
      if info.LParam <> 0 then
        sgGame.Col:= info.LParam + RE;
      ch:= ' ';
      sgGameKeyPress(sgGame, ch);
    except
    end
  end;
end;

// Добавление новой команды с проверкой на существование такой команды или столика.
// Если команда пришла позже начала, ответы на прозвучавшие вопросы ей не засчитываются.
// Можно вводить не переставая

procedure TfmWWWTool.mAddClick(Sender: TObject);
var CName, Str: String;
    i, j, CDesk, found: integer;
    CComp: boolean;
begin
  CName:= '';
  CDesk:= 0;
  while AddCommQuery(CName, CDesk, CComp) do with sgGame do begin

    found:= Desk2Row(CDesk);

    if DeskExist(CDesk) then begin
      MessageBox(handle, PAnsiChar(format('Столик №%d уже занят командой "%s".'#13#13'Выберите новый столик для команды', [CDesk, Copy(sgGame.Cells[0, found], 1+Length(IntToStr(CDesk))+2, Length(sgGame.Cells[0, found]))])), 'Занято', MB_OK or MB_ICONERROR);
      continue
    end;

    // поиск команды среди уже участвующих
    found:= 0;
    for i:= 1 to comCount do begin
      Str:= AnsiUpperCase(Cells[0, FixedRows + i - 1]);
      Str:= Copy(Str, Pos(' ', Str) + 1, Length(Str));
      if Str = AnsiUpperCase(CName) then
        found:= i;
    end;

    if found > 0 then
      MessageBox(handle, PAnsiChar(format('Команда с названием "%s" уже существует и зарегистрирована: '#13#13'Cтолик №%d.'#13#13'Необходимо придумать новое название команде', [CName, Row2Desk(found)])),
                 'Ошибка: Повторение названий команд', MB_OK + MB_ICONERROR)
    else if CName = '' then
      MessageBox(handle, 'Необходимо придумать новое название команде: оно не может быть пустым', 'Ошибка: нет названия', MB_OK + MB_ICONERROR)
    else begin // добавляю новую команду
      found:= Desk2Row(CDesk);
      RowCount:= FixedRows + comCount + 1;

      for j:= RowCount-1 downto found+1 do
        for i:= 0 to ColCount-1 do
          Cells[i, j]:= Cells[i, j-1];

      if CComp then
        // у команд в зачет столики с лидирующим плюсом
        Cells[0, found]:= '+' + IntToStr(CDesk) + ' ' + CName
      else
        // у команд вне зачета - столики отрицательные
        Cells[0, found]:= '-' + IntToStr(CDesk) + ' ' + CName;

      // отмечаю как неверные вопросы те, на которые команда опоздала
      for i:= FixedCols + RE to ColCount-1 do begin
        if Rating(i - FixedCols - RE + 1) > 0 then begin
          // рейтинг увеличивается за счет новой "неответившей" команды
            sgGame.Cells[i, 0]:= format('%d %d %d %d', [Rating(i - sgGame.FixedCols - RE + 1) + 1, Cost(0, i - sgGame.FixedCols - RE + 1),
              Cost(1, i - sgGame.FixedCols - RE + 1), Cost(2, i - sgGame.FixedCols - RE + 1)]);
          if mAllowEmptyAnswers.Checked then
            Cells[i, found]:= ''
          else
            Cells[i, found]:= ANS_WRONG
        end else
          Cells[i, found]:= '';
      end;

      // если есть разминка, команде она не засчитывается
      if RE = 1 then
        Cells[FixedCols, found]:= '';

      // и в столбик "ПО" - правильных ответов у команды 0
      if mShowAnss.Checked then
        Cells[FixedCols-1, found]:= '0';

      Repaint;

      UpdateResults(false);
      CName:= ''
    end
  end;
end;

// изменение количества вопросов в игре с пересчетом количества правильных
// ответов у команд

procedure TfmWWWTool.mQCountClick(Sender: TObject);
var
  i, j, QCount, oldRC: integer;
begin
  // надо запомнить старое количество вопросов
  oldRC:= sgGame.ColCount - sgGame.FixedCols - RE;
  QCount:= oldRC;
  if InputQuery('Количество вопросов', 'Введите новое количество вопросов', QCount, 0) then with sgGame do begin
    sgGame.ColCount:= QCount + FixedCols + RE;

    // Обнуление новых вопросов, если вопросов стало больше
    for i:= oldRC + FixedCols + RE to ColCount-1 do
      // по столбцу
      for j:= FixedRows to RowCount-1 do
        sgGame.Cells[i, j]:= '';

    // Нужно пересчитать количество правильных ответов
    if mShowAnss.Checked then with sgGame do
      for j:= FixedRows to RowCount-1 do begin
        Cells[FixedCols-1, j]:= IntToStr(RE*StrToIntDef(Cells[FixedCols, j], 0));
        for i:= FixedCols + RE to ColCount-1 do
          if Answer(Cells[i, j]) = ANS_RIGHT then
            Cells[FixedCols-1, j]:= IntToStr(StrToInt(sgGame.Cells[FixedCols-1, j]) + 1)
      end;
  end;
  sgGame.Repaint;

  UpdateResults(false)
end;

procedure TfmWWWTool.mQEraseClick(Sender: TObject);
var
  i, Quest: integer;
begin
  Quest:= 0;
  if InputQuery('Аннулировать вопрос', 'Введите номер вопроса', Quest, sgGame.ColCount - sgGame.FixedCols - RE) then with sgGame do begin
    if Quest = 0 then exit;

    for i:= 1 to sgGame.RowCount-1 do begin
      if mShowAnss.Checked then
        if Answer(Cells[Quest + RE  + FixedCols - 1, i]) = ANS_RIGHT then
          Cells[FixedCols-1, i]:= IntToStr(StrToInt(Cells[FixedCols-1, i])-1);

      Cells[Quest + RE  + FixedCols - 1, i]:= tail(Cells[Quest + RE  + FixedCols - 1, i]);
    end;
    // и уничтожаем рейтинг, сохраняя цену вопроса
    sgGame.Cells[Quest + RE + FixedCols - 1, 0]:= format('%d %d %d %d', [0, Cost(0, Quest), Cost(1, Quest), Cost(2, Quest)]);

    sgGame.Repaint;

    UpdateResults(false)
  end
end;

procedure TfmWWWTool.sgGameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: integer;
begin
  try
    sgGame.MouseToCell(X, Y, ACol, ARow);
    if (ACol >= sgGame.FixedCols) xor (ARow >= sgGame.FixedRows + RE) then
      MousePress:= true
    else
      MousePress:= (ssRight in Shift) or (not mScanerMode.Checked)
  except
  end
end;

procedure TfmWWWTool.ChangeCost(Question: integer; command: integer = 0);
var
  mr: TModalResult;
begin
  if (command > 0) and
    (trim(tail(sgGame.Cells[Question + RE + sgGame.FixedColS -1, command])) <> '') then begin
    fmQCost.se0.Value:= Cost(0, Question, command);
    fmQCost.se1.Value:= Cost(1, Question, command);
    fmQCost.se2.Value:= Cost(2, Question, command);
  end else begin
    fmQCost.se0.Value:= Cost(0, Question);
    fmQCost.se1.Value:= Cost(1, Question);
    fmQCost.se2.Value:= Cost(2, Question);
  end;

  if command = 0 then
    fmQCost.lbDescription.Caption:= format('Введите стоимость вопроса №%d', [Question])
  else
    fmQCost.lbDescription.Caption:= format('Введите стоимость вопроса №%d, команда%s', [Question, tail(sgGame.Cells[0, command])]);

  mr:= fmQCost.ShowModal;
  if mr = mrOk then begin
     if command = 0 then
       sgGame.Cells[Question + RE + sgGame.FixedColS -1, 0]:= format('%d %d %d %d', [Rating(Question), fmQCost.se0.Value, fmQCost.se1.Value, fmQCost.se2.Value])
     else
       sgGame.Cells[Question + RE + sgGame.FixedColS -1, command]:= format('%s %d %d %d', [Answer(sgGame.Cells[Question + RE + sgGame.FixedColS -1, command]), fmQCost.se0.Value, fmQCost.se1.Value, fmQCost.se2.Value]);

    // перерисовка строчки со стоимостями, если они видны
    if mShowCost.Checked then
      sgGame.Repaint;

    // непринудительное обновление результатов
    UpdateResults(false);
  end else if mr = mrAbort then begin
     if command = 0 then
       sgGame.Cells[Question + RE + sgGame.FixedColS -1, 0]:= format('%d', [Rating(Question)])
     else
       sgGame.Cells[Question + RE + sgGame.FixedColS -1, command]:= Answer(sgGame.Cells[Question + RE + sgGame.FixedColS -1, command]);

    // перерисовка строчки со стоимостями, если они видны
    if mShowCost.Checked then
      sgGame.Repaint;

    // непринудительное обновление результатов
    UpdateResults(false);
  end;

end;

// если пользователь до этого нажимал на мышь - воспринимаю как щелчок
// однако на клавиатуру не реагирует (в отличие от OnClick)

procedure TfmWWWTool.sgGameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow, i, j, found, CDesk, oldDesk: integer;
  CName, prefix: String;
  Comp: boolean;
begin
  if MousePress then
  with Sender as TStringGrid do try
    MousePress:= false;
    sgGame.MouseToCell(X, Y, ACol, ARow);

    if (ARow < FixedRows) and (Button = mbRight) then
      ChangeCost(ACol - FixedCols - RE + 1)
    else if (ACol = 0) and (comCount > 0) then begin
      CName:= trim(tail(Cells[ACol, ARow]));
      CDesk:= Row2Desk(ARow);
      oldDesk:= CDesk;
      Comp:= Cells[ACol, ARow][1] = '+';

      if AddCommQuery(CName, CDesk, Comp) then begin
        if Comp then
          prefix:= '+'
        else
          prefix:= '-';

        Cells[ACol, ARow]:= prefix + copy(Cells[ACol, ARow], 2, length(Cells[ACol, ARow]));

        found:= 0;
        for i:= 1 to comCount do
          if AnsiUpperCase(trim(tail(Cells[0, FixedRows + i - 1]))) = AnsiUpperCase(CName) then
            found:= i;

        if (found > 0) and (found <> ARow) then
          MessageBox(handle, PAnsiChar(format('Команда с названием "%s" уже существует и зарегистрирована: '#13#13'Cтолик №%d.'#13#13'Необходимо придумать новое название команде', [CName, Row2Desk(found)])),
                     'Ошибка: Повторение названий команд', MB_OK + MB_ICONERROR)
        else begin
          Cells[ACol, ARow]:= Answer(Cells[ACol, ARow]) + ' ' + CName;

          if oldDesk <> CDesk then
            if DeskExist(CDesk) then
              MessageBox(handle, PAnsiChar(format('Столик №%d уже занят командой "%s".'#13#13'Выберите новый столик для команды', [CDesk, trim(tail(sgGame.Cells[0, Row2Desk(ARow)]))])), 'Занято', MB_OK or MB_ICONERROR)
            else begin
              found:= Desk2Row(CDesk);

              // добавляем команду
              RowCount:= RowCount + 1;

              // сдвигаем остальные команды
              for j:= RowCount-1 downto found+1 do
                for i:= 0 to ColCount-1 do
                  Cells[i, j]:= Cells[i, j-1];

              // если нужно вставить ПЕРЕД, то индекс сдвигается
              if found <= ARow then
                inc(ARow);

              // копируем результаты
              for i:= 0 to ColCount-1 do
                Cells[i, found]:= Cells[i, ARow];

              // меняем номер столика
              Cells[0, found]:= prefix + IntToStr(CDesk) + tail(Cells[0, found]);

              // сдвигаем на старую команду
              for j:= ARow to RowCount-2 do
                for i:= 0 to ColCount-1 do
                  Cells[i, j]:= Cells[i, j+1];

              RowCount:= RowCount - 1
            end;
        end;

        UpdateResults(true);
      end;

    end else if (Button = mbLeft) and (comCount > 0) then begin
        // если ткнули куда попало - также не реагирую
        if (ACol < FixedCols) or (ARow < FixedRows) or (RE = 1) and (ACol = FixedCols) then
          exit;

        // в зависимости от "помечать правильные-неправильные" считает,
        if Answer(Cells[ACol, ARow]) = '' then
          // запрещены пустые ответы -- должны заполнить остальных
          if not mAllowEmptyAnswers.Checked then
            if mTFCheck.Tag = 0 then begin
              // т.е. все остальные ответили неверно
              for i:= FixedRows to FixedRows + comCount - 1 do
                Cells[ACol, i]:= ANS_WRONG + tail(Cells[ACol, i]);

              // рейтинг в этом случае - все команды + 1
              sgGame.Cells[ACol, 0]:= format('%d %d %d %d', [comCount+1, Cost(0, ACol - sgGame.FixedCols - RE + 1),
                Cost(1, ACol - sgGame.FixedCols - RE + 1), Cost(2, ACol - sgGame.FixedCols - RE + 1)]);
            end else begin
              // или что все остальные ответили верно
              for i:= FixedRows to FixedRows + comCount - 1 do begin
                Cells[ACol, i]:= ANS_RIGHT + tail(Cells[ACol, i]);

                // и им нужно засчитать этот вопрос, если есть столбец "ПО"
                if mShowAnss.Checked then
                  Cells[FixedCols-1, i]:= IntToStr(StrToInt(Cells[FixedCols-1, i])+1)
              end;

              // рейтинг в таком случае - нуль + 1
              sgGame.Cells[ACol, 0]:= format('%d %d %d %d', [1, Cost(0, ACol - sgGame.FixedCols - RE + 1),
                Cost(1, ACol - sgGame.FixedCols - RE + 1), Cost(2, ACol - sgGame.FixedCols - RE + 1)]);
            end
          // разрешены пустые ответы -- должны заполнить только себя
          else
            if Rating(ACol - RE - FixedCols + 1) = 0 then begin
              if mTFCheck.Tag = 0 then
                Cells[ACol, ARow]:= ANS_WRONG + tail(Cells[ACol, ARow])
              else begin
                Cells[ACol, ARow]:= ANS_RIGHT + tail(Cells[ACol, ARow]);
                // есть столбик "ПО"
                if mShowAnss.Checked then
                  Cells[FixedCols-1, ARow]:= IntToStr(StrToInt(Cells[FixedCols-1, ARow])+1)
              end;

              sgGame.Cells[ACol, 0]:= format('%d %d %d %d', [comCount + 1 - mTFCheck.Tag, Cost(0, ACol - sgGame.FixedCols - RE + 1),
                Cost(1, ACol - sgGame.FixedCols - RE + 1), Cost(2, ACol - sgGame.FixedCols - RE + 1)]);
            end;

        // изменение в уже начавшем редактироваться вопросе
        // было - неверно, стало верно. И наоборот
        if (Answer(Cells[ACol, ARow]) = ANS_WRONG) or ((Answer(Cells[ACol, ARow]) = '') and (mAllowEmptyAnswers.Checked) and (mTFCheck.Tag = 0)) then begin
          Cells[ACol, ARow]:= ANS_RIGHT + tail(Cells[ACol, ARow]);
          // количество неверно ответивших уменьшается
          sgGame.Cells[ACol, 0]:= format('%d %d %d %d', [Rating(ACol - sgGame.FixedCols - RE + 1)-1, Cost(0, ACol - sgGame.FixedCols - RE + 1),
            Cost(1, ACol - sgGame.FixedCols - RE + 1), Cost(2, ACol - sgGame.FixedCols - RE + 1)]);

          // и количество правильных вопросов у команды увеличивается
          if mShowAnss.Checked then
            Cells[FixedCols-1, ARow]:= IntToStr(StrToInt(Cells[FixedCols-1, ARow])+1)
        end else
          if (Answer(Cells[ACol, ARow]) = ANS_RIGHT) or ((Answer(Cells[ACol, ARow]) = '') and (mAllowEmptyAnswers.Checked) and (mTFCheck.Tag = 1)) then begin
            Cells[ACol, ARow]:= ANS_WRONG + tail(Cells[ACol, ARow]);
            // +1 неверно ответившая команда
            sgGame.Cells[ACol, 0]:= format('%d %d %d %d', [Rating(ACol - sgGame.FixedCols - RE + 1)+1, Cost(0, ACol - sgGame.FixedCols - RE + 1),
              Cost(1, ACol - sgGame.FixedCols - RE + 1), Cost(2, ACol - sgGame.FixedCols - RE + 1)]);

            // уменьшается количество правильных ответов команды
            if mShowAnss.Checked then
              Cells[FixedCols-1, ARow]:= IntToStr(StrToInt(Cells[FixedCols-1, ARow])-1)
          end;
        Repaint;

        UpdateResults(false)
    end else if Button = mbRight then begin
      // показываю меню команды - в зачет или не в зачет. С возможностью изменения
      if (ACol >= ColCount) or (ARow < FixedRows) or (ARow >= RowCount) or (Cells[0, ARow] = '') then
        exit;

      if Copy(Cells[0, ARow], 1, 1) = '+' then
        mComp.Checked:= true
      else
        mComp.Checked:= false;

      pmCommName.Caption:= 'Команда' + tail(Cells[0, ARow]) + ':';

      mNotComp.Checked:= not mComp.Checked;
      pmGrid.Popup(sgGame.ClientToScreen(Point(X, Y)).X, sgGame.ClientToScreen(Point(X, Y)).Y);
      pmGrid.Tag:= ARow;
      mPrivQCost.Tag:= ACol;
    end
  except
  end
end;

// сколько нужно для названий команд пикселей

function TfmWWWTool.MaxComNameWidth: integer;
var
  i: integer;
  text: string;
begin
  Result:= sgGame.DefaultColWidth;
  with sgGame do
    for i:= 1 to RowCount-1 do begin
      text:= trim(Cells[0, i]);
      if text <> '' then
        if Result < Canvas.TextWidth(text) + 5 then
          Result:= Canvas.TextWidth(text) + 5;
      end;
end;

// перерисовка таблицы sgGame

procedure TfmWWWTool.sgGameDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i: integer;
  bold: boolean;
  text: String;
begin
  with Sender as TStringGrid do begin
    // подсчет цвета фона
    if (ACol = 0) or (ARow < FixedRows) then
      Canvas.Brush.Color:= clBtnFace
    else
      Canvas.Brush.Color:= clWindow;

    Canvas.FillRect(Rect);

    // берем шрифт от формы (Tahoma)
    Canvas.Font.Assign(Self.Font);

    // первый столбец и ARow > FixedRows-1 - это команда
    if (ACol = 0) then
      if (ARow > FixedRows-1) then
        if not mShowNames.Checked then begin
          // не надо показывать название команды - только столик
          text:= IntToStr(Row2Desk(ARow));
          if text = '0' then
            text:= ''
        end else
          // показываю столик и название команды
          text:= Copy(Cells[ACol, ARow], 2, Length(Cells[ACol, ARow]))
      else
        case ARow of
          1: text:= 'СВ';
          2: text:= 'СН';
          3: text:= 'СО'
          else
            text:= '';
        end
    else
      // если второй столбец и надо показывать количество правильных ответов
      if (ACol = 1) and mShowAnss.Checked then
        // либо шапка
        if ARow = 0 then
          text:= 'ПО'
        else begin
          // либо содержимое, но только голубым цветом
          Canvas.Font.Color:= clBlue;
          text:= Cells[ACol, ARow]
        end
      else
        // если прорисовываем шапку
        if (ARow < FixedRows) and (ACol > FixedCols-1) then
          if (RE = 1) and (ACol = FixedCols) then
            text:= 'Разм'
          else
            if ARow = 0 then
              text:= IntToStr(ACol - FixedCols + 1 - RE)
            else
              text:= IntToStr(Cost(ARow-1, ACol - FixedCols + 1 - RE))
        // иначе - рисуем содержимое. Опять же, если не надо показать рейтинг
        else if Answer(Cells[ACol, ARow]) = ANS_RIGHT then begin
          // ответил на весь раунд?
          bold:= (mRoundLength.Tag > 1);
          for i:= 1 to mRoundLength.Tag do
            bold:= bold and (Cells[i + RE + FixedCols - 1 + (ACol - FixedCols - RE) div mRoundLength.Tag * mRoundLength.Tag, ARow] = ANS_RIGHT);

          // раскрашиваем фон
          if bold then begin
            Canvas.Brush.Color:= ColorSet[(ACol - FixedCols - RE) div mRoundLength.Tag mod 2 + 1];
            Canvas.FillRect(Rect);
          end;

          if mShowRating.Checked then
            text:= IntToStr(Rating(ACol - FixedCols - RE + 1))
          else
            text:= '+'
        end else if Answer(Cells[ACol, ARow]) = ANS_WRONG then
          // а неверные ответы так и идут - минусами
          text:= '-'
        else
          text:= Answer(Cells[ACol, ARow]);

    // разделяем раунды рваной полосочкой
    if (ACol*ARow >= 1) and ((ACol - RE - FixedCols + 1) mod mRoundLength.Tag = 0) and (mRoundLength.Tag > 1) then begin
      Canvas.Pen.Style:= psDot;
      Canvas.Pen.Color:= clBlack;
      Canvas.MoveTo(Rect.Right, Rect.Top);
      Canvas.LineTo(Rect.Right, Rect.Bottom)
    end;

    // если надо показывать фокус и наша ячейка в фокусе - нарисуем его
    if mShowFocus.Checked then
      if Focused then
        if (ACol = Col) and (ARow = Row) then
          Canvas.DrawFocusRect(Rect);

    if (RE = 1) and (ACol = FixedCols) and (ARow > 0) then begin
      // колонка разминки рисуется жирным
      Canvas.Font.Style:= [fsBold];
      if StrToIntDef(text, -1) < 0 then
        // и если там не число - то еще и красным
        Canvas.Font.Color:= clRed
    end;

    // восстановление свойств пера
    with Canvas.Pen do begin
      Style:= psSolid;
      Color:= clSilver
    end;

    if mShowNames.Checked and (ACol = 0) then
      // названия команд не центрируются
      Canvas.TextOut(Rect.Left + 2, Rect.Top + (Rect.Bottom - Rect.Top - Canvas.TextHeight(text)) div 2, text)
    else
      // в отличие от всего остального
      Canvas.TextOut(Rect.Left + (Rect.Right - Rect.Left - Canvas.TextWidth(text)) div 2,
                     Rect.Top + (Rect.Bottom - Rect.Top - Canvas.TextHeight(text)) div 2, text);

  end
end;

procedure TfmWWWTool.mStatusBarClick(Sender: TObject);
begin
  mStatusBar.Checked:= not mStatusBar.Checked;
  mStatusBar.Tag:= 1 - mStatusBar.Tag;

  StatusBar.Visible:= mStatusBar.Checked
end;

// при наведении на команду мышкой в строке состояния отображается ее
// первый столбец и то, что в текущей колонке

procedure TfmWWWTool.sgGameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  ACol, ARow: integer;
begin
  with Sender as TStringGrid do
    try
      MouseToCell(X, Y, ACol, ARow);
      if ACol*ARow = 0 then Exit;
      StatusBar.SimpleText:= 'Название команды: ' + tail(Cells[0, ARow]) + ' [' + Cells[ACol, ARow] + ']'
    except
      StatusBar.SimpleText:= ''
    end
end;

procedure TfmWWWTool.mCloseClick(Sender: TObject);
begin
  Close
end;

// обновление результатов с пересчетом лиг

procedure TfmWWWTool.UpdateResults(force: boolean);
  // функция для сравнения результатов меньше или равно
  function LessThan(ord1, ord2: integer): boolean;
  var
    cQC1, cQR1, cQC2, cQR2: integer;
  begin
    with sgResults do begin
      cQC1:= StrToIntDef(Copy(Cells[3, ord1], 1, Pos('/', Cells[3, ord1])-1), 0);
      cQR1:= StrToIntDef(Copy(Cells[3, ord1], Pos('/', Cells[3, ord1])+1, Length(Cells[3, ord1])), 0);
      cQC2:= StrToIntDef(Copy(Cells[3, ord2], 1, Pos('/', Cells[3, ord2])-1), 0);
      cQR2:= StrToIntDef(Copy(Cells[3, ord2], Pos('/', Cells[3, ord2])+1, Length(Cells[3, ord2])), 0);
    end;
    Result:= (cQC1 < cQC2) or (cQC1 = cQC2) and (cQR1 < cQR2)
  end;

var
  i, j, cQCount, cQRating, curPlace, stCom: integer;
  tmpStr: String;
  coms: array of integer;

begin
  if mUpdateResults.Checked and pnResults.Visible or force then with sgResults do begin
    RowCount:= sgGame.RowCount - sgGame.FixedRows + 1;

    // вытаскивание данных из sgGame
    for i:= sgGame.FixedRows to sgGame.RowCount-1 do begin
      if sgGame.Cells[0, i] <> '' then begin
        j:= 1;
        tmpStr:= sgGame.Cells[0, i];
        while tmpStr[j] <> ' ' do
          inc(j);
        // в первом столбце ищу первый пробел и от него пляшу:
          // столик
          Cells[1, i - sgGame.FixedRows + 1]:= Copy(tmpStr, 2, j-2);
          // название команды
          Cells[2, i - sgGame.FixedRows + 1]:= Copy(tmpStr, j+1, Length(tmpStr));
      end else begin
        Cells[1, i - sgGame.FixedRows + 1]:= '';
        Cells[2, i - sgGame.FixedRows + 1]:= ''
      end;

      // Подсчет результатов
      cQCount:= RE*StrToIntDef(sgGame.Cells[sgGame.FixedCols, i], 0);
      cQRating:= 0;
      for j:= sgGame.FixedCols + RE to sgGame.ColCount-1 do
        if Answer(sgGame.Cells[j, i]) = ANS_RIGHT then begin
          if tail(sgGame.Cells[j, i]) = '' then
            inc(cQCount, Cost(0, j - sgGame.FixedCols - RE + 1))
          else
            inc(cQCount, Cost(0, j - sgGame.FixedCols - RE + 1, i));

          inc(cQRating, Rating(j - sgGame.FixedCols - RE + 1));
        end else
        if Answer(sgGame.Cells[j, i]) = ANS_WRONG then
          if tail(sgGame.Cells[j, i]) = '' then
            inc(cQCount, Cost(1, j - sgGame.FixedCols - RE + 1))
          else
            inc(cQCount, Cost(1, j - sgGame.FixedCols - RE + 1, i))
        else
          if tail(sgGame.Cells[j, i]) = '' then
            inc(cQCount, Cost(2, j - sgGame.FixedCols - RE + 1))
          else
            inc(cQCount, Cost(2, j - sgGame.FixedCols - RE + 1, j));
      Cells[3, i - sgGame.FixedRows + 1]:= format('%d/%d', [cQCount, cQRating])
    end;

    // Сортировка команд по результатам
    i:= 1;
    while i < sgResults.RowCount-1 do
      if LessThan(i, i+1) then begin
        for j:= 1 to sgResults.ColCount-1 do begin
          tmpStr:= sgResults.Cells[j, i];
          sgResults.Cells[j, i]:= sgResults.Cells[j, i+1];
          sgResults.Cells[j, i+1]:= tmpStr;
        end;
        if i > 1 then dec(i)
      end else inc(i);

    // Перераспределение мест. Сначала выделим команды на зачет
    coms:= nil;
    try
      for i:= 1 to sgResults.RowCount-1 do begin
        j:= Desk2Row(StrToInt(sgResults.Cells[1, i]));
        sgResults.Cells[0, i]:= 'вне зачета';
        if Copy(sgGame.Cells[0, j], 1, 1) = '+' then begin
          SetLength(coms, Length(coms) + 1);
          coms[High(coms)]:= i
        end;
      end;
    except
      exit
    end;

    if mPlaceType.Tag = 0 then begin // Обычное распределение мест
      if coms <> nil then
        sgResults.Cells[0, coms[0]]:= '1'; // Первый - всегда первый
      curPlace:= 1;
      for i:= 1 to High(coms) do begin
        if LessThan(coms[i], coms[i-1]) then
          inc(curPlace);

        sgResults.Cells[0, coms[i]]:= IntToStr(curPlace)
      end
    end else begin // Распределение по алгоритму Елены Анатольевны Бурундуковой
      stCom:= 0;
      for i:= 1 to Length(coms) do
        if LessThan(coms[i], coms[stCom]) or (i = Length(coms)) then begin
          if stCom = i-1 then
            sgResults.Cells[0, coms[stCom]]:= IntToStr(stCom + 1)
          else
            for j:= stCom to i-1 do
              sgResults.Cells[0, coms[j]]:= format('%d-%d', [stCom + 1, i]);

          stCom:= i;
        end

    end;

    // Здесь и далее - свобода выбора
    case PageControl.ActivePageIndex of
      0:// Типа отборочной игры - равномерное распределение
        SetUniformLevels;
      1:// некоторые команды переходят в другие лиги
        SetUsualLevels(edBLevel.Tag)
    end;

    sgResults.Repaint
  end
end;

// отображение или скрытие результатов

procedure TfmWWWTool.mResultClick(Sender: TObject);
begin
  mResult.Checked:= not mResult.Checked;
  mResult.Tag:= 1 - mResult.Tag;

  // критерий экспорта: результаты существуют, место должно быть числом
  mExport.Enabled:= mResult.Checked and (mPlaceType.Tag = 0);

  pnResults.Visible:= mResult.Checked;
  Splitter.Visible:= mResult.Checked;

  PageControl.OnChange(Sender);

  UpdateResults(mResult.Checked);

  if not mResult.Checked then
    sgGame.SetFocus
end;

// получение названия лиги по ее номеру

function TfmWWWTool.GetLevelName(Level: integer): String;
begin
  case Level of
   -1: Result:= 'нет лиги';
    0: Result:= 'Высшая лига';
    1: Result:= 'Первая лига';
    2: Result:= 'Вторая лига';
    3: Result:= 'Третья лига';
    4: Result:= 'Четвертая лига';
    5: Result:= 'Пятая лига';
    6: Result:= 'Шестая лига';
    7: Result:= 'Седьмая лига';
    8: Result:= 'Восьмая лига';
    9: Result:= 'Девятая лига';
    10:Result:= 'Десятая лига'
  else
    Result:= format('%d лига', [Level])
  end
end;

// как отборочная игра

procedure TfmWWWTool.SetUniformLevels;
var
  i, j, cCount, lCount: integer;
  curCom, curL: integer;
  coms: array of integer;
begin
  // Зададим названия лигам
  cbLevel.Clear;
  for i:= 0 to seLCount.Value-1 do
    cbLevel.AddItem(GetLevelName(i), TObject(i));
  cbLevel.AddItem(GetLevelName(-1), TObject(-1));

  // выбор команд, среди которых подсчитываются результаты
  coms:= nil;
  try
    for i:= 1 to sgResults.RowCount-1 do begin
      j:= Desk2Row(StrToInt(sgResults.Cells[1, i]));
      sgResults.Cells[4, i]:= '-1';
      if Copy(sgGame.Cells[0, j], 1, 1) = '+' then begin
        SetLength(coms, Length(coms) + 1);
        coms[High(coms)]:= i
      end;
    end;
  except
    exit
  end;

  // Количество распределяемых команд
  cCount:= Length(coms);
  if not cbUseNull.Checked then
    while (Copy(sgResults.Cells[3, coms[cCount-1]], 1, 1) = '0') and (cCount >= 0) do
      dec(cCount);

  // Распределение по алгоритму Анны Георгиевны Тамаревской
  lCount:= seLCount.Value;
  curCom:= 1;
  curL:= 0;
  while lCount > 0 do begin
    for i:= 1 to cCount div lCount do begin
      sgResults.Cells[4, coms[curCom-1]]:= IntToStr(curL);
      inc(curCom)
    end;
    cCount:= cCount - cCount div lCount;
    dec(lCount);
    inc(curL)
  end;

  CountLevels // определить количество команд в лигах
end;

// заполнение таблички внизу для контроля равномерности распределения

procedure TfmWWWTool.CountLevels;
var
  CL: array of integer;
  i, j: integer;
begin
  // Инициация
  SetLength(CL, seLCount.Value + 1);
  for i:= 0 to High(CL) do
    CL[i]:= 0;

  for i:= 1 to sgResults.RowCount-1 do
    for j:= 0 to cbLevel.Items.Count-1 do
      if GetLevelName(StrToIntDef(sgResults.Cells[4, i], -1)) = cbLevel.Items[j] then
        inc(CL[j]);

  // Демонстрация результата
  vleLevels.Strings.Clear;
  for i:= 0 to High(CL) do
    vleLevels.InsertRow(cbLevel.Items[i], IntToStr(CL[i]), true); // <- true - добавлять в конец

  sgResults.Repaint
end;

// некоторые команды поднимаются, некоторые опускаются по лиге

procedure TfmWWWTool.SetUsualLevels(BaseLevel: integer);
var
  i, j, PredLevel: integer;
  coms: array of integer;
begin
  with sgResults do begin
    edBLevel.Text:= GetLevelName(edBLevel.Tag);

    // выбор команд, среди которых подсчитываются результаты
    coms:= nil;
    try
      for i:= 1 to sgResults.RowCount-1 do begin
        j:= Desk2Row(StrToInt(sgResults.Cells[1, i]));
        sgResults.Cells[4, i]:= '-1';
        if Copy(sgGame.Cells[0, j], 1, 1) = '+' then begin
          SetLength(coms, Length(coms) + 1);
          coms[High(coms)]:= i
        end;
      end;
    except
      exit
    end;

    // в высшей лиге выше некуда
    if BaseLevel = 0 then
      PredLevel:= 0
    else
      PredLevel:= Pred(BaseLevel);

    if coms <> nil then begin
      // сначала те, кто остаются
      for i:= max(0, min(seCMoveUp.Value-1, High(coms))) to max(0, High(coms) - seCMoveDown.Value) do
        Cells[4, coms[i]]:= IntToStr(BaseLevel);

      // потом те, кто уходит ниже
      for i:= max(0, High(coms) - seCMoveDown.Value + 1) to High(coms) do
        Cells[4, coms[i]]:= IntToStr(BaseLevel + 1);

      // и потом - кто выше
      for i:= 0 to min(seCMoveUp.Value-1, High(coms)) do
        Cells[4, coms[i]]:= IntToStr(PredLevel);
    end;

    cbLevel.Clear;
    if PredLevel <> BaseLevel then
      cbLevel.AddItem(GetLevelName(PredLevel), TObject(PredLevel));
    cbLevel.AddItem(GetLevelName(BaseLevel),  TObject(BaseLevel));
    cbLevel.AddItem(GetLevelName(BaseLevel + 1),  TObject(BaseLevel + 1));
    cbLevel.AddItem(GetLevelName(-1), TObject(-1));

    Repaint
  end
end;

// изменение количества распределяемых лиг в "отборочной игре"

procedure TfmWWWTool.seLCountChange(Sender: TObject);
begin
  SetUniformLevels
end;

// распределять ли команды с нулевым результатом

procedure TfmWWWTool.cbUseNullClick(Sender: TObject);
begin
  SetUniformLevels
end;

// при нажатии на список результатов на пятом столбце выскакивает
// TComboBox для изменения лиги. Иначе он прячется

procedure TfmWWWTool.sgResultsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow, i: integer;
  Rect: TRect;
begin
  sgResults.MouseToCell(X, Y, ACol, ARow);

  if (ACol = 4) and (ARow > 0) then begin
    // Выбор текущего значения лиги
    for i:= 0 to cbLevel.Items.Count-1 do
      if GetLevelName(StrToInt(sgResults.Cells[4, ARow])) = cbLevel.Items[i] then
        cbLevel.ItemIndex:= i;

    // Подсчет размеров
    Rect:= sgResults.CellRect(ACol, ARow);
    Rect.Top:= sgResults.Top + Rect.Top + sgResults.GridLineWidth + 1;
    Rect.Left:= sgResults.Left + Rect.Left + sgResults.GridLineWidth + 1;
    cbLevel.BoundsRect:= Rect;

    // Показ выпадающего списка
    cbLevel.Show;
    cbLevel.DroppedDown:= true

  end else
    cbLevel.Hide

end;

// при изменении лиги у команды нужно перерисовать таблицу и пересчитать количество команд в лигах

procedure TfmWWWTool.cbLevelChange(Sender: TObject);
begin
  with sgResults do
    if cbLevel.ItemIndex = cbLevel.Items.Count-1 then
      Cells[Col, Row]:= '-1'
    else
      Cells[Col, Row]:= IntToStr(Integer(cbLevel.Items.Objects[cbLevel.ItemIndex]));

  CountLevels; // заново определить количество команд в лигах

  cbLevel.Hide
end;

// получение значений для HMTL

procedure TfmWWWTool.HTMLCreatorGetValue(Sender: TObject; Name: String;
  var Value: String);
var i, j: integer;
begin
  Value:= '';
  if AnsiUpperCase(Name) = 'РЕЗУЛЬТАТЫ' then begin
    for j:= 1 to sgResults.RowCount-1 do begin
      for i:= 0 to sgResults.ColCount-1 do
        if i <> 4 then
          Value:= Value + '"' + sgResults.Cells[i, j] + '", '
        else
          Value:= Value + '"' + GetLevelName(StrToIntDef(sgResults.Cells[i, j], -1)) + '", ';

      if PageControl.ActivePage <> tsWithoutly then
        Value:= Value + '"' + HTMLColorSet[ColorInd(j)] + '", ';

      if (Sender as TComponent).Tag = 1 then
        for i:= sgGame.FixedCols to sgGame.ColCount-1 do
          if not mShowRating.Checked or (sgGame.Cells[i, Desk2Row(StrToInt(sgResults.Cells[1, j]))] = ANS_WRONG) or ((i = sgGame.FixedCols) and mRasminkaExist.Checked) then
            Value:= Value + '"' + sgGame.Cells[i, Desk2Row(StrToInt(sgResults.Cells[1, j]))] + '", '
          else
            Value:= Value + '"' + sgGame.Cells[i, 0] + '", '
    end;
    Value:= Value + '""'
  end else
  if AnsiUpperCase(Name) = 'ROWCOUNT' then
    Value:= IntToStr(sgResults.RowCount-1)
  else
  if AnsiUpperCase(Name) = 'COLCOUNT' then
    Value:= IntToStr(sgResults.ColCount + Ord(PageControl.ActivePage <> tsWithoutly))
  else
  if AnsiUpperCase(Name) = 'COLORED' then
    Value:= IntToStr(Ord(PageControl.ActivePage <> tsWithoutly))
  else
  if AnsiUpperCase(Name) = 'ЗАГОЛОВОК' then
    Value:= Caption
  else
  if AnsiUpperCase(Name) = 'ЛИГА' then
    Value:= IntToStr(Ord(PageControl.ActivePage <> tsWithoutly))
  else
  if AnsiUpperCase(Name) = 'ПРОТОКОЛ' then
    Value:= IntToStr((Sender as TComponent).Tag*(sgGame.ColCount - sgGame.FixedCols))
  else
  if AnsiUpperCase(Name) = 'РАЗМИНКА' then
    Value:= IntToStr(RE)

end;

// изменение параметра, который влияет лишь на прорисовку sgGame

procedure TfmWWWTool.mDrawGridPropClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked:= not (Sender as TMenuItem).Checked;
  (Sender as TMenuItem).Tag:= 1 - (Sender as TMenuItem).Tag;

  if mJumpTo1.Checked then
    if mJumpThenCheck.Checked then
      mJumpThenCheck.Click;

  mJumpThenCheck.Enabled:= not mJumpTo1.Checked;

  UpdateResults(false);
  sgGame.Repaint
end;

// показать названия команд или спрятать. Изменяется также и ширина столбца

procedure TfmWWWTool.mShowNamesClick(Sender: TObject);
begin
  mShowNames.Checked:= not mShowNames.Checked;
  mShowNames.Tag:= 1 - mShowNames.Tag;

  if mShowNames.Checked then
    sgGame.ColWidths[0]:= MaxComNameWidth
  else
    sgGame.ColWidths[0]:= sgGame.DefaultColWidth;

  sgGame.Repaint
end;

// показать или спрятать столбец "количество правильных ответов"

procedure TfmWWWTool.mShowAnssClick(Sender: TObject);
var
  i, j: integer;
  Ans: array of integer;
begin
  StoredValue:= 0;

  sgGame.EditorMode:= false;

  mShowAnss.Checked:= not mShowAnss.Checked;
  mShowAnss.Tag:= 1 - mShowAnss.Tag;

  with sgGame do
    if mShowAnss.Checked then begin
      // добавить столбик с количеством правильных ответов
      ColCount:= ColCount + 1;
      for i:= ColCount-1 downto FixedCols+RE do
        Cells[i, 0]:= Cells[i-1, 0];

      // Инициирую массив количества ответов
      SetLength(Ans, max(comCount, 1));
      for i:= 0 to High(Ans) do
        Ans[i]:= 0;

      // Перетаскиваю с заполнением количества правильных
      for j:= FixedRows to RowCount-1 do begin
        if RE = 1 then
          Ans[j - FixedRows]:= StrToIntDef(Cells[FixedCols, j], 0);

        for i:= ColCount-1 downto FixedCols+RE do begin
          Cells[i, j]:= Cells[i-1, j];
          if Answer(Cells[i, j]) = ANS_RIGHT then
            inc(Ans[j - FixedRows]);
        end;
      end;

      FixedCols:= FixedCols + 1;

      // Отображаю правильные (если есть команды)
      for j:= FixedRows to FixedRows-1 + comCount do
        Cells[FixedCols-1, j]:= IntToStr(Ans[j - FixedRows])

    end else begin
      // убрать колонку с ответами. Все действия - в обратном порядке
      FixedCols:= FixedCols - 1;

      // Перетаскиваю с переда - назад
      for j:= 0 to RowCount-1 do
        for i:= FixedCols to ColCount-2 do
          Cells[i, j]:= Cells[i+1, j];

      // И уменьшаю количество столбцов
      ColCount:= ColCount - 1;
    end;

  sgGame.Repaint
end;

// управление с клавиатуры - нажатие пробела заменяет щелчок мыши. Это удобно

procedure TfmWWWTool.sgGameKeyPress(Sender: TObject; var Key: Char);
var
  Rect: TRect;
begin
  with sgGame do if Key = ' ' then begin
    Rect:= CellRect(Col, Row);
    // если MousePress = false, событие не сработает
    MousePress:= true;
    sgGameMouseUp(Sender, mbLeft, [], Rect.Left, Rect.Top);
  end else if ScanerTimer.Interval > 0 then if Key in ['0'..'9', '-', '+'] then begin
    Scaner:= Scaner + Key;
    ScanerTimer.Enabled:= false;
    ScanerTimer.Enabled:= true;
    StatusBar.SimpleText:= format('Считано со сканера: %s', [Scaner])
  end;
end;

// по номеру команды в "результатах" - цвет его лиги

function TfmWWWTool.ColorInd(Row: integer): integer;
var
  ind: integer;
begin
  // номер лиги хранится в 5 столбце
  ind:= StrToIntDef(sgResults.Cells[4, Row], -1);
  Result:= 1 + ind mod 2;
  if ind = -1 then
    Result:= 0
end;

// процедура прорисовки итоговой таблицы

procedure TfmWWWTool.sgResultsDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Text: String;
begin
  with sgResults do begin
    // выбор цвета фона для ячейки
    if (ACol < FixedCols) or (ARow < FixedRows) then
      Canvas.Brush.Color:= FixedColor
    else
      if PageControl.ActivePage = tsWithoutly then
        Canvas.Brush.Color:= clWindow
      else
        Canvas.Brush.Color:= ColorSet[ColorInd(ARow)];

    // присваивание таблице шрифта формы - в моем случае это Tahoma
    Canvas.Font.Assign(Self.Font);

    Canvas.FillRect(Rect);

    Text:= Cells[ACol, ARow];
    // если прорисовывается 5 столбец, нужно отобразить название лиги
    if (ACol = 4) and (ARow > 0) then
      Text:= GetLevelName(StrToIntDef(Text, -1));

    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + (Rect.Bottom - Rect.Top - Canvas.TextHeight(Text)) div 2, Text);
  end;
end;

// смена названия игре

procedure TfmWWWTool.mGameNameClick(Sender: TObject);
var S: String;
begin
  S:= Caption;
  if InputQuery('Название игры', 'Введите новое название игры', S) then begin
    Caption:= S;
    Application.Title:= S
  end;
end;

// переход на команду с введенным номером столика

procedure TfmWWWTool.mJumpToClick(Sender: TObject);
var
  ch: char;
  table, tmp: integer;
begin
  table:= 0;
  if comCount > 0 then
    table:= Row2Desk(sgGame.Row);

  if InputQuery('Перейти к', 'Введите столик команды', table, Row2Desk(sgGame.RowCount-1)) then begin
    tmp:= Desk2Row(table);

    // нашли ли команду с данным столиком
    if table <> Row2Desk(tmp) then begin
      MessageBox(handle, PAnsiChar(format('Ошибка перехода на команду за столиком №%d', [table])), 'Ошибка', MB_OK or MB_ICONERROR);
      exit
    end else
      sgGame.Row:= tmp;

    if mJumpTo1.Checked then
      sgGame.Col:= sgGame.FixedCols;

    ch:= ' ';
    if mJumpThenCheck.Checked then
      sgGameKeyPress(sgGame, ch)
  end
end;

// удаление команды с пересчетом рейтинга

procedure TfmWWWTool.mDeleteClick(Sender: TObject);
var
  i, j, Desk, tmp: integer;
begin
  Desk:= 0;

  // если есть кого убирать
  if comCount > 0 then
    if InputQuery('Убрать команду', 'Введите столик команды', Desk, Row2Desk(comCount)) then
    try
      tmp:= Desk2Row(Desk);

      if Row2Desk(tmp) = Desk then begin

        // добавляю в список команд
        cmdList.Add(Copy(sgGame.Cells[0, Desk], Pos(' ', sgGame.Cells[0, tmp]) + 1, Length(sgGame.Cells[0, tmp])));
        cmdList.Sort;

        for i:= sgGame.FixedCols + RE to sgGame.ColCount-1 do
          if Rating(i - sgGame.FixedCols - RE + 1) > 0 then
            if Answer(sgGame.Cells[i, tmp]) <> ANS_RIGHT then
              // если команда отвечала неверно, то ее удаление скажется на рейтинге
              sgGame.Cells[i, 0]:= format('%d %d %d %d', [Rating(i - sgGame.FixedCols - RE + 1) - 1, Cost(0, i - sgGame.FixedCols - RE + 1),
                Cost(1, i - sgGame.FixedCols - RE + 1), Cost(2, i - sgGame.FixedCols - RE + 1)]);

        // сдвиг команд вверх
        for i:= tmp+1 to sgGame.RowCount-1 do
          for j:= 0 to sgGame.ColCount-1 do begin
            sgGame.Cells[j, i-1]:= sgGame.Cells[j, i];
          end;

        // очищаю последнюю строчку - вдруг она останется (когда удаляю последнюю команду)
        for i:= 0 to sgGame.ColCount-1 do
          sgGame.Cells[i, sgGame.RowCount-1]:= '';

        if comCount > 0 then
          sgGame.RowCount:= sgGame.RowCount - 1
        else
{
          // команд не осталось - возвращаю игру в начальное состояние
          for i:= 0 to sgGame.ColCount-1 do
            sgGame.Cells[i, 0]:= ''
};

        sgGame.Repaint;

        UpdateResults(false);
      end
    except
      MessageBox(handle, PAnsiChar(format('Ошибка удаления команды за столиком №%d: этот столик свободен', [Desk])), 'Ошибка', MB_OK+MB_ICONERROR)
    end
end;

// добавление или удаление специального раунда "разминка", в котором
// не существует рейтинга

procedure TfmWWWTool.mRasminkaExistClick(Sender: TObject);
var
  i, j: integer;
begin
  mRasminkaExist.Checked:= not mRasminkaExist.Checked;
  mRasminkaExist.Tag:= 1 - mRasminkaExist.Tag;

  with sgGame do
    if RE = 1 then begin
      // просто добавить пустой столбик, без заполнения
      ColCount:= ColCount + 1;

      for j:= 0 to RowCount-1 do begin
        for i:= ColCount-1 downto FixedCols + RE do
          Cells[i, j]:= Cells[i-1, j];

        Cells[FixedCols, j]:= '';
      end;

      // если курсор находится в столбике разминки, можно редактировать с клавиатуры
      //if Col = FixedCols then
      //  Options:= Options + [goEditing];

      Col:= Col + 1;
    end else begin
      // убрать без сохранения
      for j:= 0 to RowCount-1 do begin
        if j >= FixedRows then
          if mShowAnss.Checked then
            Cells[FixedCols-1, j]:= IntToStr(StrToInt(Cells[FixedCols-1, j]) - StrToIntDef(Cells[FixedCols, j], 0));

        for i:= FixedCols to ColCount-2 do
          Cells[i, j]:= Cells[i+1, j];
      end;

      ColCount:= ColCount - 1;
      // и в любом случае не разрешать редактировать таблицу вручную
      //Options:= Options - [goEditing];
      if Col > FixedCols then
        Col:= Col - 1;

      UpdateResults(false)
    end;
end;

procedure TfmWWWTool.mAboutClick(Sender: TObject);
var
  Text: String;
begin
  Text:= 'WWWTool - "What? Where? When?" Tool - ' +
         'Инструмент для проведения игр рода "Что? Где? Когда?"'#13 +
         '  Версия 0.5 от 17 февраля 2011 года (исполняемая часть) '#13 +
         'Copyright (C) 2004-2011, Тамаревская Анна Георгиевна и Тамаревский Алексей'#13#13 +

         'Хочу выразить благодарность человеку, по нику Vit (vit@vingrad.ru), ' +
         'составившему Delphi Russian Knowledge Base, без которой работа с HTML ' +
         'для сбора результата нескольких игр была бы невозможна.'#13#13 +

         'This file is free software, and not subject to GNU Public License ' +
         'restrictions; you can redistribute it and/or modify it in any way ' +
         'you see fit. This file is suitable for inclusion in a derivative ' +
         'work, regardless of license on the work or availability of source code ' +
         'to the work. If you redistribute this file, you must leave this ' +
         'header intact.'#13#13 +

         'This program is distributed in the hope that it will be useful, ' +
         'but WITHOUT ANY WARRANTY; without even the implied warranty of ' +
         'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.'#13#13 +

         'You should have received a copy of the GNU General Public License ' +
         'along with this program; if not, write to the Free Software ' +
         'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA'#13#13 +

         'С авторами данной программы можно связаться по адресу A.E.Tamarevskiy@gmail.com.'#13;

  MessageBox(handle, PAnsiChar(Text), 'О программе', MB_OK or MB_ICONINFORMATION)
end;

// работа с набором результатов

procedure TfmWWWTool.mSumClick(Sender: TObject);
begin
  fmSum.Show
end;

// изменение базовой лиги в очередной игре

procedure TfmWWWTool.sbBLevelUpClick(Sender: TObject);
begin
  edBLevel.Tag:= edBLevel.Tag + 1;

  SetUsualLevels(edBLevel.Tag)
end;

// изменение базовой лиги в очередной игре

procedure TfmWWWTool.sbBLevelDownClick(Sender: TObject);
begin
  if edBLevel.Tag > 0 then
    edBLevel.Tag:= edBLevel.Tag - 1;

  SetUsualLevels(edBLevel.Tag)

end;

procedure TfmWWWTool.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    0: begin
      sgResults.ColCount:= 5;
      SetUniformLevels
    end;
    1: begin
      sgResults.ColCount:= 5;
      SetUsualLevels(edBLevel.Tag)
    end;
    2:
      sgResults.ColCount:= 4
  end;

  sgResults.Repaint
end;

// изменение параметра "помечать правильные-неправильные"

procedure TfmWWWTool.mTFCheckClick(Sender: TObject);
begin
  mTFCheck.Tag:= 1 - mTFCheck.Tag;

  if mTFCheck.Tag = 0 then
    mTFCheck.Caption:= 'Помечать правильные'
  else
    mTFCheck.Caption:= 'Помечать неправильные'
end;

// при начале редактирования разминки запоминаю, что было ранее, чтобы
// правильно пересчитать количество правильных ответов

procedure TfmWWWTool.sgGameGetEditText(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  StoredValue:= StrToIntDef(Value, 0);
end;

// и при каждом изменении пересчитываю

procedure TfmWWWTool.sgGameSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  if mShowAnss.Checked then
    with sgGame do
      Cells[FixedCols-1, ARow]:= IntToStr(StrToIntDef(Cells[FixedCols-1, ARow], 0)
                                        - StoredValue + StrToIntDef(Value, 0));

  UpdateResults(false);

  StoredValue:= StrToIntDef(Value, 0);
end;

// если пользователь попал на столбец с разминкой - разрешаю редактировать

procedure TfmWWWTool.sgGameClick(Sender: TObject);
begin
  with sgGame do
    if (RE = 1) and (Col = FixedCols) then
      Options:= Options + [goEditing]
    else
      Options:= Options - [goEditing]
end;

// изменение параметра "количество команд, переходящих в лигу выше"

procedure TfmWWWTool.seCMoveUpChange(Sender: TObject);
begin
  SetUsualLevels(edBLevel.Tag);

  sgResults.Repaint
end;

// начало загрузки списка команд из HTML

procedure TfmWWWTool.mLoadCommsClick(Sender: TObject);
begin
  if OpenResult.Execute then
    Browser.Navigate('file://' + OpenResult.FileName);
end;

procedure TfmWWWTool.FormCreate(Sender: TObject);
const
  month_names: array[1..12] of ShortString =
  ('января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
   'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');
var
  year, month, day: word;
  SR: TSearchRec;
  tmp: String;
begin
  // регистрирую, чтобы откликаться на BROADCAST сообщения
  WM_WWWTOOL_SCANER:= RegisterWindowMessage('WWWToolScanerEndRead');
  Application.HookMainWindow(WWWToolScanerEndRead);
  MousePress:= false;
  cmdList:= TStringList.Create;

  // задаю шапку таблицы результатов и ее размеры
  with sgResults do begin
    Cells[0, 0]:= 'Место';      ColWidths[0]:= Canvas.TextWidth(Cells[0, 0]) + 5;
    Cells[1, 0]:= 'Стол';       ColWidths[1]:= Canvas.TextWidth(Cells[1, 0]) + 5;
    Cells[2, 0]:= 'Название';   ColWidths[2]:= DefaultColWidth;
    Cells[3, 0]:= 'Результат';  ColWidths[3]:= Canvas.TextWidth(Cells[3, 0]) + 5;
    Cells[4, 0]:= 'Лига';

    DefaultRowHeight:= cbLevel.Height;
  end;

  // если указали, какое состояние загружать
  if ParamCount > 0 then
    procLoadState(ParamStr(1))
  else begin // иначе - состояние по-умолчанию
    // меняю название игры
    DecodeDate(Now, year, month, day);
    Caption:= format('Игра за %d %s %d', [day, month_names[month], year]);
    Application.Title:= Caption;

    if FileExists('default.state') then
      procLoadState('default.state');
  end;

  if FindFirst(ExtractFilePath(Application.ExeName)+'*.tht', faAnyFile, SR) = 0 then begin
    repeat
      tmp:= Copy(SR.Name, 1, Length(SR.Name)-4);
      if ((AnsiUpperCase(tmp) <> 'РЕЗУЛЬТАТЫ') and
          (AnsiUpperCase(tmp) <> 'ИТОГИ')) then
          SaveDialog.Filter:= SaveDialog.Filter + '|' + tmp + '|*.html;*.htm';
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;

end;

procedure TfmWWWTool.FormDestroy(Sender: TObject);
begin
  cmdList.Free
end;

procedure TfmWWWTool.BrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  i, cmdName, cmdLevel: integer;
  wbTable: OleVariant;
  str: String;
begin
  cmdName:= -1;
  cmdLevel:= -1;

  try
    cmdList.Clear;
    // Взято из Delphi Russian Knowledge Base from Vit (vit@vingrad.ru)

    // Взято из FAQ: http://blackman.km.ru/myfaq/cont4.phtml
    // Перевод материала с сайта members.home.com/hfournier/webbrowser.htm
    wbTable:= Browser.OleObject.Document.getElementById('tbl');

    // пробегаю по всем заголовкам таблицы и ищу колонки "Название" и "Лига"
    for i:= 0 to wbTable.Rows.Item(0).Cells.Length-1 do begin
      str:= wbTable.Rows.Item(0).Cells.Item(i).InnerText;
      if str = 'Название' then
        cmdName:= i
      else
      if str = 'Лига' then
        cmdLevel:= i
    end;

    // название должно присутствовать, а лига - не обязательно
    if cmdLevel <> -1 then
      for i:= 1 to wbTable.Rows.Length-1 do
        cmdList.Add(wbTable.Rows.item(i).Cells.Item(cmdName).InnerText + ' | ' +
                    wbTable.Rows.item(i).Cells.Item(cmdLevel).InnerText)
    else
      for i:= 1 to wbTable.Rows.Length-1 do
        cmdList.Add(wbTable.Rows.item(i).Cells.Item(cmdName).InnerText);

    cmdList.Sort;
  except
  end
end;

// изменение параметра "один результат - одно-разные места"

procedure TfmWWWTool.mPlaceTypeClick(Sender: TObject);
begin
  mPlaceType.Tag:= 1 - mPlaceType.Tag;

  // критерий экспорта: результаты существуют, место должно быть числом
  mExport.Enabled:= mResult.Checked and (mPlaceType.Tag = 0);

  if mPlaceType.Tag = 0 then
    mPlaceType.Caption:= 'Один результат - одно место'
  else
    mPlaceType.Caption:= 'Один результат - разные места';

  UpdateResults(false);
end;

// изменение команды - теперь она играет "в зачет"

procedure TfmWWWTool.mCompClick(Sender: TObject);
begin
  sgGame.Cells[0, pmGrid.Tag]:= '+' + Copy(sgGame.Cells[0, pmGrid.Tag], 2, Length(sgGame.Cells[0, pmGrid.Tag]));

  UpdateResults(false)
end;

// изменение команды - теперь она играет "не в зачет"

procedure TfmWWWTool.mNotCompClick(Sender: TObject);
begin
  sgGame.Cells[0, pmGrid.Tag]:= '-' + Copy(sgGame.Cells[0, pmGrid.Tag], 2, Length(sgGame.Cells[0, pmGrid.Tag]));

  UpdateResults(false)
end;

// сохранение таблицы sgGame и некоторых параметров - название игры, присутствие
// разминки и столбца количества правильных ответов

procedure TfmWWWTool.procSaveState(const FileName: String);
var
  i, j: integer;
begin
  AssignFile(output, FileName);
  ReWrite(output);

  Writeln(ID_STR);
  // название игры
  Writeln(Caption);
  // разминка
  Writeln(mRasminkaExist.Tag);
  // переходить к вопросу №1
  Writeln(mJumpTo1.Tag);
  // после перехода - пометить
  Writeln(mJumpThenCheck.Tag);
  // результат
  Writeln(mResult.Tag);
  // один результат - одно/разные места
  Writeln(mPlaceType.Tag);
  // динамическое обновление
  Writeln(mUpdateResults.Tag);
  // помечать правильные
  Writeln(mTFCheck.Tag);
  // показывать названия команд
  Writeln(mShowNames.Tag);
  // показывать рейтинг
  Writeln(mShowRating.Tag);
  // показывать количество правильных ответов
  Writeln(mShowAnss.Tag);
  // показывать фокус
  Writeln(mShowFocus.Tag);
  // строка состояния
  Writeln(mStatusBar.Tag);
  // продолжительность времени
  Writeln(mTimerLength.Tag);

  // сама таблица
  with sgGame do begin
    Writeln(ColCount);
    Writeln(RowCount);

    for j:= 0 to RowCount-1 do
      for i:= 0 to ColCount-1 do
        Writeln(Cells[i, j]);
  end;

  // Активная страница
  Writeln(PageControl.ActivePageIndex);

  // Отборочная
    // количество лиг
    Writeln(seLCount.Value);
    // распределять команды с нулевым результатом
    Writeln(Ord(cbUseNull.Checked));

  // Очередная
    // основная лига
    Writeln(edBLevel.Tag);
    // команд вверх
    Writeln(seCMoveUp.Value);
    // команд вниз
    Writeln(seCMoveDown.Value);

  // таблица результатов
  with sgResults do begin
    Writeln(ColCount);
    Writeln(RowCount);

    for j:= 0 to RowCount-1 do
      for i:= 0 to ColCount-1 do
        Writeln(Cells[i, j]);
  end;

  // Известные команды
  Writeln(cmdList.Count);
  for i:= 0 to cmdList.Count-1 do
    Writeln(cmdList[i]);

  // длина раунда
  Writeln(mRoundLength.Tag);
  // работа со сканером
  Writeln(mScanerMode.Tag);

  CloseFile(output);
end;

procedure TfmWWWTool.mSaveStateClick(Sender: TObject);
var
  i, j: integer;
begin
  if SaveDialog.Execute then
    case SaveDialog.FilterIndex of
      2, 3: with HTMLCreator do begin // Протокол, Результат игры
        if Copy(ExtractFileExt(SaveDialog.FileName), 1, 4) <> '.htm' then
          SaveDialog.FileName:= SaveDialog.FileName + '.html';
        Tag:= 3 - SaveDialog.FilterIndex;
        TemplateFileName:= ExtractFilePath(Application.ExeName) + 'результаты.tht';
        HTMLFileName:= SaveDialog.FileName;
        UpdateResults(true);
        WriteHTML
      end;
      1: begin// Состояние игры
        if ExtractFileExt(SaveDialog.FileName) <> '.state' then
          SaveDialog.FileName:= SaveDialog.FileName + '.state';
        procSaveState(SaveDialog.FileName)
      end
      else
        with HTMLCreator do begin
          if Copy(ExtractFileExt(SaveDialog.FileName), 1, 4) <> '.htm' then
            SaveDialog.FileName:= SaveDialog.FileName + '.html';
          Tag:= 1;
          TemplateFileName:= '';
          i:= 0;
          j:= 1;
          while i < SaveDialog.FilterIndex*2 - 1 do begin
            if i = SaveDialog.FilterIndex*2 - 2 then
              TemplateFileName:= TemplateFileName + SaveDialog.Filter[j];
            inc(j);
            if SaveDialog.Filter[j] = '|' then begin
              inc(i);
              inc(j);
            end;
          end;
          TemplateFileName:= ExtractFilePath(Application.ExeName) + TemplateFileName + '.tht';
          HTMLFileName:= SaveDialog.FileName;
          UpdateResults(true);
          WriteHTML
        end
    end
end;

// загрузка таблицы sgGame и некоторых ее параметров. Если
// таблица сохранена другой версией - данные не загружаю

procedure TfmWWWTool.procLoadState(const FileName: String);
var
  i, j, param: integer;
  Str: String;
begin
  AssignFile(input, FileName);
  Reset(input);

  Readln(Str);
  if Str <> ID_STR then begin
    MessageBox(handle, 'Файл не является состоянием игры или создан другой версией этой программы', 'Ошибка', MB_OK or MB_ICONERROR);
    CloseFile(input);
    exit;
  end;

  Readln(Str);
  // название игры
  Caption:= Str;
  Application.Title:= Str;

  // разминка
  Readln(param);
  if mRasminkaExist.Tag <> param then
    mRasminkaExist.Click;

  // переходить к вопросу №1
  Readln(param);
  if mJumpTo1.Tag <> param then
    mJumpTo1.Click;

  // после перехода - пометить
  Readln(param);
  if mJumpThenCheck.Tag <> param then
    mJumpThenCheck.Click;

  // результат
  Readln(param);
  if mResult.Tag <> param then
    mResult.Click;

  // один результат - одно/разные места
  Readln(param);
  if mPlaceType.Tag <> param then
    mPlaceType.Click;

  // динамическое обновление
  Readln(param);
  if mUpdateResults.Tag <> param then
    mUpdateResults.Click;

  // помечать правильные
  Readln(param);
  if mTFCheck.Tag <> param then
    mTFCheck.Click;

  // показывать названия команд
  Readln(param);
  if mShowNames.Tag <> param then
    mShowNames.Click;

  // показывать рейтинг
  Readln(param);
  if mShowRating.Tag <> param then
    mShowRating.Click;

  // показывать количество правильных ответов
  Readln(param);
  if mShowAnss.Tag <> param then
    mShowAnss.Click;

  // показывать фокус
  Readln(param);
  if mShowFocus.Tag <> param then
    mShowFocus.Click;

  // строка состояния
  Readln(param);
  if mStatusBar.Tag <> param then
    mStatusBar.Click;

  // команд вниз
  Readln(param);
  mTimerLength.Tag:= param;

  // сама таблица
  with sgGame do begin
    Readln(param); ColCount:= param;
    Readln(param); RowCount:= param;

    for j:= 0 to RowCount-1 do
      for i:= 0 to ColCount-1 do begin
        Readln(Str);
        Cells[i, j]:= Str
      end;
  end;

  // Активная страница
  Readln(param);
  PageControl.ActivePageIndex:= param;
  PageControlChange(nil);

  // Отборочная
    // количество лиг
    Readln(param);
    seLCount.Value:= param;

    // распределять команды с нулевым результатом
    Readln(param);
    cbUseNull.Checked:= boolean(param);

  // Очередная
    // основная лига
    Readln(param);
    edBLevel.Tag:= param;

    // команд вверх
    Readln(param);
    seCMoveUp.Value:= param;

    // команд вниз
    Readln(param);
    seCMoveDown.Value:= param;

  // таблица результатов
  with sgResults do begin
    Readln(param); ColCount:= param;
    Readln(param); RowCount:= param;

    for j:= 0 to RowCount-1 do
      for i:= 0 to ColCount-1 do begin
        Readln(Str);
        Cells[i, j]:= Str
      end;
  end;

  // Известные команды
  Readln(param);
  for i:= 0 to param-1 do begin
    Readln(Str);
    cmdList.Add(Str)
  end;
  cmdList.Sort;

  if not eof(input) then begin
    Readln(param);
    mRoundLength.Tag:= param;
  end else
    mRoundLength.Tag:= 4;

  if not eof(input) then begin
    Readln(param);
    if mScanerMode.Tag <> param then
      mScanerMode.Click
  end else
    if mScanerMode.Tag <> 1 then
      mScanerMode.Click;

  // заключительные штрихи
  case PageControl.ActivePageIndex of
  0:
    CountLevels;
  1:
    edBLevel.Text:= GetLevelName(edBLevel.Tag);
  end;

  CloseFile(input);

  mShowNames.Click;
  mShowNames.Click;

  sgResults.Repaint

end;

procedure TfmWWWTool.mLoadStateClick(Sender: TObject);
begin
  if OpenState.Execute then
    procLoadState(OpenState.FileName)

end;

procedure TfmWWWTool.mHTMLHelpClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(ExtractFilePath(Application.ExeName)+'doc\index.html'), nil, nil, SW_SHOW);
end;


procedure TfmWWWTool.mMailClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'mailto:Тамаревский Алексей<mirror@lyceum.nstu.ru>?subject=Использование программы WWWTool', nil, nil, SW_SHOW);
end;

procedure TfmWWWTool.mGNUGPLClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(ExtractFilePath(Application.ExeName)+'gpl.txt'), nil, nil, SW_SHOW);
end;

procedure TfmWWWTool.mruGNUGPLClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(ExtractFilePath(Application.ExeName)+'ru gnu gpl\ar01.html'), nil, nil, SW_SHOW);
end;

// экспорт мест в формате Большой игры Первенства Сибири

procedure TfmWWWTool.mExportClick(Sender: TObject);
var
  i: integer;
begin
  if sdExport.Execute then begin
    AssignFile(output, sdExport.FileName);
    Rewrite(output);

    Writeln('Большая игра');
    with sgResults do
      for i:= 1 to RowCount-1 do
        if StrToIntDef(Cells[0, i], 0) > 0 then
          Writeln(format('%s %s', [Cells[0, i], Cells[2, i]]));

    CloseFile(output)
  end;
end;

procedure TfmWWWTool.mTimeClick(Sender: TObject);
begin
  if Timer.Enabled then begin
    mTime.Caption:= 'Время!';
    Timer.Enabled:= false
  end else begin
    Timer.Enabled:= true;
    mTime.Tag:= mTimerLength.Tag + 1;
    Timer.OnTimer(Sender)
  end
end;

procedure TfmWWWTool.TimerTimer(Sender: TObject);
begin
  mTime.Tag:= mTime.Tag - 1;
  mTime.Caption:= formatDateTime('nn:ss', mTime.Tag/24/60/60);
  if mTime.Tag = 0 then
    mTime.Click
end;

procedure TfmWWWTool.mTimerLengthClick(Sender: TObject);
var
  TL: integer;
begin
  TL:= mTimerLength.Tag;
  if InputQuery('Параметры таймера', 'Введите продолжительность засекаемого времени (в секундах)', TL) then
    if TL > 0 then
      mTimerLength.Tag:= TL
    else
      MessageBox(handle, 'Введенное вами время некорректно', 'Ошибка', MB_OK or MB_ICONERROR)

end;

procedure TfmWWWTool.mRoundLengthClick(Sender: TObject);
var
  RL: integer;
begin
  RL:= mRoundLength.Tag;
  if InputQuery('Длина раунда', 'Введите количество вопросов в раунде', RL) then
    if RL > 0 then begin
      mRoundLength.Tag:= RL;
      sgGame.Repaint
    end else
      MessageBox(handle, 'Длина раунда не может быть отрицательной', 'Ошибка', MB_OK or MB_ICONERROR)
end;

// истекло время ожидания считывания со сканера

procedure TfmWWWTool.ScanerTimerTimer(Sender: TObject);
var
  i, table, question, read_crc: integer;
//  middle: char;
begin
  ScanerTimer.Enabled:= false;
  i:= 1;
  table:= 0;
//  middle:= '*';
  // до минуса - столик команды
  while (i <= length(Scaner)) and (Scaner[i] <> '-') do begin
    table:= table*10 + StrToInt(scaner[i]);
    inc(i)
  end;

//  if i <= length(Scaner) then
//    middle:= Scaner[i];
  inc(i); // пропускаем минус

  question:= 0;
  if (i < length(Scaner)) and (Scaner[i] <> '-') then
    while (i <= length(Scaner)) and (Scaner[i] <> '-') do begin
      question:= question*10 + StrToInt(scaner[i]);
      inc(i)
    end;

  inc(i);

  read_crc:= -1;
  if i <= length(Scaner) then
    read_crc:= StrToIntDef(Copy(Scaner, i, length(Scaner)), -1);

  if (read_crc = crc(table, question)) then
    SendMessage(HWND_BROADCAST, WM_WWWTOOL_SCANER, table, question);

  Scaner:= '';
  StatusBar.SimpleText:= ''
end;

// переключение сканера

procedure TfmWWWTool.mScanerModeClick(Sender: TObject);
begin
  mScanerMode.Tag:= 1 - mScanerMode.Tag;

  if mScanerMode.Tag = 1 then
    Application.HookMainWindow(WWWToolScanerEndRead)
  else
    Application.unHookMainWindow(WWWToolScanerEndRead)
end;

// печать бланков ответов со штрих-кодами
procedure TfmWWWTool.mPrintBlanksClick(Sender: TObject);
begin
  with fmPrinter do begin
    seMin.Value:= 1;
    if comCount > 0 then
      seMax.Value:= comCount
    else
      seMax.Value:= 1;

    seQCount.Value:= sgGame.ColCount - sgGame.FixedCols - RE;

    if ShowModal = mrOk then
      PrintBlanks
  end
end;

procedure TfmWWWTool.mQCostClick(Sender: TObject);
begin
  ChangeCost(sgGame.Col - sgGame.FixedCols - RE + 1)
end;

procedure TfmWWWTool.mShowCostClick(Sender: TObject);
var
  i, j: integer;
begin
  if mShowCost.Checked then begin
    sgGame.RowCount:= sgGame.RowCount + 3;
    sgGame.FixedRows:= sgGame.FixedRows + 3;
    for i:= 0 to sgGame.ColCount-1 do
      for j:= sgGame.RowCount-1-3 downto sgGame.FixedRows-3 do
        sgGame.Cells[i, j+3]:= sgGame.Cells[i, j];
  end else begin
    for i:= 0 to sgGame.ColCount-1 do
      for j:= sgGame.FixedRows to sgGame.RowCount-1 do
        sgGame.Cells[i, j-3]:= sgGame.Cells[i, j];
    sgGame.RowCount:= sgGame.RowCount - 3;
    sgGame.FixedRows:= sgGame.FixedRows - 3;
  end;
  sgGame.Repaint

end;

procedure TfmWWWTool.mAllowEmptyAnswersClick(Sender: TObject);
var
  i, j: integer;
begin
  if not mAllowEmptyAnswers.Checked then begin
    // если запретили пустые клетки
    for i:= sgGame.FixedCols + RE to sgGame.ColCount-1 do
      if Rating(i - RE - sgGame.FixedCols + 1) > 0 then
        // нахожу пропущенные командой вопросы
        for j:= sgGame.FixedRows to sgGame.RowCount-1 do
          if sgGame.Cells[i, j] = '' then
            // и помечаю как неверно отвеченые
            sgGame.Cells[i, j]:= ANS_WRONG + tail(sgGame.Cells[i, j]);

    // принудительно обновляю результаты
    UpdateResults(true);
  end;
end;

procedure TfmWWWTool.mAddCopyClick(Sender: TObject);
var
  src: integer;
  i, j: integer;
begin
  src:= 1;
  if InputQuery('Добавить копию', 'Введите номер раунда, стоимость вопросов которых Вы хотите скопировать', src, (sgGame.ColCount - sgGame.FixedCols - RE) div mRoundLength.Tag) then if src > 0 then begin
    sgGame.ColCount:= sgGame.ColCount + mRoundLength.Tag;
    for i:= 1 to (sgGame.ColCount - sgGame.FixedCols - RE) mod mRoundLength.Tag do
      for j:= 0 to sgGame.RowCount-1 do
        sgGame.Cells[sgGame.ColCount - i, j]:= sgGame.Cells[sgGame.ColCount - i - mRoundLength.Tag, j];

    for i:= 1 to mRoundLength.Tag do begin
      sgGame.Cells[sgGame.ColCount-1 - (sgGame.ColCount - sgGame.FixedCols - RE) mod mRoundLength.Tag - (mRoundLength.Tag - i), 0]:=
        format('%d %d %d %d', [0, Cost(0, (src - 1)*mRoundLength.Tag + i), Cost(1, (src - 1)*mRoundLength.Tag + i), Cost(2, (src - 1)*mRoundLength.Tag + i)]);
      for j:= 1 to sgGame.RowCount-1 do
        sgGame.Cells[sgGame.ColCount-1 - (sgGame.ColCount - sgGame.FixedCols - RE) mod mRoundLength.Tag - (mRoundLength.Tag - i), j]:= '';
    end;

  end;

end;

procedure TfmWWWTool.mQCostCommClick(Sender: TObject);
begin
  ChangeCost(sgGame.Col - sgGame.FixedCols - RE + 1, sgGame.Row);
end;

procedure TfmWWWTool.mPrivQCostClick(Sender: TObject);
begin
  ChangeCost(mPrivQCost.Tag - sgGame.FixedCols - RE + 1, pmGrid.Tag);
end;

end.

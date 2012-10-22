unit HTMLCreator;
(*
    HTMLCreator - компонент для создания HTML файлов по шаблонам
    Copyright (C) 2003, Тамаревский Алексей

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

    С автором данного компонента можно связаться по адресу mirror@lyceum.nstu.ru.
*)
interface

uses
  Classes;


type
  TOnGetValue = procedure (Sender: TObject; Name: String; var Value: String) of object;
  THTMLCreator = class(TComponent)
  private
    FTemplateFileName: String;
    FHTMLFileName: String;
    FOnGetValue: TOnGetValue;
    FOnEndWriting: TNotifyEvent;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Файл шаблона }
    property TemplateFileName: String read FTemplateFileName write FTemplateFileName;
    { Генерируемый файл }
    property HTMLFileName: String read FHTMLFileName write FHTMLFileName;
    { Событие возникает при встрече в файле строчки вида $Variable$ }
    property OnGetValue: TOnGetValue read FOnGetValue write FOnGetValue;
    { Cобытие возникает при успешном завершении работы метода WriteHTML (см. далее) }
    property OnEndWriting: TNotifyEvent read FOnEndWriting write FOnEndWriting;
    { Метод для создания файла-результата }
    procedure WriteHTML;
  end;

procedure Register;

implementation

constructor THTMLCreator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTemplateFileName:= '';
  FHTMLFileName:= '';
end;

destructor THTMLCreator.Destroy;
begin
  inherited Destroy
end;

procedure THTMLCreator.WriteHTML;
var ch: char; S, Value: String;
    store: boolean; { Хранит название переменной }
begin
  AssignFile(input, FTemplateFileName);
  ReSet(input);
  AssignFile(output, FHTMLFileName);
  ReWrite(output);
  S:= ''; store:= false;
  while not Eof do begin
    Read(ch);
    if ch = '$' then store:= not store;
    if store and (ch <> '$') then S:= S + ch
    else
      if (S = '') and (ch <> '$') then Write(ch) else begin
        if Assigned(FOnGetValue) then
           FOnGetValue(Self, S, Value)
        else Value:= '0';
        Write(Value);
        Value:= '';
        S:= '';
      end;
  end;
  CloseFile(input);
  CloseFile(output);
  if Assigned(FOnEndWriting) then FOnEndWriting(Self)
end;

procedure Register;
begin
  RegisterComponents('Samples', [THTMLCreator]);
end;

end.
 
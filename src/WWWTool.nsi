#   WWWTool - "What? Where? When?" Tool -
#   Инструмент для проведения игр рода "Что? Где? Когда?"
#   Скрипт для установки программы
#   Copyright (C) 2004-2007, Тамаревская Анна Георгиевна и Тамаревский Алексей
#
#   This file is free software, and not subject to GNU Public License
#   restrictions; you can redistribute it and/or modify it in any way
#   you see fit. This file is suitable for inclusion in a derivative
#   work, regardless of license on the work or availability of source code
#   to the work. If you redistribute this file, you must leave this
#   header intact.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#   С авторами данной программы можно связаться по адресу mirror@lyceum.nstu.ru.


# устанавливаем лучшее сжатие
SetCompressor /SOLID lzma
                             
# версия программы
!define VERSION     "0.4"
#!define SUFFIX      ""
#!define FILE_SUFFIX ""

# цифровой вид даты (подверсия программы)
!define DATE_VAL "20070213"
# строковая дата
!define DATE_STR "13 февраля 2007"

Function .onInit
  ClearErrors
  ReadRegStr $R0 HKLM "Software\Microsoft\Internet Explorer" "Version"
  IfErrors old_explorer lbl_456

  lbl_456: ; ie 4+
    StrCpy $R0 $R0 1
    StrCmp $R0 "4" old_explorer
  Goto lbl_done

  old_explorer:
    MessageBox MB_YESNO|MB_ICONEXCLAMATION \
      "Для полноценной работы программы необходима версия Microsoft Internet Explorer старше 4.$\nПродолжить?" \
      IDYES lbl_done
    Abort

  lbl_done:
FunctionEnd

# подключение современного стиля
!include "FontReg.nsh"
!include "FontName.nsh"
!include "MUI.nsh"

# название устанавливаемого приложения
!ifndef SUFFIX
  Name    "WWWTool, версия ${VERSION}"
!else
  Name    "WWWTool, версия ${VERSION} ${SUFFIX}"
!endif
# имя получаемого файла
!ifndef FILE_SUFFIX
  OutFile "..\stable\WWWTool-${VERSION}-${DATE_VAL}.exe"
!else
  OutFile "..\stable\WWWTool-${VERSION}-${FILE_SUFFIX}-${DATE_VAL}.exe"
!endif

# раскрывазывать кнопку "Детали..."
ShowInstDetails show
ShowUninstDetails show

# по умолчанию ставим в C:\Program Files
InstallDir "$PROGRAMFILES\WWWTool"

# Значок программ установки и удаления
!define MUI_ICON   "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

# Картинка вверху
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP   "${NSISDIR}\Contrib\Graphics\Header\orange-r.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall-r.bmp"

# картинка сбоку на страницах приветствия и окончания
!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp"

# короткие описания внизу списка компонентов
!define MUI_COMPONENTSPAGE_SMALLDESC
# предупреждать о завершении
!define MUI_ABORTWARNING


# Установщик:
	# приветствие
	!define      MUI_WELCOMEPAGE_TITLE_3LINES
	!insertmacro MUI_PAGE_WELCOME
	# лицензия
	!define      MUI_LICENSEPAGE_RADIOBUTTONS
	!insertmacro MUI_PAGE_LICENSE "..\gpl.txt"
	# выбор компонентов
	!insertmacro MUI_PAGE_COMPONENTS
	# выбор директории
	!insertmacro MUI_PAGE_DIRECTORY
	# непосредственно установка
	!insertmacro MUI_PAGE_INSTFILES
	# готово
	!define      MUI_FINISHPAGE_TITLE_3LINES
	!insertmacro MUI_PAGE_FINISH
# /Установщик

# Удалятор:
	# приветствие
	!define      MUI_WELCOMEPAGE_TITLE_3LINES
	!insertmacro MUI_UNPAGE_WELCOME
	# подтвердите удаление
	!insertmacro MUI_UNPAGE_CONFIRM
	# непосредственно удаление
	!insertmacro MUI_UNPAGE_INSTFILES
	# прощание
	!define      MUI_FINISHPAGE_TITLE_3LINES
	!insertmacro MUI_UNPAGE_FINISH
# /Удалятор

# язык интерфейса - русский
!insertmacro MUI_LANGUAGE "Russian"

Section "Запускаемая часть" binary
	# можно сделать эту секцию необходимой... но зачем?
	#SectionIn RO

	SetOutPath "$INSTDIR"
	File "..\*.*"

	# взято из http://nsis.sourceforge.net/Register_Fonts
	# установка шрифта
	StrCpy $FONT_DIR $FONTS
	!insertmacro InstallTTFFont "..\src\Stacc222.ttf"
	!insertmacro InstallTTFFont "..\src\Barcode.ttf"

	# обновление списка шрифтов запущенных приложений
	SendMessage ${HWND_BROADCAST} ${WM_FONTCHANGE} 0 0 /TIMEOUT=5000

	# ярлык на бинарник на рабочий стол текущего пользователя
	SetOutPath "$DOCUMENTS"
	CreateShortcut "$DESKTOP\WWWTool.lnk" "$INSTDIR\WWWTool.exe"

	# все остальные ярлыки - в "пуск" на всех пользователей
	SetShellVarContext all

	CreateDirectory "$SMPROGRAMS\WWWTool"
	CreateShortcut "$SMPROGRAMS\WWWTool\WWWTool.lnk" "$INSTDIR\WWWTool.exe"
	CreateShortcut "$SMPROGRAMS\WWWTool\GNU General Public License.lnk" "$INSTDIR\gpl.txt"

	# регистрация нового расширения
	WriteRegStr HKCR ".state" "" "WWWTool.state"
	WriteRegStr HKCR "WWWTool.state" "" "Состояние программы WWWTool"
	WriteRegStr HKCR "WWWTool.state\shell\open\command" "" "$\"$INSTDIR\WWWTool.exe$\" $\"%1$\""
	WriteRegStr HKCR "WWWTool.state\DefaultIcon" "" "$INSTDIR\WWWTool.exe,0"
SectionEnd
LangString DESC_binary ${LANG_RUSSIAN} "Скомпилированная часть программы и необходимые для работы файлы"

SectionGroup /e "Документация" doc
	Section "Справка" manual
		SetOutPath "$INSTDIR\doc"
		File /a "..\doc\*.*"

		# все остальные ярлыки - в "пуск" на всех пользователей
		SetShellVarContext all

		CreateShortcut "$SMPROGRAMS\WWWTool\Справка.lnk" "$INSTDIR\doc\index.html"
	SectionEnd
	LangString DESC_manual ${LANG_RUSSIAN} "Руководство пользователя"

	Section "Русский GNU GPL" ru_GPL
		SetOutPath "$INSTDIR\ru gnu gpl"
		File /a "..\ru gnu gpl\*.*"

		# все остальные ярлыки - в "пуск" на всех пользователей
		SetShellVarContext all

		CreateShortcut "$SMPROGRAMS\WWWTool\Русский перевод GNU GPL.lnk" "$INSTDIR\ru gnu gpl\ar01.html"
	SectionEnd
	LangString DESC_ru_GPL ${LANG_RUSSIAN} "Перевод General Public License на русский язык"
SectionGroupEnd

Section "Исходный код" src
	# куда будут складываться новые дистрибутивы
	CreateDirectory $INSTDIR\stable

	SetOutPath "$INSTDIR\src"
	File /a /x "*.dcu" /x "*.ddp" /x "*.~*" /x "*.cfg" "..\src\*.*"
SectionEnd
LangString DESC_src ${LANG_RUSSIAN} "Исходные тексты программы и скрипта инсталляции"

# добаление описаний в список компонентов
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${binary} $(DESC_binary)
	!insertmacro MUI_DESCRIPTION_TEXT ${manual} $(DESC_manual)
	!insertmacro MUI_DESCRIPTION_TEXT ${ru_GPL} $(DESC_ru_GPL)
	!insertmacro MUI_DESCRIPTION_TEXT ${src}    $(DESC_src)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Section "-hidden"
	# что делаем в любом случае
	# создаем удалятор
	WriteUninstaller "$INSTDIR\eraser.exe"

	# пункт установка/удаление программ
	StrCpy $R0 "Software\Microsoft\Windows\CurrentVersion\Uninstall\WWWTool"
	!ifndef SUFFIX
		WriteRegStr   HKLM $R0 "DisplayName" "WWWTool, ${VERSION}"
	!else
		WriteRegStr   HKLM $R0 "DisplayName" "WWWTool, ${VERSION} ${SUFFIX}"
	!endif

	# значок
	WriteRegStr   HKLM $R0 "DisplayIcon" "$\"$INSTDIR\WWWTool.exe$\""
	# путь к удалятору
	WriteRegStr   HKLM $R0 "UninstallString" "$\"$INSTDIR\eraser.exe$\""
	# издатель
	WriteRegStr   HKLM $R0 "Publisher" "Алексей Тамаревский"
	# помощь он-лайн
	WriteRegStr   HKLM $R0 "HelpLink" "http://lyceum.nstu.ru/wwwtool/doc/"
	# обновлялка
	WriteRegStr   HKLM $R0 "URLUpdateInfo" "http://lyceum.nstu.ru/wwwtool/"
	# издатель в интернете
	WriteRegStr   HKLM $R0 "URLInfoAbout" "mailto:mirror@lyceum.nstu.ru"
	# версия
	WriteRegStr   HKLM $R0 "DisplayVersion" "${VERSION}, от ${DATE_STR}"
	# только кнопка "Удалить"
	WriteRegDWORD HKLM $R0 "NoModify" 1
	WriteRegDWORD HKLM $R0 "NoRepair" 1
SectionEnd

Section "Uninstall"
	# суицид
	Delete $INSTDIR\eraser.exe
	RMDir /r $INSTDIR

	# уборка с рабочего стола
	Delete "$DESKTOP\WWWTool.lnk"

	# уборка из главного меню
	SetShellVarContext all
	RMDir /r "$SMPROGRAMS\WWWTool"

	# разрегистрирование расширения
	DeleteRegKey HKCR ".state"
	DeleteRegKey HKCR "WWWTool.state"

	# удаление из списка удаляемых
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WWWTool"
SectionEnd
lessThan(QT_VERSION, 4.6) {
	error("Peg-E requires Qt 4.6 or greater")
}

TEMPLATE = app
greaterThan(QT_MAJOR_VERSION, 4) {
	QT += widgets
}
CONFIG += warn_on
QMAKE_CXXFLAGS += -std=c++11

VERSION = 1.1.2
DEFINES += VERSIONSTR=\\\"$${VERSION}\\\"

unix: !macx {
	TARGET = peg-e
} else {
	TARGET = Peg-E
}

HEADERS = src/board.h \
	src/hole.h \
	src/locale_dialog.h \
	src/movement.h \
	src/peg.h \
	src/puzzle.h \
	src/window.h

SOURCES = src/board.cpp \
	src/hole.cpp \
	src/locale_dialog.cpp \
	src/main.cpp \
	src/movement.cpp \
	src/peg.cpp \
	src/puzzle.cpp \
	src/window.cpp

TRANSLATIONS = $$files(translations/pege_*.ts)

macx {
	ICON = icons/peg-e.icns

	ICONS.files = icons/oxygen/hicolor
	ICONS.path = Contents/Resources/icons

	QMAKE_BUNDLE_DATA += ICONS
} else:win32 {
	RC_FILE = icons/icon.rc
} else:unix {
	RESOURCES = icons/icon.qrc

	isEmpty(PREFIX) {
		PREFIX = /usr/local
	}
	isEmpty(BINDIR) {
		BINDIR = bin
	}

	target.path = $$PREFIX/$$BINDIR/

	icon.files = icons/hicolor/*
	icon.path = $$PREFIX/share/icons/hicolor

	pixmap.files = icons/peg-e.xpm
	pixmap.path = $$PREFIX/share/pixmaps

	icons.files = icons/oxygen/hicolor/*
	icons.path = $$PREFIX/share/peg-e/icons/hicolor

	desktop.files = icons/peg-e.desktop
	desktop.path = $$PREFIX/share/applications

	appdata.files = icons/peg-e.appdata.xml
	appdata.path = $$PREFIX/share/appdata/

	qm.files = translations/*.qm
	qm.path = $$PREFIX/share/peg-e/translations

	man.files = doc/peg-e.6
	man.path = $$PREFIX/share/man/man6

	INSTALLS += target icon pixmap desktop appdata icons qm man
}

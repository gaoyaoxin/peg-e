lessThan(QT_VERSION, 4.6) {
	error("Peg-E requires Qt 4.6 or greater")
}

TEMPLATE = app
greaterThan(QT_MAJOR_VERSION, 4) {
	QT += widgets
}
CONFIG += warn_on

VERSION = $$system(git rev-parse --short HEAD)
isEmpty(VERSION) {
	VERSION = 0
}
DEFINES += VERSIONSTR=\\\"git.$${VERSION}\\\"

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

RESOURCES = icons/icon.qrc
macx {
	ICON = icons/peg-e.icns
} else:win32 {
	RC_FILE = icons/icon.rc
}

unix: !macx {
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

	desktop.files = icons/peg-e.desktop
	desktop.path = $$PREFIX/share/applications

	qm.files = translations/*.qm
	qm.path = $$PREFIX/share/peg-e/translations

	INSTALLS += target icon pixmap desktop qm
}

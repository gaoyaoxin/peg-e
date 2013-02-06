/***********************************************************************
 *
 * Copyright (C) 2009, 2012, 2013 Graeme Gott <graeme@gottcode.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 ***********************************************************************/

#include "locale_dialog.h"
#include "window.h"

#include <QApplication>

/**
 * Program entry point.
 *
 * @param argc amount of command line arguments
 * @param argv command line arguments
 * @return @c 0 on successful exit
 */
int main(int argc, char** argv)
{
	QApplication app(argc, argv);
	app.setApplicationName("Peg-E");
	app.setApplicationVersion(VERSIONSTR);
	app.setOrganizationDomain("gottcode.org");
	app.setOrganizationName("GottCode");
	{
		QIcon fallback(":/hicolor/256x256/apps/peg-e.png");
		fallback.addFile(":/hicolor/128x128/apps/peg-e.png");
		fallback.addFile(":/hicolor/64x64/apps/peg-e.png");
		fallback.addFile(":/hicolor/48x48/apps/peg-e.png");
		fallback.addFile(":/hicolor/32x32/apps/peg-e.png");
		fallback.addFile(":/hicolor/24x24/apps/peg-e.png");
		fallback.addFile(":/hicolor/22x22/apps/peg-e.png");
		fallback.addFile(":/hicolor/16x16/apps/peg-e.png");
#if (QT_VERSION >= (QT_VERSION_CHECK(4,6,0)))
		app.setWindowIcon(QIcon::fromTheme("peg-e", fallback));
#else
		app.setWindowIcon(fallback);
#endif
	}

#ifdef Q_OS_MAC
	app.setAttribute(Qt::AA_DontShowIconsInMenus, true);
#endif

	LocaleDialog::loadTranslator("pege_");

	Window window;
	window.show();

	return app.exec();
}

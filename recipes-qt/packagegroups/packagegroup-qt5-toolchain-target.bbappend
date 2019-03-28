#remove qtwebkit
RDEPENDS_${PN}_remove = "qtwebkit-dev qtwebkit-mkspecs qtwebkit-qmlplugins"
RDEPENDS_${PN}_remove = "qtcharts-dev qtcharts-mkspecs qtcharts-qmlplugins"

#removed upstream at master
RDEPENDS_${PN}_remove = "qtquick1-dev qtquick1-mkspecs qtquick1-plugins qtquick1-qmlplugins qttranslations-qtquick1 qttranslations-qt"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "customvideofilter.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<CustomVideoFilter>("qlsoft.car.collisionassist", 1, 0, "CustomVideoFilter");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}


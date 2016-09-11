#ifndef CUSTOMVIDEOFILTER_H
#define CUSTOMVIDEOFILTER_H

#include <QVideoFilterRunnable>
#include <QAbstractVideoFilter>

class CustomFilterRunnable : public QVideoFilterRunnable
{
public:
    QVideoFrame run(QVideoFrame *input, const QVideoSurfaceFormat &surfaceFormat, RunFlags flags);
};

class CustomVideoFilter : public QAbstractVideoFilter
{
    Q_OBJECT
public:
    QVideoFilterRunnable *createFilterRunnable() { return new CustomFilterRunnable; }
signals:
    void finished(QObject* result);
};

#endif // CUSTOMVIDEOFILTER_H

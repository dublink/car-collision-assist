#include "customvideofilter.h"

#include <QDebug>

QVideoFrame CustomFilterRunnable::run(QVideoFrame *input, const QVideoSurfaceFormat &/*surfaceFormat*/, RunFlags /*flags*/)
{
    // TODO: KC: apply filters
    return *input;
}

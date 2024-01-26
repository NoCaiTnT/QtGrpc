#ifndef CLIENTWINDOW_H
#define CLIENTWINDOW_H

#include <QMainWindow>
#include "clientgreeter.h"

QT_BEGIN_NAMESPACE
namespace Ui {
class ClientWindow;
}
QT_END_NAMESPACE

class ClientWindow : public QMainWindow
{
    Q_OBJECT

public:
    ClientWindow(QWidget *parent = nullptr);
    ~ClientWindow();

private:
    Ui::ClientWindow *ui;
    ClientGreeter *greeter;

public slots:
    void clickButton();
};
#endif // CLIENTWINDOW_H

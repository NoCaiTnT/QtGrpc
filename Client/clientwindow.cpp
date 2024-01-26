#include "clientwindow.h"
#include "ui_clientwindow.h"

ClientWindow::ClientWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::ClientWindow)
{
    ui->setupUi(this);
    connect(ui->pushButton, SIGNAL(clicked(bool)), this, SLOT(clickButton()));
    greeter = new ClientGreeter(grpc::CreateChannel("localhost:50051",grpc::InsecureChannelCredentials()));
}

ClientWindow::~ClientWindow()
{
    delete ui;
}

void ClientWindow::clickButton()
{
    QString input = ui->input->toPlainText();
    std::string reply = greeter->SayHello(input.toStdString());
    ui->output->setPlainText(reply.c_str());
}
